package com.spring.biz.view.user;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.mysql.fabric.Response;
import com.spring.biz.user.UserService;
import com.spring.biz.user.UserVO;
import com.spring.biz.view.email.MailSendService;

@Controller
@SessionAttributes({"User"})

public class UserController {
	
	@Autowired
	private MailSendService mailService;
	@Autowired
	private UserService userService;

	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	@RequestMapping(value = "/insertUser.do")
	public String insertUser(UserVO vo,HttpServletResponse response) throws IOException {
		System.out.println("회원가입");
	
		vo.setPassword(pwdEncoder.encode(vo.getPassword()));
		System.out.println(vo.getUserId());
		System.out.println(vo.getNickname());
		userService.insertUser(vo);
		System.out.println("error1");
		System.out.println(vo.getNickname());
		
		
		System.out.println("error2");
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('회원가입이 완료되었습니다. 로그인을 해주세요');location.href='mainpage.do'</script>");
        out.flush();
		return "index";
	}
	
	@RequestMapping(value = "/login.do", method =RequestMethod.GET)
	public String loginView(UserVO vo) {
		System.out.println("로그인 화면으로 이동");
		return "login.jsp";
	}
	@RequestMapping(value = "/login.do", method =RequestMethod.POST)
	public String login(UserVO vo, Model model, HttpServletResponse response) throws IOException {
		System.out.println("로그인 시도");
		System.out.println(vo.getUserId());
		boolean result = false;
		UserVO User = userService.idCheck(vo);
		if(User!= null) {
		 result = pwdEncoder.matches(vo.getPassword(),User.getPassword());
		System.out.println(result);
		}
		if(User!=null && result) {
			System.out.println("로그인 완료");
			model.addAttribute("User", userService.idCheck(vo));
			System.out.println(vo.getUserId());
		
			return "redirect:mainpage.do";
		}else if(User!=null&&User.getRole().equals("관리자")) {
			PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인 정보를 확인해주세요.');location.href='getReviewReport.do';</script>");
            out.flush();
            return "index";
		}else {
			 	response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
	            out.flush();
			System.out.println("로그인 실패");
			return "index";
		}
		
	}
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session,HttpServletResponse response) throws IOException {

		System.out.println("로그아웃 처리");
		
		// 1. 브라우저와 연결된 세션 객체를 강제로 종료한다.
		session.invalidate();
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('로그아웃되었습니다.');location.href='mainpage.do';</script>");
        out.flush();
		// 2. 세션 종료후, 메인 화면으로 이동한다.
		return "redirect:mainpage.do";

	}

	
	@ResponseBody
	@RequestMapping(value = "/checkID.do",method=RequestMethod.GET)
	public int checkID(UserVO vo) {
		int reuslt = 0;
		
		System.out.println(vo.getUserId());
		
		if(userService.idCheck(vo)!=null) {reuslt = 1;}else {reuslt = 0;}
		System.out.println(reuslt);
		return reuslt;
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkNickName.do",method=RequestMethod.GET)
	public int checkNickName(UserVO vo) {
		int reuslt = 0;
		System.out.println(vo.getNickname());
		if(userService.getNickname(vo)!=null) {reuslt = 1;}else {reuslt = 0;}
		System.out.println(reuslt);
		return reuslt;
	}
	@ResponseBody
	@RequestMapping(value="/emailCheck.do")
	public String emailCheck(String email) {
		System.out.println("이메일 인증 요청");
		System.out.println("이메일 인증 이메일 : " + email);
		String code = mailService.joinEmail(email);
		System.out.println(code);
		return code;
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkTel.do",method=RequestMethod.GET)
	public int checkTel(UserVO vo) {
		int reuslt = 0;
		
		System.out.println(vo.getTel());
		
		
		if(userService.telCheck(vo)!=null) {reuslt = 1;}else {reuslt = 0;}
		System.out.println(reuslt);
		return reuslt;
	}
	
	@ResponseBody
	@RequestMapping(value="/findEmailCheck.do")
	public String findEmailCheck(String email,UserVO vo) {
		String code = null;
		System.out.println("이메일 인증 요청");
		System.out.println("이메일 인증 이메일 : " + email);
		System.out.println(vo.getTel());
		if(userService.emailCheck(vo)!=null) {
		 code = mailService.joinEmail(email);
		System.out.println(code);
		}else {
			 code = "false";
			 System.out.println(code);
		}
		return code;
	}
	@RequestMapping(value = "/findId.do")
	public String findId(UserVO vo,Model model) {
		UserVO User = userService.emailCheck(vo);
		model.addAttribute("id",User.getUserId());
		return "user/resultId";
	}
	@ResponseBody
	@RequestMapping(value="/findPassword.do")
	public String findPassword(String email,UserVO vo) {
		String code = null;
		System.out.println("이메일 인증 요청");
		System.out.println("이메일 인증 이메일 : " + email);
		System.out.println(vo.getTel());
		if(userService.FindPassword(vo)!=null) {
		 code = mailService.joinEmail(email);
		System.out.println(code);
		}else {
			 code = "false";
			 System.out.println(code);
		}
		return code;
	}
	@RequestMapping(value = "/updatePassword.do")
	public String updatePassword(UserVO vo,Model model,HttpServletResponse response) throws IOException {
		vo.setPassword(pwdEncoder.encode(vo.getPassword()));
		System.out.println(vo.getUserId());
		System.out.println(vo.getPassword());
		System.out.println(vo.getEmail());
		System.out.println(vo.getTel().getClass().getTypeName());
		userService.updatePassword(vo);
		System.out.println(1);
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('비밀번호가 변경되었습니다 다시 로그인 해주세요.');location.href='/';</script>");
        System.out.println(2);
        out.flush();
        return "user/result";
	}
	@RequestMapping(value = "/findIdgo.do")
	public String findIdGo() {
		return "/user/findId";
	}
	@RequestMapping(value = "/updatePasswordGo.do")
	public String updatePasswordGo() {
		return "/user/updatePassword";
	}
	@RequestMapping(value = "sign_up.do")
	public String sign_up() {
		return "/user/sign_up";
	}
}
