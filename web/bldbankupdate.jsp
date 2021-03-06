<%-- 
    Document   : userupdate
    Created on : Feb 15, 2020, 4:29:00 PM
    Author     : Zafrul Hasan Khan
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
                    <div class="panel-heading"> <h3 align=""center">Blood Bank Profile | ${bldbank}</h3></div>
                    <div class="panel-body">
                        <div class="form-horizontal">
                            <form action="BBUpdateController" method="post">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Blood Bank Name</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" type="text" placeholder="Blood Bank Name *" name="bldbank" value="${bldbank}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Email</label>
                                    <div class="col-sm-4">
                                        <input type="email" class="form-control" placeholder="Email *" name="email" value="${email}" readonly/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Address</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" placeholder="Address *" name="address" value="${address}"  required/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Phone</label>
                                    <div class="col-sm-4">
                                        <input type="text" minlength="11" maxlength="14"  class="form-control" placeholder="Phone *" name="phone" value="${phone}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">A+ Blood Quantity</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" type="text"  name="aposqntt" value="${aposqntt}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">A- Blood Quantity</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" type="text" name="anegqntt" value="${anegqntt}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">O+ Blood Quantity</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" type="text" name="oposqntt" value="${oposqntt}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">O- Blood Quantity</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" type="text" name="onegqntt" value="${onegqntt}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">B+ Blood Quantity</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" type="text" name="bposqntt" value="${bposqntt}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">B- Blood Quantity</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" type="text" name="bnegqntt" value="${bnegqntt}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">AB+ Blood Quantity</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" type="text" name="abposqntt" value="${abposqntt}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">AB- Blood Quantity</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" type="text" name="abnegqntt" value="${abnegqntt}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <input type="submit" class="btn btn-primary"  value="Save Update"/>
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
