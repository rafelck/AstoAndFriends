/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.DataBaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Anonymous
 */
@WebServlet(name = "ProsesHapus", urlPatterns = {"/ProsesHapus"})
public class ProsesHapus extends HttpServlet {

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
        DataBaseConnection connection = new DataBaseConnection();
        HttpSession session = request.getSession();
        try {
            if (session.getAttribute("kd_makul") != null) {
                String query = "DELETE from pilih_makul where kd_makul ="+session.getAttribute("kd_makul");
                Statement statement = connection.getConnection().createStatement();
                statement.executeUpdate(query);
                statement.close();
                response.sendRedirect("KRS2.jsp");
            } else {
                out.print("Session Kosong!");
            }
        } catch (Exception ex) {
            ex.getMessage();
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
        DataBaseConnection connection = new DataBaseConnection();
        HttpSession session = request.getSession();
        try {
            if (session == null) {
                String query = "delete from WEB_PILIH where nim = " + session.getAttribute("username") + " and id_makul = '" + request.getParameter("idKrs") + "'";
//                String query ="DELETE FROM " + Constant.getTableName(Constant.WEB_PILIH) + " WHERE id_makul = '" 
//                        + session.getAttribute("kode").toString() 
//                        + "' and nim = " + session.getAttribute("username").toString();
                Statement statement = connection.getConnection().createStatement();
                statement.executeUpdate(query);
                statement.close();
                response.sendRedirect("KRS2.jsp");
            } else {
                PrintWriter out = response.getWriter();
                out.print("Session Kosong!");
            }
        } catch (Exception ex) {
            ex.getMessage();
        }
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
        DataBaseConnection connection = new DataBaseConnection();
        HttpSession session = request.getSession();
        try {
            String query = "delete from WEB_PILIH where nim = " + session.getAttribute("username") + " and id_makul = '" + request.getParameter("idKrs") + "'";
//                String query ="DELETE FROM " + Constant.getTableName(Constant.WEB_PILIH) + " WHERE id_makul = '" 
//                        + session.getAttribute("kode").toString() 
//                        + "' and nim = " + session.getAttribute("username").toString();
            Statement statement = connection.getConnection().createStatement();
            statement.executeUpdate(query);
            statement.close();
            response.sendRedirect("KRS2.jsp");
        } catch (Exception ex) {
            ex.getMessage();
        }
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
