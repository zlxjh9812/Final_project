package com.spring.biz.view.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.spring.biz.socialLogin.GoogleLogin;
import com.spring.biz.socialLogin.KakaoLogin;
import com.spring.biz.socialLogin.NaverLogin;
import com.spring.biz.user.UserService;
import com.spring.biz.user.UserVO;

@Controller
@SessionAttributes({"SocialUser","User"})
public class SocialLoginContoller {
	@Autowired
	private UserService userService;
	
	public static String StringReplace(String str){       
	    String match = "[^0-9]";
	    str = str.replaceAll(match, "");
	    return str;
	}

	
	//GoogleLogin
	@GetMapping("/login/googel/auth")
	public String googleLogin(Model m, @RequestParam String code,String nickname,String tel,HttpServletResponse response, HttpSession ses,RedirectAttributes attr) throws IOException {
		JsonNode jsonToken = GoogleLogin.getAccessToken(code);
		String accessToken = jsonToken.get("access_token").toString();
		String refreshToken = "";
		if (jsonToken.has("refresh_token")) {
			refreshToken = jsonToken.get("refresh_token").toString();
		}

		String expiresTime = jsonToken.get("expires_in").toString();
		

		// Access Token으로 사용자 정보 반환
		JsonNode userInfo = GoogleLogin.getGoogleUserInfo(accessToken);
		System.out.println(userInfo);
		String email = userInfo.get("email").asText();
		String Name = userInfo.get("name").asText();
		String profileImg = userInfo.get("picture").asText();
		UserVO vo = new UserVO();
		vo.setUserId("google_"+email);
		vo.setEmail(email);;
		vo.setName(Name);
		vo.setNickname(nickname);
		vo.setTel(tel);
		vo.setProfileImg(profileImg);
		System.out.println(vo.getNickname());
		UUID uid = UUID.randomUUID();
		String password = uid.toString();
		vo.setPassword(password);
		UserVO user =  userService.idCheck(vo);
		System.out.println(userInfo);
		if(user == null && vo.getNickname() == null && vo.getTel() == null) {
			m.addAttribute("SocialUser",vo);
			return "redirect:/nickNameSet.do";
		}else if(user == null) {
			userService.insertUser(vo);
			m.addAttribute("User",userService.idCheck(vo));
			return "redirect:/";
		}
		System.out.println(userInfo);
		m.addAttribute("User",userService.idCheck(vo));
		return "redirect:/";
	}
	//NaverLogin
	@GetMapping("/login/naver/auth")
	public String naverLogin(Model m, @RequestParam String code, @RequestParam String state,
			HttpSession ses) {

		
		JsonNode jsonToken = NaverLogin.getAccessToken(code,state); 
		String accessToken = jsonToken.get("access_token").toString(); 
		String refreshToken ="";
		if(jsonToken.has("refresh_token")) { 
			refreshToken = jsonToken.get("refresh_token").toString(); 
		}
		 
		String expiresTime = jsonToken.get("expires_in").toString();
		
		 
		
		// Access Token으로 사용자 정보 반환 
		JsonNode userInfo = NaverLogin.getGoogleUserInfo(accessToken);
		
		 
		String email = userInfo.get("response").get("email").asText();
		String Name = userInfo.get("response").get("name").asText();
		String nickname = userInfo.get("response").get("nickname").asText();
		String profile_img = userInfo.get("response").get("profile_image").asText();
		String mobile = userInfo.get("response").get("mobile").asText();
		UserVO vo=new UserVO();
		 System.out.println(userInfo);
		
		 System.out.println( StringReplace(mobile) + "tel");
		// 사용자 정보 출력
		 vo.setEmail(email);
		 vo.setUserId("Naver_"+email);
		 vo.setName(Name);
		 vo.setNickname(nickname);
		 vo.setProfileImg(profile_img);
		 vo.setTel(StringReplace(mobile));
		 UUID uid = UUID.randomUUID();
		String password = uid.toString();
		vo.setPassword(password);
		if(userService.idCheck(vo) == null) {
			userService.insertUser(vo);
			m.addAttribute("User",userService.idCheck(vo));
			
		}else {
			m.addAttribute("User",userService.idCheck(vo));
		}
		
		// 가입 되지 않은 아이디라면 DB에 추가하고 세션에 추가

		
		 
		return "redirect:/";
	}

	//카카오 로그인
	@GetMapping("/login/kakao/auth")
	public String kakaoLogin(Model m,@RequestParam String code,HttpSession ses) {
		
		
		JsonNode jsonToken = KakaoLogin.getAccessToken(code); 
		String accessToken = jsonToken.get("access_token").toString(); 
		String refreshToken ="";
		if(jsonToken.has("refresh_token")) { 
			refreshToken = jsonToken.get("refresh_token").toString(); 
		}
		 
		String expiresTime = jsonToken.get("expires_in").toString();
		
		 
		 
		// Access Token으로 사용자 정보 반환 
		JsonNode userInfo = KakaoLogin.getGoogleUserInfo(accessToken);

		System.out.println(userInfo);
		String Name = userInfo.get("kakao_account").get("profile").get("nickname").asText();
		String email = userInfo.get("kakao_account").get("email").asText();
		
		UserVO vo=new UserVO();
		
		vo.setUserId("kakao_"+email);
	
		UUID uid = UUID.randomUUID();
		String password = uid.toString();
		
		
		// 사용자 정보 출력
		
		
		// 가입된 아이디인지 검색
		

	
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/testGoolge.do")
	public String testGoogle() {
		return "/test/logintest";
	}
	@RequestMapping(value = "/nickNameSet.do")
	public String nickNameSet() {
		System.out.println("nickNameSet");
		return "user/nickNameSet";
	}
	@RequestMapping(value = "socialInsert.do")
	public String socialInsert(Model m,HttpSession session,UserVO vo) {
		UserVO Svo = (UserVO) session.getAttribute("SocialUser");
		Svo.setNickname(vo.getNickname());
		Svo.setTel(vo.getTel());
		System.out.println(Svo.getUserId());
		System.out.println(Svo.getPassword());
		System.out.println(Svo.getTel());
		System.out.println(Svo.getEmail());
		System.out.println(Svo.getName());
		System.out.println(Svo.getNickname());
		userService.insertUser(Svo);
		m.addAttribute("User",userService.idCheck(Svo));
		return "redirect:/";
	}
}
