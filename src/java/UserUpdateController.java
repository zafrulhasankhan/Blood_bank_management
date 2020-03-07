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

/**
 *
 * @author Monir
 */
@WebServlet(name = "UserUpdateController", urlPatterns = {"/UserUpdateController"})
public class UserUpdateController extends HttpServlet {

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

        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String phone = request.getParameter("phone");
        String bloodgroup = request.getParameter("bldgrp");
        String address = request.getParameter("address");
        String age = request.getParameter("age");
        String bloodDonateDate = request.getParameter("donatedate");
        String donateStatus = request.getParameter("donatestatus");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bldms", "root", "");
            PreparedStatement ps = con.prepareStatement("update user set firstname=?, lastname=?, phone=?, bloodgroup=?, address=?, age=?, donatedate=?, donatestatus=?  where email=?");
            ps.setString(1, firstname);
            ps.setString(2, lastname);
            ps.setString(3, phone);
            ps.setString(4, bloodgroup);
            ps.setString(5, address);
            ps.setInt(6, Integer.parseInt(age));
            ps.setString(7, bloodDonateDate);
            ps.setString(8, donateStatus);
            ps.setString(9, email);

            ps.executeUpdate();
            session.setAttribute("fname", firstname);
            session.setAttribute("lname", lastname);
            session.setAttribute("phone", phone);
            session.setAttribute("address", address);
            session.setAttribute("age", age);
            session.setAttribute("bloodGroup", bloodgroup);
            session.setAttribute("bloodDonateDate", bloodDonateDate);
            session.setAttribute("donateStatus", donateStatus);
        } catch (SQLException ex) {
            Logger.getLogger(UserUpdateController.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserUpdateController.class.getName()).log(Level.SEVERE, null, ex);
        }
        String msg = "<div class=\"alert alert-success\">\n" +
"        <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n" +
"        <strong>Success!</strong> Profile successfully saved\n" +
"      </div>";
        request.setAttribute("msg", msg);
        RequestDispatcher rd = request.getRequestDispatcher("userProfile.jsp");
        rd.forward(request, response);
    }

}
