package rem.store.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import rem.login.vo.MemberVO;
import rem.store.service.IStoreService;
import rem.store.service.StoreServiceImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;


@WebServlet("/store/mypageProfileEdit.do")
public class MypageProfileEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//1) session객체로부터 로그인 정보 꺼냄
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		
		System.out.println("MypageAccess->loginInfo : " + loginInfo);
		
		if(loginInfo==null) {
			request.getRequestDispatcher("/WEB-INF/login/login.jsp").forward(request, response);
		} else {
			//2-1) 변경될 별명
			String editedAlias = (String)request.getParameter("editedAlias");
			//2-2) 변경될 자기소개
			String editedPrInfo = (String)request.getParameter("editedPrInfo");
			
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

}
