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
import com.spring.biz.user.UserService;
import com.spring.biz.user.UserVO;

@Controller
@SessionAttributes({"SocialUser","User"})
public class SocialLoginContoller {
	@Autowired
	private UserService userService;
	
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
