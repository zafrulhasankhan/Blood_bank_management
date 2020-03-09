
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Admin | Manage Users</title>
        <meta charset="utf-8" />
        <style>
            .panel-table .panel-body .table-bordered > thead > tr > th:first-of-type {

            }
            .row{
                margin-top:40px;
                padding: 0 10px;
            }
            .clickable{
                cursor: pointer;   
            }

            .panel-heading div {
                margin-top: -18px;
                font-size: 15px;
            }
            .panel-heading div span{
                margin-left:5px;
            }
        </style>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <link href="css/navbar.css" rel="stylesheet" type="text/css" />
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.4/css/bootstrap.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.Connection"%>
        <%
            String id = request.getParameter("id");
            String userID = null;
            String driverName = "com.mysql.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/";
            String dbName = "bldms";
            String userId = "root";
            String password = "";

            try {
                Class.forName(driverName);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
        %>
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
            <div class="row">

                <div class="col-md-12 table-responsive">
                    <div class="panel panel-primary">

                        <div class="panel-heading">
                            <h3 class="panel-title">${lastname} | Manage Users</h3>
                        </div>


                        <div class="panel-body">


                            <table class="table table-striped table-bordered table-list" id="sample-table-1">
                                <thead>
                                    <tr>
                                        <th><b>Name</b></th>
                                        <th><b>Email</b></th>
                                        <th><b>Contact_no</b></th>
                                        <th><b>Address</b></th>
                                        <th><b>Age</b></th>
                                        <th><b>Blood Group</b></th>
                                        <th><b>Last donated date</b></th>
                                        <th><b>Donation eligibility</b></th>
                                        <th align="center" style="text-align:center"><em class="fa fa-cog"></em></th>
                                    </tr>
                                    <%
                                        try {
                                            connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                            statement = connection.createStatement();
                                            String sql = "SELECT * FROM user";

                                            resultSet = statement.executeQuery(sql);
                                            while (resultSet.next()) {
                                    %>
                                </thead>
                                <tbody>

                                    <tr>
                                        <td><%=resultSet.getString("firstname")%> <%=resultSet.getString("lastname")%></td>
                                        <td><%=resultSet.getString("email")%></td>
                                        <td><%=resultSet.getString("phone")%></td>
                                        <td><%=resultSet.getString("address")%></td>
                                        <td><%=resultSet.getString("age")%></td>
                                        <td><%=resultSet.getString("bloodgroup")%></td>
                                        <td><%=resultSet.getString("donatedate")%></td>
                                        <td><%=resultSet.getString("donatestatus")%></td>
                                        <td align="center">
                                            <form method="post" action="sendsms.jsp">
                                                <input type="hidden" name="firstname" value="${firstname}"/>
                                                <input type="hidden" name="lastname" value="${lastname}"/>
                                                <input type="hidden" name="bloodgroup" value="${bloodgroup}"/>
                                                <input type="hidden" name="phone" value="${phone}"/>
                                                <input type="hidden" name="contactno" value="'<%=resultSet.getString("phone")%>'"/>
                                                <button class="btn btn-info"><em class="fa fa-comment"></em></button>
                                            </form>
                                            <a href="deleteuser.jsp?uname='<%=resultSet.getString("username")%>'" class="btn btn-danger"><em class="fa fa-trash"></em></a>
                                        </td>
                                    </tr>
                                    <%
                                            }

                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>

                                </tbody>
                            </table>

                        </div>


                    </div>
                </div>


            </div>
        </div>


    </body>
</html>
