package com.spring.biz.view.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.biz.board.BoardService;
import com.spring.biz.board.ReviewBoardVO;
import com.spring.biz.board.PageDTO;
import com.spring.biz.board.SearchCriteria;
import com.spring.biz.comment.CommentVO;
import com.spring.biz.comment.service.CommentService;
import com.spring.biz.contents.service.ContentsService;
import com.spring.biz.like.LikeVO;
import com.spring.biz.like.StarVO;
import com.spring.biz.movie.ContentsDetailVO;
import com.spring.biz.movie.ContentsVO;
import com.spring.biz.movie.SearchVO;
import com.spring.biz.user.UserService;
import com.spring.biz.user.UserVO;
import com.spring.biz.util.getContentInfo;
import com.spring.biz.util.getInfoUtil;
import com.spring.biz.util.getSearchUtil;
import com.spring.biz.view.board.MovieController.SortByLike;
import com.spring.biz.view.board.MovieController.SortByVote;

@Controller
public class MovieController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private ContentsService contentsService;
	
	@Autowired
	private UserService userService;
	
	
	public class SortByDate implements Comparator<ContentsVO> {
		@Override
		public int compare(ContentsVO o1, ContentsVO o2) {
			Date first = o1.getRelease_date();
			Date second = o2.getRelease_date();
			return second.compareTo(first);
		}
	}
	
	public class SortByLike implements Comparator<ReviewBoardVO> {
		@Override
		public int compare(ReviewBoardVO l1, ReviewBoardVO l2) {
			Integer first = l1.getLike_num();
			Integer second = l2.getLike_num();
			return second.compareTo(first);
		}
	}
	
	public class SortByVote implements Comparator<SearchVO> {
		@Override
		public int compare(SearchVO o1, SearchVO o2) {
			Float first = o1.getPopularity();
			Float second = o2.getPopularity();
			return second.compareTo(first);
		}
	}
	
	@RequestMapping({"/", "mainpage.do"})
	public String main(@RequestParam(value = "type", defaultValue = "movie") String contents_type, Model model, ReviewBoardVO vo) {

		// ?????? ????????? ???????????? ????????? (?????? ????????? ????????? ????????? ?????? ?????? ?????????)
		getInfoUtil util = new getInfoUtil();
		getContentInfo info = new getContentInfo();
		
		List<ContentsVO> release_date = util.getInfoList(contents_type);
		List<ReviewBoardVO> result = boardService.getBoardListMain(vo);
		
		for(int i=0; i<result.size();i++) {
			if(result.get(i).getReviewPic()==null) {
				int code = result.get(i).getMoviecode();
				System.out.println(code);
				String contentType= result.get(i).getContentType();
				System.out.println(contentType);
				String temp = info.getjsonObjectInfo(contentType, code).getPoster_path();
				System.out.println(temp);
				result.get(i).setReviewPic(temp);
				System.out.println(result.get(i).getReviewPic());
			}
		}
		
		// List??? ?????? ContentsVO??? ?????? ?????????????????? ??????
//		Collections.sort(release_date,new SortByDate());

		
		model.addAttribute("release_date", release_date); // ?????? ?????? ???
		model.addAttribute("type", contents_type);
				
		if (vo.getSearchCondition() == null) {
			vo.setSearchCondition("TITLE");
		}
		if (vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		
//		System.out.println("TotalPage : " + pageMaker.getTotalPage());
//		System.out.println("StartPage : " + pageMaker.getStartPage());
//		System.out.println("EndPage : " + pageMaker.getEndPage());
		
		model.addAttribute("boardList", result);	// Model ?????? ??????
//		model.addAttribute("boardList", boardService.getBoardList(vo));	// Model ?????? ??????
		
		return "index";
	}
	
	@RequestMapping(value = "ContentsDetail.do")
	public String Detail(@RequestParam(value = "type") String contents_type,Model mode,@RequestParam(value = "id") int contents_num, HttpSession session) {
		
		getContentInfo info = new getContentInfo();
		ContentsDetailVO contents = info.getInfoDetail(contents_type, contents_num);
		List<ContentsDetailVO> reco = new ArrayList<ContentsDetailVO>();
		
				// ????????? ????????? List ??????
				List<ContentsDetailVO> temp = new ArrayList<ContentsDetailVO>();
				// ?????? ?????? ???????????? ???????????? ??????
				temp = info.getInfoList(contents_type);

				for (int i = 0; i < temp.size(); i++) {
					List<Integer> list1 = new ArrayList<Integer>(temp.get(i).getGenress()); // ?????? ??????????????? ????????? for?????? ????????? ?????? ??????????????? ?????????
					List<Integer> list2 = new ArrayList<Integer>(contents.getGenress()); // ?????? ???????????? ????????? ???????????? ??????

					/* ???, ????????? ???????????? ????????? ???????????? ???????????? ????????? ????????? ?????? ?????? ?????? ??????????????? */

					// ???????????? ?????? ????????? 1?????? ??????
					if (list2.size() == 1) {
						list1.retainAll(list2);
						if (list1.size() == 1) {
							ContentsDetailVO vo = new ContentsDetailVO();
							vo = temp.get(i);
							reco.add(vo);
						}
						// ???????????? ?????? ????????? 2?????? ??????
					} else if (list2.size() == 2) {
						list1.retainAll(list2);
						if (list1.size() == 2) {
							ContentsDetailVO vo = new ContentsDetailVO();
							vo = temp.get(i);
							reco.add(vo);
						}
					} else {
						list1.retainAll(list2);
						// ????????? ????????? ????????? ?????? ????????? ????????? ??????
						if (list1.size() >= 3) {
							ContentsDetailVO vo = new ContentsDetailVO();
							vo = temp.get(i);
							reco.add(vo);
						}
					}
				}
				
//				String user_Id = (String) session.getAttribute("user_Id");
				UserVO user_Id = (UserVO) session.getAttribute("User");
				CommentVO comment = new CommentVO();
				comment.setContents_num(contents_num);
				comment.setContents_type(contents_type);
				List<CommentVO> commentList = commentService.selectList(comment); // ?????? ???????????? ?????? ????????? ????????? ????????????
				mode.addAttribute("commentList", commentList);
				
				List<UserVO> cmt_memberList = new ArrayList<UserVO>(); // ????????? ????????? ????????? ????????? ????????????
				for (int i = 0; i < commentList.size(); i++) {
					UserVO cmt_member = new UserVO();
					cmt_member = userService.findMemberById(commentList.get(i).getUserId()); // ????????? ??????????????? ????????? ????????? ???????????? mem_num??? ?????? ?????? ????????? ????????? vo??? ??????
					cmt_memberList.add(cmt_member); // List ???????????? ??????
					Integer countLike = commentService.getCountLike(commentList.get(i).getComment_num()); // ????????? ????????? ??????
					if (countLike != null) {
						commentList.get(i).setCountLike(countLike); //????????? ???????????? ????????? ??????
					}
				}
				mode.addAttribute("cmt_memberList", cmt_memberList); 
				
				
				if (user_Id != null) { // ????????? ??? ??????
					// star
					StarVO star = new StarVO();
					star.setContents_num(contents_num);
					star.setContents_type(contents_type);
					star.setUserId(user_Id.getUserId());
					System.out.println("asd" + star);
					StarVO starVO = contentsService.getStar(star); // ???????????? ????????? ?????? ???????????? ?????????????????? ????????? ?????????
					mode.addAttribute("starVO", starVO);

					comment.setUserId(user_Id.getUserId()); // ???????????? ???????????? ????????? ???????????? ???????????? ???????????? ?????? user_Id ??????
					for (int i = 0; i < commentList.size(); i++) {
						comment.setComment_num(commentList.get(i).getComment_num()); // ????????? ?????? ????????? ?????? ?????? ????????? 
						int checkCmtLike = commentService.checkCmtLike(comment);  // ?????? ?????? ??????????????? ??????
						commentList.get(i).setCheckCmtLike(checkCmtLike); // ????????? ?????? ????????? ?????? ?????? ( 0 ??? ????????? ??? ?????? / 1 ??? ????????? ?????? ) 
					}
					mode.addAttribute("commentList", commentList);
					System.out.println(comment + "Comment");
					System.out.println(commentList + "CommentList");
					
					CommentVO getComment = commentService.getComment(comment); // ???????????? ????????? ????????? ????????? ??????
					System.out.println("asd" + 1);
					int checkComment = commentService.checkComment(comment); // ?????? ???????????? ????????? ?????? ?????? ??????
					System.out.println("asd" + 2);
					
					mode.addAttribute("getComment", getComment);
					System.out.println("asd" + 3);
					mode.addAttribute("checkComment", checkComment);
					System.out.println("asd" + 4);

					LikeVO like = new LikeVO();
					System.out.println("asd" + 5);
					like.setContents_num(contents_num);
					System.out.println("asd" + 6);
					like.setContents_type(contents_type);
					System.out.println("asd" + 7);
					like.setUserId(user_Id.getUserId());
					System.out.println("asd" + like);
					int check = contentsService.checkLike(like); // ??????????????? ?????? ?????? ??????
					System.out.println("asd" + 9);	
					mode.addAttribute("check", check); // 1 ??? ?????? ?????? ?????? 0 ??? ?????? ?????? ?????? ??????
					mode.addAttribute("user_id", user_Id.getUserId());
				}
//				mode.addAttribute("user_id", 0);
		mode.addAttribute("reco", reco);
		mode.addAttribute("image",info.getImages(contents_type, contents_num));
		mode.addAttribute("cast",info.getCredits(contents_type, contents_num, "cast"));
		mode.addAttribute("crew",info.getCredits(contents_type, contents_num, "crew"));
		mode.addAttribute("info",info.getjsonObjectInfo(contents_type, contents_num));
		return "/board/MovieDetail";
	}
	
	@RequestMapping(value = "search.do")

    public String searsch(@RequestParam(value = "SC")String searchCondition,Model model,String searchKeyword, ReviewBoardVO vo) {
     if(searchCondition.equals("review"))  {
    		getContentInfo info = new getContentInfo();
         List<ReviewBoardVO> result = boardService.getSearchReview(vo);
         Collections.sort(result, new SortByLike());
         for(int i = 0;i<result.size();i++) {
             if(result.get(i).getReviewPic() == null) {
                 int code = result.get(i).getMoviecode();
                 System.out.println(code);
                 String contentType= result.get(i).getContentType();
                 System.out.println(contentType);
                 String temp = info.getjsonObjectInfo(contentType, code).getPoster_path();
                 System.out.println(temp);
                 result.get(i).setReviewPic(temp);
                 System.out.println(result.get(i).getReviewPic());
             }
         }
         model.addAttribute("result", result);
         model.addAttribute("searchname", searchCondition);
         return "board/searchReview";

     }else if(searchCondition.equals("free")){
         List<ReviewBoardVO> result = boardService.getSearchFree(vo);
         Collections.sort(result, new SortByLike());
         model.addAttribute("result", result);
         model.addAttribute("searchname", searchCondition);
         return "board/searchReview";
     }else {

     getSearchUtil search = new getSearchUtil();
          List<SearchVO> result = search.getInfoList(searchCondition, searchKeyword);
          Collections.sort(result, new SortByVote());
          model.addAttribute("result", result);
     }
       return "/board/search";
    }

	
	

	
	
	
	public JSONArray autoSearch(String searchCondition,String searchKeyword, ReviewBoardVO vo) throws IOException {
	      
	      int size=0;
	       
	       JSONArray arrayObj = new JSONArray();
	       JSONObject jsonObj = null; 
	       ArrayList<String> resultlist = new ArrayList<String>();
	       HashMap<String, Integer> resulthash = new HashMap<String, Integer>();
	       System.out.println(searchCondition);
	       System.out.println(searchKeyword);
	       Iterator<HashMap.Entry<String, Integer>> itr = resulthash.entrySet().iterator();
	       
	       if(searchCondition.equals("movie") || searchCondition.equals("tv")) {
	      getSearchUtil search = new getSearchUtil();
	        List<SearchVO> result = search.getInfoList(searchCondition ,searchKeyword);
	        List<String> poster = new ArrayList<String>();
	        Collections.sort(result, new SortByVote());
	        
	        if(result.size()>=10) {
	           size = 10;
	           
	        }else {
	           size=result.size();
	        }
	        
	       for(int i=0;i<size;i++) { 
	           String str = result.get(i).getTitle();
	           int num = result.get(i).getContents_num();
	           String img = result.get(i).getPoster_path();
	           jsonObj = new JSONObject();
	           jsonObj.put("data", str);
	           jsonObj.put("value", num);   
	           jsonObj.put("img",img);
	           arrayObj.add(jsonObj); 
//	           poster.add(img);
//	           resulthash.put(str,num); 
	       } 
	       
	       
//	       int i = 0;
//	       while(itr.hasNext()||i == resulthash.size()-1) {
//	          
//	          Map.Entry<String, Integer> entry = itr.next();
//	          jsonObj = new JSONObject();
//	           jsonObj.put("data", entry.getKey());
//	           jsonObj.put("value", entry.getValue());   
//	           jsonObj.put("img",poster.get(i));
//	           arrayObj.add(jsonObj); 
//	           i++;
//	       }
	       //?????? ??? json?????? 
//	       for(String str : resulthash.) {
//	           jsonObj = new JSONObject();
//	           jsonObj.put("data", str);
//	           arrayObj.add(jsonObj); 
//	           
//	       } 
	        
	       }else {
	       List<ReviewBoardVO> result =   boardService.getSearchReview(vo);   
	       Collections.sort(result, new SortByLike());
	       
	        if(result.size()>=10) {
	           size = 10;
	           
	        }else {
	           size=result.size();
	        }
	        
	       for(int i=0;i<size;i++) { 
	           String str = result.get(i).getTitle();
	           resultlist.add(str); 
	       } 
	       //?????? ??? json?????? 
	       for(String str : resultlist) {
	           jsonObj = new JSONObject();
	           jsonObj.put("data", str);
	           arrayObj.add(jsonObj); 
	           
	       } 
	       }
	    
	        
	     
	   

	       System.out.println(arrayObj);
	       return arrayObj;
	    
	   }
	
	
		@ResponseBody
		@RequestMapping(value = "autoSearch.do", method= {RequestMethod.GET},	produces = "application/json; charset=utf8")
		public void autoSearch(Model model,HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "SC")String searchCondition,String searchKeyword, ReviewBoardVO vo) throws IOException {
		                   
		String searchValue = request.getParameter("searchKeyword"); 
		String searchCondtion = request.getParameter("SC");
		JSONArray arrayObj = MovieController.this.autoSearch(searchCondtion, searchValue, vo);	
		System.out.println(arrayObj);
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter(); 
		pw.print(arrayObj); 
		pw.flush(); 
		pw.close();
}
	

		
		
		
}
