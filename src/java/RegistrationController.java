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


@WebServlet(name = "RegistrationController", urlPatterns = {"/RegistrationController"})
public class RegistrationController extends HttpServlet {

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
        String firstname = request.getParameter("fname");
        String lastname = request.getParameter("lname");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String bloodgroup = request.getParameter("bldgrp");
        String address = request.getParameter("address");
        String age = request.getParameter("age");

        String regSuccessAlert = "Registered Successfully!";
        String regErrorAlert = "Registration Failed!";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bldms", "root", "");
            PreparedStatement ps = con.prepareStatement("insert into user values(?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, firstname);
            ps.setString(2, lastname);
            ps.setString(3, username);
            ps.setString(4, password);
            ps.setString(5, gender);
            ps.setString(6, email);
            ps.setString(7, phone);
            ps.setString(8, bloodgroup);
            ps.setString(9, address);
            ps.setInt(10, Integer.parseInt(age));
            ps.setString(11, "N/A");
            ps.setString(12, "N/A");
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
