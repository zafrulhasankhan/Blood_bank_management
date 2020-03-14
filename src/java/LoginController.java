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


@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("username");
        String password = request.getParameter("password");
        try {
            PrintWriter out;
            out = response.getWriter();
            Class.forName("com.mysql.jdbc.Driver");
            // loads driver
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/bldms", "root", "");

            PreparedStatement ps = c.prepareStatement("select * from user where username=(?) and password=(?)");
            ps.setString(1, user);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            System.out.println("query visited");

            if (rs.next()) {
                String fname = rs.getString("firstname");
                String lname = rs.getString("lastname");
                String username = rs.getString("username");
                String email = rs.getString("email");
                String age = rs.getString("age");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String gender = rs.getString("gender");
                String bloodGroup = rs.getString("bloodgroup");
                String bloodDonateDate = rs.getString("donatedate");
                String donateStatus = rs.getString("donatestatus");

                System.out.println(fname + lname + username + email + age + phone + address + gender + bloodGroup + bloodDonateDate + donateStatus);

                HttpSession session = request.getSession();
                session.setAttribute("fname", fname);
                session.setAttribute("lname", lname);
                session.setAttribute("username", username);
                session.setAttribute("email", email);
                session.setAttribute("phone", phone);
                session.setAttribute("address", address);
                session.setAttribute("age", age);
                session.setAttribute("bloodGroup", bloodGroup);
                session.setAttribute("bloodDonateDate", bloodDonateDate);
                session.setAttribute("donateStatus", donateStatus);

                RequestDispatcher rd = request.getRequestDispatcher("userProfile.jsp");
                rd.forward(request, response);
            } else {
                String msg = "<div class=\"alert alert-warning\">\n" +
"                <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n" +
"                <strong>Oops!</strong> Wrong Username or Password! Try again...\n" +
"            </div>";
                request.setAttribute("msg", msg);
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
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
