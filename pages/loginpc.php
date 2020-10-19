<?php $scr=0; ?>
<noscript>
<?php $scr=1; ?>
</noscript>
<div id='ajaxorg'>
    <div id="wait" style="display:none; justify-content: center;">
        <img src='../img/loadpage.gif'
            style="pointer-events: none; cursor: default; height: 280px; left: 50%; margin-top: -140px; margin-left: -140px; position: absolute; top: 50%; width: 280px;">
    </div>
    <html>
<head>
        <title>SRMS</title>
        <link type="text/css" href="../css/loginpc.css" rel="stylesheet" media="all" rel="stylesheet" />
        <link type="text/css" href="../css/main.css" rel="stylesheet" media="all" rel="stylesheet" />
        <script src="../vendor/jquery/jquery.min.js"></script>
        <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
        <link rel='stylesheet' href='../vendor/bootstrap/css/bootstrap.min.css'>
        <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="../js/sb-admin-2.min.js"></script>
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
            integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
            crossorigin="anonymous" />
        <link rel="icon" href="../img/favicon.png" type="image/png" sizes="16x16">
        <script src='../alertcss/alert.js'></script>
        <script src='../alertcss/index.js'></script>
        <script src='../alertcss/notify.min.js'></script>
        <script src='../js/ajax.js'></script>
    </head>

    <body>
        <div id="home">
            <div id="head">
                <div
                    style="float: left; width: 160px; height: 90px; margin: 0px 0px 0px 100px;  border: 0px solid red;">
                    <!--  <img src="../img/ngao.png" style="width: 130px; margin: 0px; height: 100px;" />-->

                </div>
                <div style="float: left; margin: 20px 0px 0px 10px;">
                    <div style="color: white; font-size: 25px; font-weight: bold;">
                        <!-- KIPAWA
                    ICT CENTER STUDENT
                    RECORD MANAGEMENT
                    SYSTEM-->
                    </div>
                </div>
                <div style="float: right; margin: 0px 50px 0px 0px; border: 0px solid red;">
                    <!--  <img src="../img/logo2.png" id="vetalg" style="width: 110px; margin:0px; height: 100px;" />-->
                </div>
                <div style="clear: both;"></div>


            </div>
            <div class="login_line">
            </div>
            <div id="head2">

                <div
                    style="float: left; color: #000000; font-weight: bold; font-size: 15px; margin:5px 0px 0px 50px; width: 300px;">
                    Academic Year : 2019/2020</div>
                <div
                    style="float:right; color: #000000; font-weight: bold; font-size: 15px; margin: 5px 0px 0px 0px; width: 300px;">
                    October 6, 2020</div>
                <div style="clear: both;"></div>
            </div>
            <div style="width: 1000px; border: 0px solid red; margin: auto;padding-bottom: 50px;overflow: auto; ">
                <div style="float: left; width: 400px; border: 0px; margin: 0px 0px 0px 10px; font-size: 12px;">

                    <p><b style="font-size:15px; color:black"> Welcome to SRMS</b><br />
                        <span style="margin-left: 15px; display: block; font-size:15px; color:black">The Student Record
                            Management
                            System (SRMS)
                            holds all the information relating to students.</span>
                    </p>

                    <p><b style="display: block; font-size:15px; color:black">Students</b></label>
                        <span style="display: block; text-indent: 15px; font-size:15px; color:black"><b>*</b> Register
                            for
                            Courses online</span>
                        <span style="display: block; text-indent: 15px; font-size:15px; color:black"><b>*</b> View
                            Course
                            Progress and Results</span>
                        <span style="display: block; text-indent: 15px; font-size:15px; color:black"><b>*</b>
                            Forums</span>


                    </p>

                    <p>
                        <b style="display: block; font-size:15px; color:black">Teaching Staff</b>
                        <span style="display: block; text-indent: 15px; font-size:15px; color:black"><b>*</b> View list
                            of
                            Students per Course</span>
                        <span style="display: block; text-indent: 15px; font-size:15px; color:black"><b>*</b> Publish
                            Course
                            Results</span>
                        <span style="display: block; text-indent: 15px; font-size:15px; color:black"><b>*</b> Track
                            Students
                            Progress/Reports</span>
                    </p>

                    <p>
                        <b style="display: block; font-size:15px; color:black">Other</b>
                        <span style="display: block; text-indent: 15px; font-size:15px; color:black"><b>*</b> Payment
                            Management</span>
                        <span style="display: block; text-indent: 15px;font-size:15px; color:black"><b>*</b>
                            Configuration</span>

                    </p>


                </div>

                <div
                    style="float: left; height: 350px; border: 1px solid #494949; width: 0px; margin: 12px 0px 0px 0px;">
                </div>
                <div style="float: left; width: 500px; border: 0px; margin: 20px 0px 0px 20px;">

                    <div style="color: red; font-size: 12px;">
                    </div>

                    <!--form-->
                    <div class="div1">
                        <div class="login-clean">
                            <h1>Login</h1>
                            <form method="post" action="processlogin.php" style="padding:3px" id="lgforms">
                                <input class="form-control input-user" type="email" name="user" placeholder="Email"
                                    id="emails" style="width:300px; margin-left:40px">

                                <input class="form-control input-pass" type="password" name="password" id="passwords"
                                    placeholder="Password" style="width:300px; margin-left:40px">

                                <button class=" btn btn-primary btn-block" name="btnlogin" type="submit" id='btnlogins'
                                    style="width:300px; margin-left:40px">Log In</button><a class=" forgot" id="forgot"
                                    href="#">Forgot
                                    your email or
                                    password?</a>
                            </form>
                        </div>
                    </div>
                    <!--form-->

                </div>
                <div style="clear: both;"></div>
            </div>
        </div>
        <div id="footer">
            <div class="login_line">
            </div>
            <p id="copyright" style="float: left; font-weight: bold;"> Copyright &copy; 2020 &nbsp; &nbsp; <a
                    href="http://muhas.ac.tz" target="_blank"> VETA KIPAWA SRMS</a></p>

            <p id="developers"><span> Designed and Developed by :</span> <a href="#" target="_blank"> KIPAWA ICT
                    CENTRE</a>

            </p>
        </div>
    </body>

    </html>
</div>
<script>
if (history.pushState) {
    var loc = window.location.href + "<?php echo $_SESSION['fname'] ?>"
    var passhash = CryptoJS.MD5(loc).toString();
    var id = "?encry#" + passhash;
    var pth = "/php/kipawa/pages/index.php"
    var newurl = window.location.protocol + "//" + window.location.host + pth + id;
    window.history.pushState("object or string", "Title", newurl);
} else {
    document.location.href = window.location.href;
}
</script>
