package supermarket;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegesterServlet
 */
@WebServlet("/RegesterServlet")
public class RegesterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegesterServlet() {
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
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String usname=request.getParameter("usname");
		String pwd=request.getParameter("pwd");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/market","root", "123456");
		Statement stmt=conn.createStatement();
		String sql="insert into user (username,password,email,address) values ('"+usname+"','"+pwd+"','"+email+"','"+address+"')";
		stmt.executeUpdate(sql);
		session.setAttribute("username", usname);
		out.print("<script>alert('×¢²á³É¹¦!');</script>");
		response.sendRedirect("index.jsp");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
