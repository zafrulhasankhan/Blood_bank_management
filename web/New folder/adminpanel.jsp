

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Admin  | Dashboard</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta content="" name="description" />
        <meta content="" name="author" />
        <link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="vendor/themify-icons/themify-icons.min.css">
        <link href="vendor/animate.css/animate.min.css" rel="stylesheet" media="screen">
        <link href="vendor/perfect-scrollbar/perfect-scrollbar.min.css" rel="stylesheet" media="screen">
        <link href="vendor/switchery/switchery.min.css" rel="stylesheet" media="screen">
        <link href="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css" rel="stylesheet" media="screen">
        <link href="vendor/select2/select2.min.css" rel="stylesheet" media="screen">
        <link href="vendor/bootstrap-datepicker/bootstrap-datepicker3.standalone.min.css" rel="stylesheet" media="screen">
        <link href="vendor/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" media="screen">
        <link rel="stylesheet" href="assets/css/styles.css">
        <link rel="stylesheet" href="assets/css/plugins.css">
        <link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $(".link1").click(function (event) {
                    event.preventDefault();
                    var url = $(this).attr("href");
                    $('#right-pane').load(url, function (data) {
                        console.log(data);
                    });
                    console.log(url);
                });
            });
        </script>
    </head>
    <body style="background-image:url(https://www.elegantthemes.com/blog/wp-content/uploads/2013/09/bg-9-full.jpg)">
        <%@ page import ="java.sql.*" %>
        <%@ page import ="javax.sql.*" %>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bldms", "root", "");
            Statement st = con.createStatement();
            String pt = null, dt = null, at = null;
            ResultSet resultSet;
            String sql = "SELECT count(*) FROM user";
            resultSet = st.executeUpdate(sql);
            while (resultSet.next()) {
                pt = Integer.toString(resultSet.getInt(1));
            }
        %>
        <div id="app">		
            <div class="main-content" >
                <div class="wrap-content container" id="container">
                    <!-- start: PAGE TITLE -->
                    <section id="page-title">
                        <div class="row">
                            <div class="col-sm-8">
                                <b><h1 class="mainTitle">Admin | ${lastname} Dashboard</h1></b>
                            </div>
                        </div>
                    </section>
                   
                    <div class="container-fluid container-fullw bg-white">
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="panel panel-white no-radius text-center">
                                    <div class="panel-body">
                                        <span class="fa-stack fa-2x"> <i class="fa fa-square fa-stack-2x text-primary"></i> <i class="fa fa-smile-o fa-stack-1x fa-inverse"></i> </span>
                                        <h2 class="StepTitle">Manage Users</h2>

                                        <p class="links cl-effect-1">
                                            <a href="manageuser.jsp">Total users: <%=pt%></a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <%
                                resultSet = st.executeQuery("select count(*) from bloodbank");
                                while (resultSet.next()) {
                                    dt = Integer.toString(resultSet.getInt(1));
                                }
                            %>
                            <div class="col-sm-4">
                                <div class="panel panel-white no-radius text-center">
                                    <div class="panel-body">
                                        <span class="fa-stack fa-2x"> <i class="fa fa-square fa-stack-2x text-primary"></i> <i class="fa fa-users fa-stack-1x fa-inverse"></i> </span>
                                        <h2 class="StepTitle">Manage Blood Banks</h2>

                                        <p class="cl-effect-1">
                                            <a href="managebldbnk.jsp">

                                                Total blood banks: <%=dt%>
                                            </a>

                                        </p>
                                    </div>
                                </div>
                            </div>


                            <div class="col-sm-4">
                                <div class="panel panel-white no-radius text-center">
                                    <div class="panel-body">
                                        <span class="fa-stack fa-2x"> <i class="fa fa-square fa-stack-2x text-primary"></i> <i class="fa fa-google-wallet fa-stack-1x fa-inverse"></i> </span>
                                        <a href="http://api.greenweb.com.bd/g_api.php?token=3d24da3a2d2bfd10b1fd58f9d12ae54a&balance" class="link1"">
                                            <h2 class="StepTitle">Check Balance</h2> (TAKA)
                                        </a>

                                        <a href="https://sms.greenweb.com.bd/"><p class="cl-effect-1" id="right-pane"></p></a>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>




                </div>
            </div>
        </div>

    </div>

</body>
</html>
