<%-- 
    Document   : userupdate
    Created on : Mar 3, 2020, 4:29:00 PM
    Author     : Zafrul Hasan Nasim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <link href="css/navbar.css" rel="stylesheet" type="text/css" />
        <link href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.4/css/bootstrap.css" rel="stylesheet" type="text/css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <title>${fname} ${lname} Details</title>
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
            ${msg}
            <%
               String firstname = session.getAttribute("fname").toString();
               
                session.setAttribute("firstname", firstname);
                String lastname = session.getAttribute("lname").toString();
               
                session.setAttribute("lastname", lastname);
                String bloodgroup = session.getAttribute("bloodGroup").toString();
               
                session.setAttribute("bloodgroup", bloodgroup);
            %>
            <div class=".col-xs-4 .col-md-offset-2">
                <div class="panel panel-default panel-info Profile">
                    <div class="panel-heading"> <h3 align=""center">My Profile | ${fname} ${lname}</h3></div>
                    <div class="panel-body">
                        <div class="form-horizontal">
                            <form>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">First Name</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" type="text" name="firstname" value="${fname}" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Last Name</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" type="text" value="${lname}" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Username</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" type="text" value="${username}" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Email</label>
                                    <div class="col-sm-4">
                                        <input type="email" class="form-control"  value="${email}" readonly/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Blood Group</label>
                                    <div class="col-sm-4">
                                        <input type="email" class="form-control" value="${bloodGroup}" readonly/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Last Donation Date</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" type="text" placeholder="N/A" value="${bloodDonateDate}" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Donation Status</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control"  placeholder="N/A" value="${donateStatus}" readonly/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Address</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" value="${address}"  readonly/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Phone</label>
                                    <div class="col-sm-4">
                                        <input type="text" minlength="11" maxlength="14"  class="form-control" value="${phone}" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Age</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" type="text"  value="${age}" readonly>
                                    </div>
                                </div>

                            </form>

                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <a href="userupdate.jsp"><button  class="btn btn-primary">Update Profile</button></a>
                                </div>
                            </div>
                        </div>  <!-- end form-horizontal -->
                    </div> <!-- end panel-body -->

                </div> <!-- end panel -->


            </div> <!-- end size -->
        </div> <!-- end container-fluid -->

    </body>
</html>
