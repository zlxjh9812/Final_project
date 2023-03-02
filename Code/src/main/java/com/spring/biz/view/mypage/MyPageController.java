package com.spring.biz.view.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.user.UserService;
import com.spring.biz.user.UserVO;

@Controller
@RequestMapping("mypage")
public class MyPageController {

	private final UserService userService;

	@Autowired
	public MyPageController(UserService userService) {
		this.userService = userService;
	}

	// 마이페이지 홈
	@GetMapping
	public String mypageHome(HttpSession session) {
		UserVO loginUser = (UserVO) session.getAttribute("User");
		if (loginUser == null) {
			return "redirect:/";
		}
		return "mypage/mypageHome";
	}

	// 회원정보 수정 폼
	@GetMapping("/edit")
	public String editForm(HttpSession session) {
		UserVO loginUser = (UserVO) session.getAttribute("User");

		if (loginUser == null) {
			return "redirect:/";
		}

		return "/mypage/editUser";
	}

	// 회원정보 수정 처리
	@PostMapping("/edit")
	public String edit(@ModelAttribute("user") UserVO userVO, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("User");
		userService.userEdit(userVO);

		// 세션 정보 업데이트
		UserVO updatedUser = userService.findUserById(user.getUserId());
		session.setAttribute("User", updatedUser);
		return "redirect:/mypage/edit";
	}

	// 프로필 사진 업로드
	@PostMapping("mypicture-upload")
	public String fileUpload(@RequestParam("uploadFile") MultipartFile file, HttpSession session) throws Exception {
		UserVO user = (UserVO) session.getAttribute("User");
		userService.uploadProfileImage(file, user);
		session.setAttribute("User", user);
		return "redirect:/mypage";
	}

}
