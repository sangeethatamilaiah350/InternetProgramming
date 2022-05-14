package servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 19cse024
 */
@WebServlet(name = "quiz", urlPatterns = {"/quiz"})
public class quiz extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection con;
        Statement stm = null;
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet quiz</title>");            
            out.println("</head>");
            out.println("<body>");
           
           
            try{
                String name=request.getParameter("user");
               
                out.println("<center><h1>"+name+"</h1></center>");
                int mark=0;
                if(request.getParameter("q1").equals("false")){
                    mark++;
                }
                if(request.getParameter("q2").equals("true")){
                    mark++;
                }
                if(request.getParameter("q3").equals("All mentioned above")){
                    mark++;
                }
                if(request.getParameter("q4").equals("HttpServlets")){
                    mark++;
                }
                if(request.getParameter("q5").equals("Non-Persistent cookie")){
                    mark++;
                }
                if(request.getParameter("q6").equals("forward")){
                    mark++;
                }
                if(request.getParameter("q7").equals("POST")){
                    mark++;
                }
                if(  request.getParameter("q8").equals("get")){
                   mark++;
                }
               
               
               
            con=DriverManager.getConnection("jdbc:derby://localhost:1527/quiz","sangeetha","password");
            stm=con.createStatement();
            String insert="insert into student values( '"+name+"',"+mark+")";
            stm.executeUpdate(insert);
            out.println("<center>Your score is "+mark+"</center>");
            }
            catch(Exception ex){
                out.println("<h1>"+ex.getMessage()+"</h1>");
            }
           
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
