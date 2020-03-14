/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "BBLoginController", urlPatterns = {"/BBLoginController"})
public class BBLoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        try {
            PrintWriter out;
            out = response.getWriter();
            Class.forName("com.mysql.jdbc.Driver");
            // loads driver
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/bldms", "root", "");

            PreparedStatement ps = c.prepareStatement("select * from bloodbank where email=(?) and password=(?)");
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            System.out.println("query visited");

            if (rs.next()) {
                String bldbank = rs.getString("bldbank");
                String emailno = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String aposqntt = rs.getString("aposqntt");
                String anegqntt = rs.getString("anegqntt");
                String oposqntt = rs.getString("oposqntt");
                String onegqntt = rs.getString("onegqntt");
                String bposqntt = rs.getString("bposqntt");
                String bnegqntt = rs.getString("bnegqntt");
                String abposqntt = rs.getString("abposqntt");
                String abnegqntt = rs.getString("abnegqntt");

                HttpSession session = request.getSession();
                session.setAttribute("bldbank", bldbank);
                session.setAttribute("email", emailno);
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

                RequestDispatcher rd = request.getRequestDispatcher("bldbankProfile.jsp");
                rd.forward(request, response);
            } else {
                String msg = "<div class=\"alert alert-warning\">\n"
                        + "                <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n"
                        + "                <strong>Oops!</strong> Wrong Username or Password! Try again...\n"
                        + "            </div>";
                request.setAttribute("msg", msg);
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException ex) {
            Logger.getLogger(BBLoginController.class.getName()).log(Level.SEVERE, null, ex);
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
