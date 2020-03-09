<%-- 
    Document   : test
    Created on : Aug 25, 2019, 12:32:30 AM
    Author     : Zafrul Hasan Nasim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <title>Send SMS</title>
        <style>
            .contact-form{ margin-top:15px;}
            .contact-form .textarea{ min-height:150px; resize:none;}
            .form-control{ box-shadow:none; border-color:#eee; height:49px;}
            .form-control:focus{ box-shadow:none; border-color:#00b09c;}
            .form-control-feedback{ line-height:50px;}
            .main-btn{ background:#00b09c; border-color:#00b09c; color:#fff;}
            .main-btn:hover{ background:#00a491;color:#fff;}
            .form-control-feedback {
                line-height: 50px;
                top: 0px;
            }
        </style>
        <link href="css/navbar.css" rel="stylesheet" type="text/css" />
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.4/css/bootstrap.css" rel="stylesheet" type="text/css">
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
            <div class="row">
                <form role="form" class="contact-form" id="myform" action="http://api.greenweb.com.bd/api.php" method="post">
                    <input type="hidden" name="token" value="3d24da3a2d2bfd10b1fd58f9d12ae54a" />
                    <div class="form-group">
                        <label for="name">
                            Mobile</label>
                        <input type="text" class="form-control" name="to" value=<%=request.getParameter("contactno")%> readonly/>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="name">
                                    Message</label>
                                <textarea autofocus class="form-control textarea" rows="2" name="message" id="message" placeholder="your message here">Urgent <%=request.getParameter("bloodgroup")%> Blood needed, Name: <%=request.getParameter("firstname")%> <%=request.getParameter("lastname")%>, mobile: <%=request.getParameter("phone")%></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <button type="submit" class="btn main-btn pull-right">Send Message</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>


    </body>
</html>
