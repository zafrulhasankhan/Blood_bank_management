<%-- 
    Document   : search
    Created on : March 4, 2020, 9:45:40 AM
    Author     : Piya
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Controller.MyDb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <link href="css/navbar.css" rel="stylesheet" type="text/css" />
        <link href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.4/css/bootstrap.css" rel="stylesheet" type="text/css">
        <style>
            body{padding-top:30px;}

            .glyphicon {  margin-bottom: 10px;margin-right: 10px;}

            small {
                display: block;
                line-height: 1.428571429;
                color: #999;
            }
        </style>
        <title>Search Result</title>
    </head>
    <body>
        <header>
            <!-- ======================================Navigation Bar================================================= -->
            <nav class="navbar navbar-expand-lg navStyle">
                <a class="brand-navbar" href="#"><img src="images/blddrop.png" alt="Responsive image" height="60px"> Blood Management</a>
                <div class="collapse navbar-collapse" id="mainMenu">
                    <ul class="navbar-nav ml-auto navList">
                        <li class="nav-item">
                            <a href="index.jsp" class="nav-link"><i class="fas fa-home"></i>HOME</a>
                        </li>

                        <li class="nav-item">
                            <a href="search.jsp" class="nav-link"><i class="fas fa-search"></i>Search</a>
                        </li>

                        <li class="nav-item">
                            <a href="about.jsp" class="nav-link"><i class="fas fa-users"></i>About</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <div class="container">
            <div class=".col-xs-4 .col-md-offset-2">
                <div class="panel panel-default panel-info Profile">
                    <div class="panel-heading"> <h3 align=""center">Search Results</h3></div>
                    <div class="panel-body">
                        <div class="form-horizontal">

                            <%
                                try {

                                    String bloodgroup = request.getParameter("bloodgroup");
                                    String address = request.getParameter("address");

                                    MyDb db = new MyDb();
                                    Connection con = db.getCon();
                                    Statement stmt = con.createStatement();

                                    ResultSet rs = stmt.executeQuery("select * from user where bloodgroup='" + bloodgroup + "'and address='" + address + "'");
                                    while (rs.next()) {
                                        String firstname = rs.getString("firstname");
                                        String lastname = rs.getString("lastname");
                                        String bldg = rs.getString("bloodgroup");
                                        String add = rs.getString("address");
                                        String email = rs.getString("email");
                                        String phone = rs.getString("phone");
                                        String age = rs.getString("age");
                                        String gender = rs.getString("gender");
                                        String donatestatus = rs.getString("donatestatus");
                                        String donatedate = rs.getString("donatedate");

                            %>
                            <div class="col-xs-12 col-sm-6 col-md-6">
                                <div class="well well-sm">
                                    <div class="row">
                                        <div class="col">
                                            <img src="http://cdn.onlinewebfonts.com/svg/img_569204.png" height="200px" width="120px" alt="Search Result" class="" />
                                        </div>
                                        <div class="col-sm-6 col-md-8">
                                            <h4>
                                                <%out.print(firstname);%> <%out.print(lastname);%>
                                            </h4>
                                            <small>
                                                <cite title="<%out.print(add);%>">
                                                    <%out.print(address);%>
                                                    <i class="glyphicon glyphicon-map-marker">
                                                    </i>
                                                </cite>
                                            </small>

                                            <i class="glyphicon glyphicon-envelope"></i><%out.print(email);%>
                                            <br />
                                            <i class="glyphicon glyphicon-phone-alt"></i><%out.print(phone);%>
                                            <br />
                                            <strong>Age: </strong> <%out.print(age);%>
                                            <br />
                                            <strong>Blood Group: </strong> <%out.print(bldg);%>
                                            <br />
                                            <strong>Last Donation date: </strong> <%out.print(donatedate);%>
                                            <br />
                                            <strong>Donation eligibility: </strong> <%out.print(donatestatus);%>
                                            <form method="post" action="sendsms.jsp">
                                                <input type="hidden" name="firstname" value="${firstname}"/>
                                                <input type="hidden" name="lastname" value="${lastname}"/>
                                                <input type="hidden" name="bloodgroup" value="${bloodgroup}"/>
                                                <input type="hidden" name="phone" value="${phone}"/>
                                                <input type="hidden" name="contactno" value="'<%out.print(phone);%>'"/>
                                                <button class="btn btn-info"><i class="glyphicon glyphicon-send"></i></button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%

                                    }

                                } catch (Exception e) {
                                }


                            %>



                            <%                                                try {

                                    String bloodgroup = request.getParameter("bloodgroup");
                                    String address = request.getParameter("address");

                                    MyDb db = new MyDb();
                                    Connection con = db.getCon();
                                    Statement stmt = con.createStatement();

                                    ResultSet rs = stmt.executeQuery("select * from bloodbank where address='" + address + "'");
                                    while (rs.next()) {
                                        String bldbank = rs.getString("bldbank");
                                        String add = rs.getString("address");
                                        String email = rs.getString("email");
                                        String phone = rs.getString("phone");
                                        String aposqntt = rs.getString("aposqntt");
                                        String anegqntt = rs.getString("anegqntt");
                                        String oposqntt = rs.getString("oposqntt");
                                        String onegqntt = rs.getString("onegqntt");
                                        String bposqntt = rs.getString("bposqntt");
                                        String bnegqntt = rs.getString("bnegqntt");
                                        String abposqntt = rs.getString("abposqntt");
                                        String abnegqntt = rs.getString("abnegqntt");

                            %>
                            <div class="col-xs-12 col-sm-6 col-md-6">
                                <div class="well well-sm">
                                    <div class="row">
                                        <div class="col">
                                            <img src="images/details.png" height="200px" width="120px" alt="Search Result" class="" />
                                        </div>
                                        <div class="col-sm-6 col-md-8">
                                            <h4>
                                                <%out.print(bldbank);%></h4>
                                            <small><cite title="<%out.print(add);%>"><%out.print(address);%><i class="glyphicon glyphicon-map-marker">
                                                    </i></cite></small>
                                            <p>
                                                <i class="glyphicon glyphicon-envelope"></i><%out.print(email);%>
                                                <br />
                                                <i class="glyphicon glyphicon-phone-alt"></i><%out.print(phone);%>
                                                <br />
                                                <strong>A+ : </strong> <%out.print(aposqntt);%> bags
                                                &nbsp;&nbsp;|&nbsp;&nbsp;
                                                <strong>A- : </strong> <%out.print(anegqntt);%> bags
                                                <br />
                                                <strong>O+ : </strong> <%out.print(oposqntt);%> bags
                                                &nbsp;&nbsp;|&nbsp;&nbsp;
                                                <strong>O- : </strong> <%out.print(onegqntt);%> bags
                                                <br />
                                                <strong>B+ : </strong> <%out.print(bposqntt);%> bags
                                                &nbsp;&nbsp;|&nbsp;&nbsp;
                                                <strong>B- : </strong> <%out.print(bnegqntt);%> bags
                                                <br />
                                                <strong>AB+ : </strong> <%out.print(abposqntt);%> bags
                                                &nbsp;&nbsp;|&nbsp;&nbsp;
                                                <strong>AB- : </strong> <%out.print(abnegqntt);%> bags
                                            <form method="post" action="sendsms.jsp">
                                                <input type="hidden" name="firstname" value="${firstname}"/>
                                                <input type="hidden" name="lastname" value="${lastname}"/>
                                                <input type="hidden" name="bloodgroup" value="${bloodgroup}"/>
                                                <input type="hidden" name="phone" value="${phone}"/>
                                                <input type="hidden" name="contactno" value="'<%out.print(phone);%>'"/>
                                                <button class="btn btn-info"><i class="glyphicon glyphicon-send"></i></button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%

                                    }

                                } catch (Exception e) {
                                }


                            %>

                        </div>  <!-- end form-horizontal -->
                    </div> <!-- end panel-body -->

                </div> <!-- end panel -->


            </div> <!-- end size -->
        </div> <!-- end container-fluid -->

    </body>
</html>
