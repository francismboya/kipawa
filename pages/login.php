<div id='ajaxorg'>
    <div id="wait" style="display:none; justify-content: center;">
        <img src='../img/vetaloadig.gif'
            style=" pointer-events: none; cursor: default; height: 250px; left: 50%; margin-top: -125px; margin-left: -125px; position: absolute; top: 50%; width: 250px;">
    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../js/sb-admin-2.min.js"></script>
    <script src="../js/ajax.js"></script>
    <script src='../alertcss/alert.js'></script>
    <script src='../alertcss/notify.min.js'></script>


    <?php require 'session.php';
//if (isset($_COOKIE['sw'])) {
//   echo $_COOKIE['sw'];
//}
//if (isset($_COOKIE['sh'])) {
//   echo $_COOKIE['sw'];
//}
?>
    <?php if (logged_in()) {?>
    <script type="text/javascript">
    window.location = "index.php";
    </script>

    <?php
}
?>
    <script type="text/javascript">
    function setscreencookies() {
        var width = window.innerWidth;
        if (width <= 1000) {
            callmb();
        } else if (width > 1000) {
            callpc();

        }
        return true;
    }
    setscreencookies();
    </script>


    <!DOCTYPE html>
    <html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="img/favicon.png" type="image/png" sizes="16x16">
        <title>SRMS</title>

        <!-- Custom fonts for this template-->
        <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="../css/sb-admin-2.min.css" rel="stylesheet">

    </head>

    <body class="bg-gradient-primary2">


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