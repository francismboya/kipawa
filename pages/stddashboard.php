<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Dashboard - Brand</title>
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="../assets/fonts/fontawesome-all.min.css">
    <script src="../chart/dist/Chart.bundle.js"></script>
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
include '../includes/stdsidebar.php';

?>
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">

            <div class="container-fluid">
                <div class="d-sm-flex justify-content-between align-items-center mb-4">
                    <h3 class="text-dark mb-0">Dashboard</h3>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-xl-12 col-sm-12">
                        <div class="card shadow mb-4">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h6 class="text-primary font-weight-bold m-0">Granted activity</h6>

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
                                            <ul>
                                                <li>Edit your Info</li>
                                                <li>View course</li>
                                                <li>Coursework(s)</li>
                                                <li>Course results</li>
                                                <li>Appeal</li>
                                                <li>Course Materials & Notes</li>
                                            </ul>
                                            </br></br>
                                            Please select appropriate action to continue...!
                                            </br></br>
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
<?php
include "../includes/footer.php";
?>

</html>




<a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>