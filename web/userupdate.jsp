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
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <link href="css/navbar.css" rel="stylesheet" type="text/css" />
        <link href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.4/css/bootstrap.css" rel="stylesheet" type="text/css">
        <title>Update Details</title>
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
                    <div class="panel-heading"> <h3 align=""center">Update Profile | ${fname} ${lname}</h3></div>
                    <div class="panel-body">
                        <div class="form-horizontal">
                            <form action="UserUpdateController" method="post">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">First Name</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" type="text" name="firstname" placeholder="First Name *" value="${fname}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Last Name</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" type="text" name="lastname" placeholder="Last Name *" value="${lname}"  required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Email</label>
                                    <div class="col-sm-4">
                                        <input type="email" class="form-control" placeholder="Your Email *"  name="email" value="${email}" readonly/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Blood Group</label>
                                    <div class="col-sm-4">
                                        <select class="form-control" name="bldgrp" placeholder="Blood Group" value="${bloodGroup}" required>
                                            <option value="A+">A+</option>
                                            <option value="A-">A-</option>
                                            <option value="O+">O+</option>
                                            <option value="O-">O-</option>
                                            <option value="B+">B+</option>
                                            <option value="B-">B-</option>
                                            <option value="AB+">AB+</option>
                                            <option value="AB-">AB-</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Last Donation Date</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" type="text" name="donatedate" placeholder="date/month/year"  value="${bloodDonateDate}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Physical Condition</label>
                                    <div class="col-sm-4">
                                        <select class="form-control" name="donatestatus" placeholder="Blood Donate Status" value="${donateStatus}" required>
                                            <option class="hidden" value="" selected disabled>Please select your Blood Donation Condition</option>
                                            <option value="Can donate blood">Can donate blood</option>
                                            <option value="Already given blood in 56 days">Already given blood in 56 days</option>
                                            <option value="Health Condition not good">Health Condition not good</option>
                                            <option value="Age less than 16 years old">Age less than 16 years old</option>
                                            <option value="Weight less than 110 lbs">Weight less than 110 lbs</option>
                                            <option value="Viral infection">Viral infection</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Address</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control"  placeholder="Address *" name="address" value="${address}" required=""/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Phone</label>
                                    <div class="col-sm-4">
                                        <input type="text" minlength="11" maxlength="14" name="phone" class="form-control"  placeholder="Your Phone *" value="${phone}" required/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Age</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" type="text" name="age" placeholder="Age" value="${age}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <input type="submit" class="btn btn-primary"  value="Update"/>
                                    </div>
                                </div>
                            </form>
                        </div>  <!-- end form-horizontal -->
                    </div> <!-- end panel-body -->

                </div> <!-- end panel -->


            </div> <!-- end size -->
        </div> <!-- end container-fluid -->

    </body>
</html>
