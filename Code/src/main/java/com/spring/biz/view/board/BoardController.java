package com.spring.biz.view.board;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.CntHistory.CntHistoryVO;
import com.spring.biz.MovieGenres.MovieGenresService;
import com.spring.biz.MovieGenres.MovieGenresVO;
import com.spring.biz.board.BoardService;

import com.spring.biz.board.PageDTO;
import com.spring.biz.board.ReviewBoardVO;
import com.spring.biz.board.SearchCriteria;
import com.spring.biz.comment.CommentVO;
import com.spring.biz.hashTag.HashTagService;
import com.spring.biz.hashTag.HashTagVO;

import com.spring.biz.user.UserVO;
import com.spring.biz.userInfo.UserInfoVO;
import com.spring.biz.util.getContentInfo;
import com.spring.biz.util.getMovie_genres;




@Controller
@SessionAttributes({"User","UserInfo","board"})
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private HashTagService hashtagService;
	@Autowired
	private MovieGenresService MovieGenresService;
	
	
	
	@RequestMapping(value="insertBoard.do")
	public String insertBoard(MovieGenresVO Gvo,ReviewBoardVO vo,String basic,HashTagVO Hvo,@RequestParam(value="SC") String code, int moviecode	,
			@RequestParam(value="uploadFile") MultipartFile file, HttpSession session) throws IOException {			
		getMovie_genres getGenres = new getMovie_genres();
	
		int seq = boardService.getSeq();
		int num;
		if(code.equals("movie")) {
			num=1;
		}else if(code.equals("tv")){
			num=2;
		}else if(code.equals("webtoon")) {
			num=3;
		}else {
			num=4;
		}
		vo.setBoardnum(num);
		vo.setBseq(seq);
		Hvo.setBseq(seq);
		vo.setContentType(code);
		System.out.println(basic + "태그 확인용");
		if(basic != null) {
			try {
				Hvo.setBseq(vo.getBseq());
				hashtagService.updateHashTag(Hvo);
				System.out.println(vo.getBseq());
				JSONArray arr = new JSONArray(basic);
				System.out.println(arr);
				String[] list = null;
				int len = arr.length();
				if(arr!=null) {
					list = new String[len];
					for(int i = 0;i<len;i++) {
						list[i] = arr.getJSONObject(i).getString("value");
						System.out.println(list[i]);
						Hvo.setTags(list[i]);
						
						
						hashtagService.insertHashTag(Hvo);
						System.out.println(Hvo.getTags());
					}
				}
				System.out.println(list);
				}
			 catch (JSONException e) {
				 e.printStackTrace();
				
			}
			
			}
		
		List<String> list = getGenres.get_genres(code, moviecode);
		for(int i = 0;i<list.size();i++) {
			System.out.println(1);
			Gvo.setMovieGeners(list.get(i));
			System.out.println(2);
			if(MovieGenresService.validMovieGenres(Gvo) == null) {
				System.out.println(1);
				MovieGenresService.insertGenres(Gvo);
			}else {
				MovieGenresService.updateGenres(Gvo);
			}
		}

		System.out.println(file.isEmpty());
		System.out.println("확인");
		System.out.println(vo.getBseq());
		System.out.println(vo.getBoardnum());
		System.out.println(vo.getContent());
		System.out.println(vo.getTitle());
		System.out.println(vo.getNickname());
		System.out.println(vo.getUserId());
		System.out.println(vo.getContentType());
		System.out.println(vo.getMoviecode());
		
		// 파일을 넣으면
		if(file.isEmpty() == false) {
			try {
				System.out.println(file);
				String filename = fileUpload(file, session);
				vo.setFilename(filename);
				System.out.println(vo.getFilename());
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("파일 업로드 실패");
			}
		}else {
			vo.setFilename("2");
		}

		
		boardService.insertBoard(vo);
		return "redirect:getBoardList.do?boardnum=" + num;
	}
	
	// 프로필 사진 업로드
	public String fileUpload(MultipartFile file, HttpSession session) throws Exception {


	    String originalFilename = file.getOriginalFilename();
	    UUID uuid = UUID.randomUUID();
	    String uploadFileName = uuid.toString() + "_" + originalFilename;

	    String basePath = "C:\\img";

	    File dir = new File(basePath);
	    if (!dir.exists()) {
	        dir.mkdirs();
	    }

	    String uploadPath = basePath + "/"+ uploadFileName;

	    File dest = new File(uploadPath);
	    System.out.println(uploadPath);
	    file.transferTo(dest);

	    return uploadFileName;
	}
			
	

	// 글 수정
		@RequestMapping(value="updateBoard.do")
		public String updateBoard( ReviewBoardVO vo, 
				@RequestParam(value="SC") String code,String basic,HashTagVO Hvo,SearchCriteria cri) {
			int num;
			if(code.equals("movie")) {
				num=1;
			}else if(code.equals("tv")){
				num=2;
			}else if(code.equals("webtoon")) {
				num=3;
			}else {
				num=4;
			}
			System.out.println(basic);
			vo.setContentType(code);
			vo.setBoardnum(num);
			System.out.println(vo.getBseq());
			System.out.println("글 수정 처리");
//			logger.debug("[LOG] 글 수정 처리");
			if(basic != null) {
				try {
					Hvo.setBseq(vo.getBseq());
					hashtagService.updateHashTag(Hvo);
					System.out.println(vo.getBseq());
					JSONArray arr = new JSONArray(basic);
					String[] list = null;
					int len = arr.length();
					if(arr!=null) {
						list = new String[len];
						for(int i = 0;i<len;i++) {
							list[i] = arr.getJSONObject(i).getString("value");
							System.out.println(list[i]);
							Hvo.setTags(list[i]);
							
							System.out.println(1);
							hashtagService.insertHashTag(Hvo);
						}
					}
					System.out.println(list);
					}
				 catch (JSONException e) {
					 e.printStackTrace();
					
				}
				
				}
			
			
			boardService.updateBoard(vo);

//			System.out.println("query : " + cri.makeQuery());
			return "redirect:getBoardList.do?boardnum=" + num;
		}
	
	@RequestMapping(value="/getUpdate.do")
	public String getUpdate(ReviewBoardVO vo, Model model,HashTagVO Hvo) throws ParseException {

		System.out.println("글 업데이트 처리");
//		logger.debug("[LOG] 글 상세 조회 처리");
		System.out.println(vo.getBseq());
		ReviewBoardVO result = boardService.getBoard(vo);
		getContentInfo info = new getContentInfo();
		if(result.getMoviecode()!=0) {
			model.addAttribute("info",info.getjsonObjectInfo(result.getContentType(), result.getMoviecode()));	
		}
		List<String> hash = new ArrayList<String>();
		if(hashtagService.getHashTag(Hvo)!=null) {
			List<HashTagVO> list = hashtagService.getHashTag(Hvo);
			for(int i = 0;i<list.size();i++) {
				String str = list.get(i).getTags();
				
				hash.add(str);
			}
		}
		
		// 검색 결과를 세션에 저장하고 목록 화면으로 이동한다.
		Hvo.setBseq(vo.getBseq());
		model.addAttribute("board",result );
		model.addAttribute("hashTag",hash);
		return "/board/updateReview";
	}
	

	// 글 삭제
	@RequestMapping(value="deleteBoard.do")
	public String deleteBoard(ReviewBoardVO vo, @RequestParam(value="deletenum") int num, Model model) {
		
		
		System.out.println("글 삭제 처리");
		System.out.println(num);
//		logger.debug("[LOG] 글 삭제  처리");
		boardService.deleteBoard(vo);
		
		
		return "redirect:getBoardList.do?boardnum=" + num;
	}
	
	// 검색 조건 목록 설정
		@ModelAttribute("conditionMap")
		public Map<String, String> searchConditionMap() {
			Map<String, String> conditionMap = new HashMap<String, String>();
			conditionMap.put("제목", "TITLE");
			conditionMap.put("내용", "CONTENT");
			return conditionMap;
		}
	
		@RequestMapping("/insertboardgo.do")
		public String insertboardgo() {
			
			return "insertBoard";
		}


	// 글 상세 조회
	@RequestMapping(value="/getBoard.do")
	public String getBoard(ReviewBoardVO vo, Model model, UserVO uvo,HttpServletRequest request, CntHistoryVO cvo,HashTagVO Hvo,HttpServletResponse response) throws IOException {
		System.out.println("글 상세 조회 처리");
		HttpSession session = request.getSession();
		ReviewBoardVO result = boardService.getBoard(vo);
		getContentInfo info = new getContentInfo();
		if(result.getMoviecode()!=0) {
			model.addAttribute("info",info.getjsonObjectInfo(result.getContentType(), result.getMoviecode()));	
		}
		if(result.getReport().equals("Y")) {
			response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('삭제된 게시물입니다.');history.go(-1);</script>");
	        out.flush();
	        return "redirect:history.go(-1)";
		}
		if((UserVO) session.getAttribute("User") != null) {			
			uvo = (UserVO) session.getAttribute("User");
			System.out.println(uvo.getUserId());
			System.out.println(cvo.getBseq());
			
			cvo.setUserId(uvo.getUserId());
			if(boardService.getCntBoard(cvo) == null) {
				boardService.insertCntHistory(cvo);
				boardService.updateCnt(vo);
			}
		}
		

	
		
//		logger.debug("[LOG] 글 상세 조회 처리");
		
		// NULL Check
				if (vo.getSearchCondition() == null) {
					vo.setSearchCondition("TITLE");
				}
				if (vo.getSearchKeyword() == null) {
					vo.setSearchKeyword("");
				}
		
	
		// 검색 결과를 세션에 저장하고 목록 화면으로 이동한다.
		Hvo.setBseq(vo.getBseq());
		model.addAttribute("hashTag", hashtagService.getHashTag(Hvo));
		model.addAttribute("board", boardService.getBoard(vo));
		
		
		return "/board/getBoard";
	}

	// 글 목록 검색
	@RequestMapping(value="getBoardList.do")
	public String getBoardList(Model model,@RequestParam(value="boardnum") int num, ReviewBoardVO vo, HashTagVO Hvo) {
		vo.setBoardnum(num);
		System.out.println(num);
		
		getContentInfo info = new getContentInfo();
		
		// NULL Check
				if (vo.getSearchCondition() == null) {
					vo.setSearchCondition("TITLE");
				}
				if (vo.getSearchKeyword() == null) {
					vo.setSearchKeyword("");
				}
				
				
				
				// Model 정보 저장
				PageDTO pageMaker = new PageDTO(vo, boardService.getTotalPages(vo));
				
				List<ReviewBoardVO> result = boardService.getBoardList(vo);
				
				for(int i = 0;i<result.size();i++) {
					Hvo.setBseq(result.get(i).getBseq());
					if(hashtagService.getHashTag(Hvo)!=null) {
						System.out.println(Hvo.getBseq());
					List<HashTagVO> hashList = hashtagService.getHashTag(Hvo);
					List<String> tempList = new ArrayList<String>();
					for(int x = 0;x<hashList.size();x++) {
						
						String temp = hashList.get(x).getTags();
						tempList.add(temp);
					}
					result.get(i).setTags(tempList);
					}
					
					if(result.get(i).getReviewPic() == null || num!=4) {
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
				model.addAttribute("pageMaker", pageMaker);	// Model 정보 저장
				model.addAttribute("boardList", result);	// Model 정보 저장
				model.addAttribute("boardnum", vo.getBoardnum());
				if(num == 4) {
					return "/board/community";
				}else {
					return "/board/movieReview";
					}
				
			}
	
	@RequestMapping(value="cs.do")
	public String faq() {
		return "faq-write-form";
	}
	
	
	
	
	
	@RequestMapping("/upload_ok.do")
	   public String upload(@RequestParam("file") MultipartFile file ,ReviewBoardVO Ivo) {
	      String fileRealName = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
	      long size = file.getSize(); //파일 사이즈
	      
	      System.out.println("파일명 : "  + fileRealName);
	      System.out.println("용량크기(byte) : " + size);
	      //서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자 명을 구함
	      String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
	      String uploadFolder = "D:\\Devspace\\SpringSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Reviewers3-1\\resources\\images";
	      
	      
	      /*
	        파일 업로드시 파일명이 동일한 파일이 이미 존재할 수도 있고 사용자가 
	        업로드 하는 파일명이 언어 이외의 언어로 되어있을 수 있습니다. 
	        타인어를 지원하지 않는 환경에서는 정산 동작이 되지 않습니다.(리눅스가 대표적인 예시)
	        고유한 랜던 문자를 통해 db와 서버에 저장할 파일명을 새롭게 만들어 준다.
	       */
	      
	      UUID uuid = UUID.randomUUID();
	      System.out.println(uuid.toString());
	      String[] uuids = uuid.toString().split("-");
	      
	      String uniqueName = uuids[0];
	      System.out.println("생성된 고유문자열" + uniqueName);
	      System.out.println("확장자명" + fileExtension);
	      System.out.println(uniqueName+fileExtension);
	      
	      
	      // File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 적용 전
	      
	      File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // 적용 후
	      try {
	         file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
	      } catch (IllegalStateException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      return "fileupload/upload_ok";
	   }
	}


