
package evoting.controller;

import evoting.dao.CandidateDAO;
import evoting.dao.VoteDAO;

import evoting.dto.Candidatepojo;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PartyResultControllerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sess=request.getSession();
        RequestDispatcher rd=null;
        String userid=(String)sess.getAttribute("userid");
        if(userid==null)
        {
            sess.invalidate();
            response.sendRedirect("accessdenied.html");
            return;
        }
        try
        {
            Map<String,Integer> result=VoteDAO.getResultByParty();
            System.out.println(result);
            Iterator it=result.entrySet().iterator();   
            LinkedHashMap<Candidatepojo,Integer> resultDetails=new LinkedHashMap<>();
            while(it.hasNext())
            {
                Map.Entry<String,Integer> e=(Map.Entry)it.next();
                Candidatepojo cp=CandidateDAO.getCandidateInfo(e.getKey());
                resultDetails.put(cp,e.getValue());
            }
            
            System.out.println("outside while "+resultDetails.toString());
            int votecount=VoteDAO.getVoteCount();
            request.setAttribute("votecount",votecount);
            request.setAttribute("result",resultDetails);
            rd=request.getRequestDispatcher("electionpartyresult.jsp");
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            request.setAttribute("Exception", ex);
            rd=request.getRequestDispatcher("showexception.jsp");
        } 
        finally
        {
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
