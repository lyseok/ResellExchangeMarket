package rem.store.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import rem.file.service.FileServiceImpl;
import rem.file.service.IFileService;
import rem.file.vo.ImgFileVO;
import rem.login.vo.MemberVO;
import rem.store.service.IStoreService;
import rem.store.service.StoreServiceImpl;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import com.google.gson.Gson;
import com.google.gson.JsonObject;


@WebServlet("/store/mypageProfileEdit.do")
public class MypageProfileEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR = "filetest"; // 업로드 디렉터리 설정
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//1) session객체로부터 로그인 정보 꺼냄
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		int storeId = loginInfo.getMem_no();
		
		// 이미지 업로드 경로 설정 (서버 실행 경로 기준)
        String uploadPath = "d:" + File.separator + UPLOAD_DIR;
        System.out.println("Upload Path: " + uploadPath);
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs(); // 폴더 없으면 생성
		
		///System.out.println("MypageAccess->loginInfo : " + loginInfo);
		
		if(loginInfo==null) {
			request.getRequestDispatcher("/WEB-INF/login/login.jsp").forward(request, response);
		} else {
			//2-1) 변경될 별명
			String editedAlias = request.getParameter("editedAlias");
			if(editedAlias==null)
				editedAlias = "상점" + loginInfo.getMem_no(); 
			//2-2) 변경될 자기소개
			String editedPrInfo = request.getParameter("editedPrInfo");
			if(editedPrInfo==null)
				editedPrInfo = "자기소개 기본값입니다...^0^";
			
			//2-3) 변경될 이미지■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
			String checkNewImg = (String)request.getParameter("checkNewImg");
			if(checkNewImg.equals("NEW-IMG")) {
				ImgFileVO imgVO = new ImgFileVO();
				try {
					Part imgPart = request.getPart("editedImage");
					System.out.println("Received File Name: " + imgPart.getSubmittedFileName());
					
					String imgOriginalName = Paths.get(imgPart.getSubmittedFileName()).getFileName().toString();
		            String imgUUIDName = UUID.randomUUID().toString() + "_" + imgOriginalName;
	///	            String savingFilePath = "/" + uploadPath.substring(3) + File.separator + imgUUIDName;
		            String savingFilePath = uploadPath + File.separator + imgUUIDName;
		            String scriptFilePath = "/" + uploadPath.substring(3) + File.separator + imgUUIDName;
		            String imgExtension = "";
		            int index = imgOriginalName.lastIndexOf(".");
		            if (index > 0) {                        
		            	imgExtension = imgOriginalName.substring(index + 1);
		            }
		            
		            imgVO.setFile_org_name(imgOriginalName);
		            imgVO.setFile_save_name(imgUUIDName);
		            imgVO.setFile_path(scriptFilePath);
		            imgVO.setFile_size((int)Math.ceil(imgPart.getSize() / 1024.0)); //<-KB단위로 저장
		            imgVO.setFile_type(imgExtension);
		            imgVO.setFile_source(100); //<-mapper에 소스별 메소드 구현할 거라 쓰이진 않는 필드.
		            imgVO.setFile_no(loginInfo.getMem_no());
		            imgVO.setFile_total(1);
		            
		            
		            // 파일 저장
		            imgPart.write(savingFilePath);
		        } catch (Exception e) {
		        	e.printStackTrace();
					/* response.getWriter().write("{\"error\": \"파일 업로드 실패\"}"); */
		        }
				//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
				IFileService fservice = FileServiceImpl.getInstance(); 
				int recDel  = fservice.deleteProfileImg(storeId);
				int recFile = fservice.insertProfileImg(imgVO);
				System.out.println("MypageAccess->rec_file : " + recFile);
				
			}
			else {}
			
			

			
			
			Map<String, Object> editedMap = new HashMap<>();
			editedMap.put("mem_no", loginInfo.getMem_no());//불변(기본키)
			editedMap.put("mem_alias", editedAlias);
			editedMap.put("pr_info", editedPrInfo);
			
			IStoreService service = StoreServiceImpl.getInstance();
			int rec = service.updateMypageProfile(editedMap);
			//MypageAccess->rec : 1
			System.out.println("MypageAccess->rec : " + rec);
			
			
			
			
			
			if(rec>0) {//update 성공
//				IMemberService mservice = MemberServiceImpl.getInstance(MemberDaoImpl.getInstance());
//				Map<String, String> loginMap = new HashMap<>();
//				String memId = loginInfo.getMem_email();
//				String memPw = loginInfo.getMem_pw();
//				loginMap.put("mem_email", memId);
//				loginMap.put("mem_pw", memPw);
//				MemberVO memberVO = mservice.login(loginMap);
				
				//3) session객체에 변경 정보 반영
				loginInfo.setMem_alias(editedAlias);
				loginInfo.setPr_info(editedPrInfo);
				
//				session.setAttribute("loginInfo", loginInfo);
//				request.setAttribute("editProcess", "OK");
//				request.getRequestDispatcher("/WEB-INF/store/mypage.jsp").forward(request, response);
//				response.sendRedirect(request.getContextPath() + "/REMProject/store/mypage.do");
				
				Gson gson = new Gson();
				
				Map<String,Object> map = new HashMap<String, Object>();
				map.put("result", "success");
				
				String json = gson.toJson(map);
				
				PrintWriter out = response.getWriter();
				out.print(json);
				out.flush();
			} else {//update 실패
//				request.setAttribute("editProcess", "NO");
//				request.getRequestDispatcher("/WEB-INF/store/mypage.jsp").forward(request, response);
				
				Gson gson = new Gson();
				
				Map<String,Object> map = new HashMap<String, Object>();
				map.put("result", "failed");
				
				String json = gson.toJson(map);
				
				PrintWriter out = response.getWriter();
				out.print(json);
				out.flush();
			}
		
		}
		
	}
	
	/**	
	- Part 구조
	1) 파일이 아닌 일반 데이터일 경우
	--------------------------------------sldfjwroiu23409sadf ==>각 Part를 구분하는 구분선
	content-disposition: form-data; name="username"		  ==>파라미터명
															  ==> 빈 줄
	hong gil dong											  ==>파라미터값
	
	*/
	
	/**
	2) 파일일 경우
	--------------------------------------sldfjwroiu23409sadf ==>각 Part를 구분하는 구분선
	content-disposition: name="upFile1"; filename="test.txt"  ==> 파일 정보
	content-type: text/plain								  ==> 파일의 종류
															  ==> 빈 줄
	abcde1234안녕											  ==> 파일 내용
	*/
	
	///■ Part 구조 안에서 '파일명'을 찾는 메서드
	private String extractFileName(Part part) {
		String fileName = "";		//<-찾은 파일명이 저장도리 변수(반환값)
		
		String dispositionValue = part.getHeader("content-disposition");
		String[] items = dispositionValue.split(";");
		for(String item: items) {	//<-배열 개수만큼 반복
			if(item.trim().startsWith("filename")) {
				fileName = item.substring(item.indexOf("=") + 2, item.length()-1);
			}
		}
		
		return fileName;
	}

}
