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

/**
 *
 * @author Monir
 */
@WebServlet(name = "BBRegistrationController", urlPatterns = {"/BBRegistrationController"})
public class BBRegistrationController extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        String regSuccessAlert = "Registered Successfully!";
        String regErrorAlert = "Registration Failed!";
        String bldbank = request.getParameter("bldbank");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bldms", "root", "");
            PreparedStatement ps = con.prepareStatement("insert into bloodbank values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, bldbank);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, password);
            ps.setString(5, address);
            ps.setString(6, "0");
            ps.setString(7, "0");
            ps.setString(8, "0");
            ps.setString(9, "0");
            ps.setString(10, "0");
            ps.setString(11, "0");
            ps.setString(12, "0");
            ps.setString(13, "0");
            int i = ps.executeUpdate();
            if (i > 0) {
                request.setAttribute("regSuccessAlert", regSuccessAlert);
                RequestDispatcher rd = request.getRequestDispatcher("registrationsuccess.jsp");
                rd.forward(request, response);
            }
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationController.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegistrationController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
