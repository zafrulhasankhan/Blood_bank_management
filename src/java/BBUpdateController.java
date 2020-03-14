/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "BBUpdateController", urlPatterns = {"/BBUpdateController"})
public class BBUpdateController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();

        String email = (String) session.getAttribute("email");

        String bldbank = request.getParameter("bldbank");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String aposqntt = request.getParameter("aposqntt");
        String anegqntt = request.getParameter("anegqntt");
        String oposqntt = request.getParameter("oposqntt");
        String onegqntt = request.getParameter("onegqntt");
        String bposqntt = request.getParameter("bposqntt");
        String bnegqntt = request.getParameter("bnegqntt");
        String abposqntt = request.getParameter("abposqntt");
        String abnegqntt = request.getParameter("abnegqntt");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bldms", "root", "");
            PreparedStatement ps = con.prepareStatement("update bloodbank set bldbank=?, phone=?, address=?, aposqntt=?, anegqntt=?, oposqntt=?, onegqntt=?, bposqntt=?, bnegqntt=?, abposqntt=?, abnegqntt=?  where email=?");
            ps.setString(1, bldbank);
            ps.setString(2, phone);
            ps.setString(3, address);
            ps.setInt(4, Integer.parseInt(aposqntt));
            ps.setInt(5, Integer.parseInt(anegqntt));
            ps.setInt(6, Integer.parseInt(oposqntt));
            ps.setInt(7, Integer.parseInt(onegqntt));
            ps.setInt(8, Integer.parseInt(bposqntt));
            ps.setInt(9, Integer.parseInt(bnegqntt));
            ps.setInt(10, Integer.parseInt(abposqntt));
            ps.setInt(11, Integer.parseInt(abnegqntt));
            ps.setString(12, email);

            ps.executeUpdate();
            session.setAttribute("bldbank", bldbank);
            session.setAttribute("phone", phone);
            session.setAttribute("address", address);
            session.setAttribute("aposqntt", aposqntt);
            session.setAttribute("anegqntt", anegqntt);
            session.setAttribute("oposqntt", oposqntt);
            session.setAttribute("onegqntt", onegqntt);
            session.setAttribute("bposqntt", bposqntt);
            session.setAttribute("bnegqntt", bnegqntt);
            session.setAttribute("abposqntt", abposqntt);
            session.setAttribute("abnegqntt", abnegqntt);
        } catch (SQLException ex) {
            Logger.getLogger(BBUpdateController.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BBUpdateController.class.getName()).log(Level.SEVERE, null, ex);
        }
        String msg = "<div class=\"alert alert-success\">\n" +
"        <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n" +
"        <strong>Success!</strong> Profile successfully saved\n" +
"      </div>";
        request.setAttribute("msg", msg);
        RequestDispatcher rd = request.getRequestDispatcher("bldbankProfile.jsp");
        rd.forward(request, response);
    }

}
