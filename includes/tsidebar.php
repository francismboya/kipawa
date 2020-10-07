<?php
require 'session.php';
confirm_logged_in();
?>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=0.6 user-scalable=no">

        <style type="text/css">
            #overlay {
                position: fixed;
                display: none;
                width: 100%;
                height: 100%;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 2;
                cursor: pointer;
            }

            #text {
                position: absolute;
                top: 50%;
                left: 50%;
                font-size: 50px;
                color: white;
                transform: translate(-50%, -50%);
                -ms-transform: translate(-50%, -50%);
            }
        </style>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="viewport" content="width=device-width, initial-scale=0.6 user-scalable=no">

        <title>SRM</title>
        <link rel="icon" href="../img/favicon.png" type="image/png" sizes="16x16">

        <!-- Custom fonts for this template-->
        <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="../css/sb-admin-2.min.css" rel="stylesheet">

        <!-- Custom styles for this page -->
        <link href="../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    </head>

    <body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primaryside sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.php">
                <div class="sidebar-brand-icon ">
                    <!-- <i class="fas fa-laugh-wink"></i>-->
                    <span class="icon"></span>
                </div>
                <div class="sidebar-brand-text mx-3">Student Record Manager</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="teacheractvity.php">
                    <i class="fas fa-fw fa-home"></i>
                    <span>Home</span></a>
            </li>
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                ACTIVITIES
            </div>
            <!-- Tables Buttons -->
            <li class="nav-item">
                <a class="nav-link" href="viedi.php">
                    <i class="fas fa-fw fa-user"></i>
                    <span>DEPARTMENT</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="viewcourse.php">
                    <i class="fas fa-fw fa-chalkboard-teacher"></i>
                    <span>COURSES</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="tviewst.php">

                    <i class="fas fa-fw fa-graduation-cap"></i>
                    <span>STUDENTS</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="../pages/recourseupload.php">
                    <i class="fas fa-fw fa-archive"></i>
                    <span>RESULTS</span></a>
            </li>


   <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->
<?php include_once 'topbar.php';?>