<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Dashboard - Brand</title>
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap4/js/bootstrap.min.js"></script>
    <link href="../vendor/bootstrap4/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="../assets/fonts/fontawesome-all.min.css">
    <script src="../chart/dist/Chart.bundle.js"></script>
    <style type="text/css">
    .container1 {
        width: 50%;
        margin: 15px auto;
    }

    .msg_cotainer {
        margin-top: auto;
        margin-bottom: auto;
        margin-left: 10px;
        border-radius: 25px;
        background-color: blue;
        position: relative;
        font-weight: bolder;
        margin-left: 35%;
        margin-right: 25%;
        color: white;
    }
    </style>
</head>

<body id="page-top">
    <?php
include '../includes/connection.php';
include '../includes/stdsidebar.php';
?>
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-xl-12 col-sm-12">
                        <div class="card shadow mb-4">
                            <div class="card-header d-flex justify-content-between align-items-center">

                                Academic Coursework Result

                            </div>
                            <div class="card-body">
                                <?php

?>
                                <!--hidden-->
                                <div class="container">
                                    <div class="panel-body">
                                        <div class="panel-group" id="accordion">

                                            <!--SEM-->
                                            <style>
                                            .emptytz {
                                                display: none;
                                            }
                                            </style>
                                            <div id="prog" class="row">
                                                <?php
$a = 0;
$search = "SELECT DISTINCT * FROM `semisterstate` ORDER BY seID DESC";
$returned = mysqli_query($db, $search);
if (mysqli_num_rows($returned) > 0) {
    while ($oursem = mysqli_fetch_assoc($returned)) {
        if ($a == 0) {

            ?>

                                                <div class="col-sm-12 col-md-12">
                                                    <div class="card">

                                                        <div class="card-body">
                                                            <h6 class="card-title font-italic font-weight-bold">This
                                                                section lets you
                                                                view your Coursework
                                                                results for particular year of study,
                                                                Please select a
                                                                year of study to view your coursework results:</h6>
                                                            <?php $a++;}?>
                                                            <li><a
                                                                    href="stdcoursework.php?year=<?php echo substr($oursem['seID'], 5) ?>">
                                                                    Coursework Results - <?php echo $oursem['seID'] ?>
                                                                </a></li>
                                                            <?php
$a++;
    }
    ?>
                                                        </div>
                                                    </div>


                                                </div>
                                                <?php
} else {
    ?>
                                                <div class="col-sm-12 col-md-12">
                                                    <div class="card">

                                                        <div class="card-body bg-gradient-warning">
                                                            <h4 class="card-title">Dear user</h4>
                                                            <p class="card-text text-dark font-italic font-weight-bold">
                                                                No academic
                                                                session started
                                                                yet
                                                            </p>

                                                        </div>
                                                    </div>

                                                </div>
                                                <?php

}
?>
                                            </div>
                                            <!--/SEM-->



                                        </div>
                                    </div>
                                </div>
                                <!--/hidden-->

                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
</body>
<?php
include "../includes/footer2.php";
?>

<script>
// Access the array elements
function expert2(bot) {
    // var cols = document.getElementsByClassName('hid');
    // for (i = 0; i < cols.length; i++) {
    //  cols[i].style.display = 'none';
    // }
    var col = document.getElementById("hid");
    if (bot.value == "OFF") {
        bot.value = "ON";
        bot.className = "btn btn-primary";
        jc = document.getElementById("togglef");
        jc.style.display = "block";
        bot.style.background = "#007bff";
        jc3 = document.getElementById("prog");
        jc3.className = "emptytz";
    } else if (bot.value = "ON") {
        bot.value = "OFF";
        jc = document.getElementById("togglef");
        jcb = document.getElementById("prog");
        jc.style.display = "none";
        //jcb.style.display = "initial";
        jcb.className = "row";
        bot.style.background = "#9e9e9e";
    }
}
</script>


</html>