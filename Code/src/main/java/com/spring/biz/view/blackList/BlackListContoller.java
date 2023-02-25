package com.spring.biz.view.blackList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.UserBlackList.UserBlackListService;
import com.spring.biz.UserBlackList.UserBlackListVO;
import com.spring.biz.user.UserService;
import com.spring.biz.user.UserVO;
import com.spring.biz.util.PageDTO;
import com.spring.biz.util.SearchCriteria;

@Controller
public class BlackListContoller {
	
	@Autowired
	UserBlackListService blackList;
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "getAllBlackListUser.do")
	public String getAllBlackListUser(SearchCriteria cri,Model model) {
		PageDTO pageMaker = new PageDTO(cri, blackList.getAllBlackListCount(cri));
		System.out.println("TotalPage : " + pageMaker.getTotalPage());
		System.out.println("StartPage : " + pageMaker.getStartPage());
		System.out.println("EndPage : " + pageMaker.getEndPage());
		
		model.addAttribute("pageMaker", pageMaker);	// Model 정보 저장
		System.out.println("error1");
		model.addAttribute("List", blackList.getAllUser(cri));	// Model 정보 저장
		System.out.println("error2");
//		model.addAttribute("boardList", boardService.getBoardList(vo));	// Model 정보 저장
		
		return "/admin/BlackList";
	}
	
	@RequestMapping(value = "getEndDateBlackListUser.do")
	public String getEndDateBlackListUser(SearchCriteria cri,Model model) {
		PageDTO pageMaker = new PageDTO(cri, blackList.getEndDateUserCount(cri));
		System.out.println("TotalPage : " + pageMaker.getTotalPage());
		System.out.println("StartPage : " + pageMaker.getStartPage());
		System.out.println("EndPage : " + pageMaker.getEndPage());
		
		model.addAttribute("pageMaker", pageMaker);	// Model 정보 저장
		System.out.println("error1");
		model.addAttribute("EndDate", blackList.getReportUser(cri));	// Model 정보 저장
		System.out.println("error2");
//		model.addAttribute("boardList", boardService.getBoardList(vo));	// Model 정보 저장
		
		return "/admin/BlackListEndDate";
	}
	@ResponseBody
	@RequestMapping(value = "deleteReport.do")
	public String deleteReport(String arr[],UserBlackListVO vo,UserVO Ivo) {
		System.out.println(1);
		for(int i = 0;i<arr.length;i++) {
			System.out.println(arr[i]);
			vo.setUserId(arr[i]);
			Ivo.setUserId(arr[i]);
		
			blackList.DeleteReportUser(vo);
			userService.updateUserReportN(Ivo);
		}
		return "123";
	}
	
}
