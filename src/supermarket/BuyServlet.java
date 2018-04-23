package supermarket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.net.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BuyServlet
 */
@WebServlet("/BuyServlet")
public class BuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		if(session.getAttribute("username")==null)response.sendRedirect("login.jsp");
		else
		{
		if(session.getAttribute("cart")==null)
			{
				Collection<Commodity> c=new ArrayList();
				int id=Integer.parseInt(request.getParameter("id"));
				double price=Double.parseDouble(request.getParameter("price"));
				String name=request.getParameter("name");
				name=new String(name .getBytes("iso8859-1"),"utf-8");
				String picture=request.getParameter("picture");
				c.add(new Commodity(id,name,price,picture));
				session.setAttribute("cart", c);
			}
			else
			{
				Collection<Commodity> c=(Collection<Commodity>) session.getAttribute("cart");
				int id=Integer.parseInt(request.getParameter("id"));
				double price=Double.parseDouble(request.getParameter("price"));
				String name=request.getParameter("name");
				String picture=request.getParameter("picture");
				name=new String(name .getBytes("iso8859-1"),"utf-8");
				c.add(new Commodity(id,name,price,picture));
				session.setAttribute("cart", c);
			}
		if(session.getAttribute("amount")==null)
		session.setAttribute("amount", 1);
		else
		{
			int n=(int)session.getAttribute("amount");
			n++;
			session.setAttribute("amount", n);
		}
		response.sendRedirect("index.jsp");
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
