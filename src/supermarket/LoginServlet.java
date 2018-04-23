package supermarket;


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();
		String usname=request.getParameter("usname");
		String pwd=request.getParameter("pwd");
		HttpSession session=request.getSession();
		try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/market","root", "123456");
		Statement stmt=conn.createStatement();
		String sql="select * from user";
		ResultSet rs=stmt.executeQuery(sql);
		while(rs.next())
		{
			String username=rs.getNString(1);
			String password=rs.getNString(2);
			if(username.equals(usname)&&password.equals(pwd))
			{
				session.setAttribute("username", username);
				out.print("<script>alert('登录成功!');</script>");
				response.sendRedirect("index.jsp");
			}
		}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		out.print("<script>alert('用户名或密码错误!');</script>");
		out.print("<a href='login.jsp'>返回首页</a>");
	}

}
