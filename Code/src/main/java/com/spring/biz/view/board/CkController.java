package com.spring.biz.view.board;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.spring.biz.board.BoardService;
import com.spring.biz.board.ReviewBoardVO;
import com.spring.biz.user.UserService;
import com.spring.biz.user.UserVO;



@Controller
@SessionAttributes({"User"})
public class CkController {
	@Autowired
	BoardService bo;
	@Autowired
	UserService userService;
	@RequestMapping(value = "/testinsert.do")
	public String insertBoard(@RequestParam(value = "content")String content,ReviewBoardVO vo) {
		vo.setContent(content);
		bo.insertBoard(vo);
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value = "write.do")
	public String writeDo(UserVO vo,String UserId) {
		System.out.println(vo.getPassword());
		if(vo.getUserId()=="") {
			return "1";
			
		}else if(userService.idCheck(vo).getReport().equals("Y")){
			return "2";
		}
		return "testCk";
	}
	
	@RequestMapping(value = "writeGo.do")
	public String writeDoGo() {
	
		return "/board/insertBoard";
	}
	
	@RequestMapping(value="fileupload.do", method=RequestMethod.POST)
	@ResponseBody
	public String fileUpload(HttpServletRequest req, HttpServletResponse resp, 
                 MultipartHttpServletRequest multiFile) throws Exception {
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		if(file != null){
			if(file.getSize() > 0 && StringUtils.isNotBlank(file.getName())){
				if(file.getContentType().toLowerCase().startsWith("image/")){
					try{
						String fileName = file.getName();
						byte[] bytes = file.getBytes();
						String uploadPath = "C:\\img";
						
						File uploadFile = new File(uploadPath);
						if(!uploadFile.exists()){
							uploadFile.mkdirs();
						}
						fileName = UUID.randomUUID().toString();
						uploadPath = uploadPath + "/" + fileName;
						out = new FileOutputStream(new File(uploadPath));
                        out.write(bytes);
                        System.out.println(uploadPath);
                        printWriter = resp.getWriter();
                        resp.setContentType("text/html");
                     
                        String fileUrl = "/img/" + fileName;
                        // json 데이터로 등록
                        // {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
                        // 이런 형태로 리턴이 나가야함.
                        json.addProperty("uploaded", 1);
                        json.addProperty("fileName", fileName);
                        json.addProperty("url", fileUrl);
                        System.out.println(fileUrl);
                        System.out.println(uploadPath);
                        printWriter.println(json);
                    }catch(IOException e){
                        e.printStackTrace();
                    }finally{
                        if(out != null){
                            out.close();
                        }
                        if(printWriter != null){
                            printWriter.close();
                        }		
					}
				}
			}
		}
		return null;
	}	
	
	
	@RequestMapping(value = "test123.do")
	public String test() {
		return "123";
	}
	
}