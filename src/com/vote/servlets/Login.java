package com.vote.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
//		request.setAttribute("errors", false);

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Connection conn = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/Stude",
					"root", "");
			System.out.print("Successfully Connected");
			
			// We extract the value of the column "Role" from the DB, based on the Username and Password Combination entered in by the user
			PreparedStatement state = conn
					.prepareStatement("SELECT role FROM Users WHERE userName = ? AND password= ?");

			state.setString(1, username);
			state.setString(2, password);
			
			ResultSet rs = state.executeQuery();
			if (rs.next()) {
				
				// We check the String from the value extracted from the  DB
				String userRole = rs.getString("Role");
				
				// If the string equals "Admin", we redirect the user to the "Register.jsp" page
				if("Admin".equals(userRole)){
//				HttpSession session = request.getSession();
//				session.setAttribute("user", username);
					Cookie cookie = new Cookie("user", username);
					response.addCookie(cookie);
				
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("Register.jsp");
				dispatcher.forward(request, response);
				
				
				}
				//If the value of the string equals "Reception", we redirect the user to the "Developers.jsp" Page
				else if("Reception".equals(userRole)){
//					HttpSession session = request.getSession();
//					session.setAttribute("user", username);
					Cookie cookie = new Cookie("user", username);
					response.addCookie(cookie);
					RequestDispatcher dispatcher = request
							.getRequestDispatcher("Developers.jsp");
					dispatcher.forward(request, response);
					
				}
				
			} else {
				// If the user entered the wrong username+password combination, we redirect them to the login page
				out.println("Wrong username and password combo");
				request.setAttribute("errors", true);
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("index.jsp");
				dispatcher.forward(request, response);
			}
		} catch (SQLException | ClassNotFoundException e) {
			out.println("SQLException:" + e.getMessage());
		}
	}

}
