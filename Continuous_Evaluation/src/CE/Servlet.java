package CE;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import javax.servlet.http.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;

import java.sql.*;

@SuppressWarnings("unused")
@WebServlet("/Servlet")
public class Servlet extends HttpServlet 
{
	
	private static final long serialVersionUID = 1L;  
    String CEAdminPath;
    String CETeacherPath;
    String CEUnivPath;
    String CEStudentPath;
    
    public void init()
    {
    	ServletContext servletcontext = getServletContext();
    	servletcontext.setAttribute("CEAdminPath", servletcontext.getInitParameter("CEADMIN_PATH"));
    	servletcontext.setAttribute("CETeacherPath", servletcontext.getInitParameter("CETEACHER_PATH"));
    	servletcontext.setAttribute("CEUnivPath", servletcontext.getInitParameter("CEUNIV_PATH"));
    	servletcontext.setAttribute("CEStudentPath", servletcontext.getInitParameter("CESTUDENT_PATH"));
    }

		public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		
		CEAdminPath=(String)getServletContext().getAttribute(CEAdminPath);
		CETeacherPath=(String)getServletContext().getAttribute(CETeacherPath);
		CEUnivPath=(String)getServletContext().getAttribute(CEUnivPath);
		CEStudentPath=(String)getServletContext().getAttribute(CEStudentPath);
		
		session.setAttribute("CEAdminPath", CEAdminPath);
		session.setAttribute("CETeacherPath", CETeacherPath);
		session.setAttribute("CEUnivPath", CEUnivPath);
		session.setAttribute("CEStudentPath", CEStudentPath);
		
		HashMap hashmap=null;
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:San", "root", "");
			synchronized(getServletContext())
			{
					hashmap=(HashMap)getServletContext().getAttribute("UserList");
					if(hashmap==null)
					{
						hashmap= new HashMap();
						Statement stmt= con.createStatement();
						String query = "select * from User_List";
						ResultSet rs = stmt.executeQuery(query);
						while (rs.next())
						{
							hashmap.put(rs.getString(1), new User_List(rs.getString(1), rs.getString(2), 4));
						}
					}
					con.close();
			}
		}
			catch(SQLException e) { }
			catch(ClassNotFoundException e) { }
			RequestDispatcher view=request.getRequestDispatcher("Home_Page.jsp");
			view.forward(request, response);
	}
}