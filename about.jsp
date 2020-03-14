<%-- 
    Document   : about
    Created on : Aug 4, 2019, 12:53:36 PM
    Author     : Monir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <style>
            .paddingTB60 {padding:60px 0px 60px 0px;}
            .gray-bg {background: #F1F1F1 !important;}
            .about-title {}
            .about-title h1 {color: #535353; font-size:45px;font-weight:600;}
            .about-title span {color: #AF0808; font-size:45px;font-weight:700;}
            .about-title h3 {color: #535353; font-size:23px;margin-bottom:24px;}
            .about-title p {color: #7a7a7a;line-height: 1.8;margin: 0 0 15px;}
            .about-paddingB {padding-bottom: 12px;}
            .about-img {padding-left: 57px;}

            /* Social Icons */
            .about-icons {margin:48px 0px 48px 0px ;}
            .about-icons i{margin-right: 10px;padding: 0px; font-size:35px;color:#323232;box-shadow: 0 0 3px rgba(0, 0, 0, .2);}
            .about-icons li {margin:0px;padding:0;display:inline-block;}
            #social-fb:hover {color: #3B5998;transition:all .001s;}
            #social-tw:hover {color: #4099FF;transition:all .001s;}
            #social-gp:hover {color: #d34836;transition:all .001s;}
            #social-em:hover {color: #f39c12;transition:all .001s;}
            
        </style>

        <title>About Page</title>
    </head>
    <body>
        <div class="about-section paddingTB60 gray-bg">
            <div class="container">
                <div class="row">
                    <div class="col-md-7 col-sm-6">
                        <div class="about-title clearfix">
                            <h1>About <span>BloodManagementProject</span></h1>
                            <h3>Easy way to find blood and save life </h3>
                            <p class="about-paddingB">Donors can register profile and give information.</p>
                            <p>Blood Banks can register their info</p>
                            <p>Anybody can search for blood group.</p>
                            <div class="about-icons"> 
                                <ul >
                                    <li><a href="https://www.facebook.com/"><i id="social-fb" class="fa fa-facebook-square fa-3x social"></i></a> </li>
                                    <li><a href="https://twitter.com/"><i id="social-tw" class="fa fa-twitter-square fa-3x social"></i></a> </li>
                                    <li> <a href="https://plus.google.com/"><i id="social-gp" class="fa fa-google-plus-square fa-3x social"></i></a> </li>
                                    





                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 col-sm-6">
                        
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

