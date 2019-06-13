package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.Dao.BoardDao;
import Board.model.BoardBean;

/**
 * Servlet implementation class BoardFrontController
 */
@WebServlet("*.bo")
public class BoardFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		
		String url=request.getRequestURI();
		CommandHandler c=null;
		ActionForward a=null;
		System.out.println(url);
		
		if(url.equals("/12345678/write.bo")) {
			RequestDispatcher D=request.getRequestDispatcher("/submain.jsp?pagefile=/board/write");
			D.forward(request, response);
		}
	
		else if(url.equals("/12345678/Usercheck.bo")) {
			String name=request.getParameter("userName");
			
			response.getWriter().write(getJSON(name));
			
		}
		else if(url.equals("/12345678/Login.bo")) {
			c=new LonginHandler();
			try {
				a=c.process(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				
			}
		}
		else if(url.equals("/12345678/deleteUser.bo")) {
			c=new DeleteUserHandler();
			try {
				a=c.process(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				
			}
		}
		else if(url.equals("/12345678/NickAdd.bo")) {
			c=new NewUserHandler();
			try {
				a=c.process(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				
			}
		}
		else if(url.equals("/12345678/Logout.bo") ) {
			RequestDispatcher D=request.getRequestDispatcher("/logout.jsp");
			D.forward(request, response);
		}
		else if(url.equals("/12345678/addUser.bo")) {
			c=new NewUserHandler();
			try {
				a=c.process(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				
			}
		}
		else if(url.equals("/12345678/delete.bo")) {
			c=new DeleteHandler();
			try {
				a=c.process(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				
			}
		}
		else if(url.equals("/12345678/deleteRe.bo")) {
			c=new DeleteReplyHandler();
			try {
				a=c.process(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				
			}
		}
	
		
		else if(url.equals("/12345678/writePro.bo")) {
			c=new WriteHandler();
			try {
				a=c.process(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				
			}
		}
		
		else if(url.equals("/12345678/reply.bo")) {
			c=new BoardReplyHandler();
			try {
				a=c.process(request, response);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		else if(url.equals("/12345678/boardList.bo")) {
			
			try {
				c=new BoardListHandler();
				a=c.process(request, response);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(url.equals("/12345678/read.bo")) {
			c=new ReadHandler();
			try {
				a=c.process(request, response);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		if(a!=null) {
			
				RequestDispatcher D=request.getRequestDispatcher(a.getPath());
				D.forward(request, response);
			
		}
	}
	
	
	public String getJSON(String name) {
		if(name == null) {
			name="";
		}
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		BoardDao B=new BoardDao();
		ArrayList<BoardBean> L=B.search(name);
		
		if(L.isEmpty()) {
			result.append("[{\"value\":\""+""+"\"}],");
		}
		else {
		result.append("[{\"value\":\""+L.get(0).getName()+"\"}],");
		}
		L.clear();	
		
		result.append("]}");
		
		return result.toString();
		
	}

}
