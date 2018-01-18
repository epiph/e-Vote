package com.vote.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CastVote
 */
@WebServlet("/CastVote")
public class CastVote extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CastVote() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = request
				.getRequestDispatcher("results.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String president = request.getParameter("president");
		String  governor = request.getParameter("governor");
		String  senator = request.getParameter("senator");
		String  mp = request.getParameter("mp");
		String  womenrep = request.getParameter("womenrep");
		String  mca = request.getParameter("mca");
		Calendar calendar = Calendar.getInstance();
		java.sql.Timestamp time = new java.sql.Timestamp(calendar
				.getTime().getTime());
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/voting",
					"root", "");
			System.out.println("Connected successfully to DB");
			PreparedStatement state = conn
					.prepareStatement("insert into Tallies values(?,?,?,?,?,?,?)");
			state.setString(1, president);
			state.setString(2, governor);
			state.setString(3, senator);
			state.setString(4, mp);
			state.setString(5, womenrep);
			state.setString(6, mca);
			state.setTimestamp(7, time);
			state.executeUpdate();
			request.setAttribute("message", true);
			getServletContext().getRequestDispatcher("/results.jsp").forward(
					request, response);

		} catch (SQLException | ClassNotFoundException e) {
			System.out.println("SQLException :" + e.getMessage());
			request.setAttribute("error", true);

			getServletContext()
					.getRequestDispatcher("/results.jsp").forward(
							request, response);
		
	}
	}
}
