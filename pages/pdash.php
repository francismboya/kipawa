<!DOCType html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>KICTC| Principal</title>
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/Animated-Type-Heading.js"></script>
    <link rel="icon" href="../img/logo2.png" type="image/png" sizes="16x16">
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="../assets/fonts/fontawesome-all.min.css">
    <script src="../charts/dist/Chart.bundle.js"></script>
    <style type="text/css">
    .container1 {
        width: 50%;
        margin: 15px auto;
    }
    </style>
</head>

<body id="page-top">
    <?php
include '../includes/connection.php';
include '../includes/psidebar.php';
$name1 = $_SESSION['fname'];
$name2 = $_SESSION['lname'];
?>
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-xl-12 col-sm-12">
                        <div class="card shadow mb-4">
                            <div class="btn-danger card-header d-flex justify-content-between align-items-center"
                                style="background: url('../img/gold.jpeg');background-size: cover ">
                                <h6 class="text-white font-weight-bold m-0">Principal Panel</h6>

                            </div>
                            <div class="card-body">
                                <?php

?>
                                <div class="container">
                                    <div class="panel-body">
                                        <div class="panel-group" id="accordion">
                                            <p align='justify'>You have successfully logged to VETA Kipawa ICT Centre
                                                Student Records Management System (SRMS).You currently have
                                                access to the following sections</p>
                                            </br>
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <ul>
                                                        <li>Edit your Info</li>
                                                        <li>View Department</li>
                                                        <li>Manage Academic Session</li>
                                                        <li>View Result Summary</li>
                                                        <li>Issue Public Announcement</li>

                                                    </ul>
                                                    </br>
                                                    Please select appropriate action to continue...!
                                                    </br>
                                                </div>

                                                <div class="col-sm-4" style="background-color:#827be6
;">
                                                    <img src='../img/gold23.gif'
                                                        style=" pointer-events: none; cursor: default; height:100%; width:100%;">


                                                </div>
                                                <div class="col-sm-4" style="background-color:#3ee8c4
;">
                                                    <img src='../img/gold234.gif'
                                                        style=" pointer-events: none; cursor: default; height:100%; width:100%;">


                                                </div>

                                            </div>
                                        </div>
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
<?php include '../includes/footer.php';?>

</html>