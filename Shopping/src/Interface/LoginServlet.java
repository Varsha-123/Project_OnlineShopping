package Interface;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		 PrintWriter out =response.getWriter();
		 String UID = request.getParameter("UserID");
		 String pw = request.getParameter("Password");
		 if(pw.equals("1234"))
		 {
			 String docType = "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
	    	 out.print(docType + "<HTML><body> <br> <br> <br>  <br> <br> <h2><font color= white text-align = center>Successful Login</font></h2></body></HTML>");
			 RequestDispatcher rd=request.getRequestDispatcher("/Login.html");
	         rd.include(request,response);
		 }
		 else
		 {
			 out.println("");
			 String docType = "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
	    	 out.print(docType + "<HTML><body> <br> <br> <br>  <br> <br> <h2><font color= white text-align = center>Invalid login. Please try again</font></h2></body></HTML>");
	    	 //session.invalidate();
	         RequestDispatcher rd=request.getRequestDispatcher("/Login.html");
	         rd.include(request,response);
		 }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}