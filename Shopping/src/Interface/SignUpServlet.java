package Interface;



import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SignUpServlet
 */
@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
     PrintWriter out =response.getWriter();
    // HttpSession session=request.getSession(false);
     String str1=request.getParameter("name");
    // String str2=(String)session.getAttribute("password");
     String str3=request.getParameter("contact");
    // String str4=(String)session.getAttribute("address");
     if(str1=="varsha")
     {
         String docType = "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
    	 out.print(docType + "<HTML><body><h3><font color= white>User name exists, try another one</font></h3></body></HTML>");
    	 //session.invalidate();
         RequestDispatcher rd=request.getRequestDispatcher("/SignUp.html");
         rd.include(request,response);
	}
     else
     {
    	 String docType = "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
    	 out.print(docType + "<HTML><body><h3><font color= white> Signed Up successfully. Try Logging in</font></h3></body></HTML>");
    	 //session.invalidate();
         RequestDispatcher rd=request.getRequestDispatcher("/Login.html");
         rd.include(request,response);
    	 
    	 }
     }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	

}