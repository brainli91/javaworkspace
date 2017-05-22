package com.fdmgroup.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.fdmgroup.dao.UserDAO;
import com.fdmgroup.model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
    	RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User user = UserDAO.getInstance().findUserByUsername(username);
		
		
		if(user != null){
			if(user.getPassword().equals(password)){
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				session.setMaxInactiveInterval(300); //0 will makes it never end session
				//session.invalidate(); will end the session when log out
				
				Cookie cookie = new Cookie("bgcolor","red");
				cookie.setMaxAge(20);
				response.addCookie(cookie);
	
				RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");
				rd.forward(request, response);
				return;
			}
		}
		
		Logger logger = Logger.getLogger("sysLogger");
		logger.info("Login not sucessfully --> "+ username);
		
		request.setAttribute("errorMsg", "Username/Password is wrong.");
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
		
	}

	
}
