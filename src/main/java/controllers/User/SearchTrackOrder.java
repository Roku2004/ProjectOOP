package controllers.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.RouteOrder;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import dao.routeorderdao;
import dbcontext.db;

/**
 * Servlet implementation class SearchTrackOrder
 */
@WebServlet("/SearchTrackOrder")
public class SearchTrackOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchTrackOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		Connection conn = db.getConnection();
//        int order_id = Integer.parseInt(request.getParameter("id"));
//        routeorderdao rod = new routeorderdao();
//        try {
//        	ArrayList<RouteOrder> routeorder = rod.RouteOrderList(request, conn, order_id);
//            if(routeorder != null) {
//            	System.out.print("tim duoc");
//            	request.setAttribute("list",routeorder);
//                request.getRequestDispatcher("/StartSystem.jsp").forward(request, response);
//            }
//		} catch (Exception e) {
//			System.out.print("khong gui len duoc" + e.getMessage());
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
