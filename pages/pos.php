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
<?php
include '../includes/connection.php';
require 'session.php';
include '../includes/topbar.php';
?>
<div class="row">
    <div class="col-lg-12">
        <div class="card shadow mb-0">
            <div class="card-header py-2">
                <h4 class="m-1 text-lg text-primary">Result Panel</h4>
            </div>
            <!-- /.panel-heading -->
            <div class="card-body">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-target="#keyboard" data-toggle="tab">ITT</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-target="#mouse" data-toggle="tab">ELEC</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#headset" data-toggle="tab">ELECT</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#cpu" data-toggle="tab">COMPUTER SCIENCE</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#monitor" data-toggle="tab">TELECOM</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#motherboard" data-toggle="tab">ICT</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#processor" data-toggle="tab">SHORT COURSE</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#powersupply" data-toggle="tab">CORE</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#others" data-toggle="tab">Others</a>
                    </li>
                </ul>

                <!-- TAB PANE AREA - ANG UNOD KA TABS ARA SA TABPANE.PHP -->
                <?php include 'postabpane.php';?>
                <!-- END TAB PANE AREA - ANG UNOD KA TABS ARA SA TABPANE.PHP -->

                <div style="clear:both"></div>
                <br />
                <div class="card shadow mb-4 col-md-12">
                    <div class="card-header py-3 bg-white">
                        <h4 class="m-2 font-weight-bold text-primary">RESULTS</h4>
                    </div>

                    <div class="row">
                        <div class="card-body col-md-9">
                            <div class="table-responsive">

                                <!-- trial form lang   -->
                                <form role="form" method="post" action="pos_transac.php?action=add">
                                    <input type="hidden" name="employee" value="<?php echo $_SESSION['FIRST_NAME']; ?>">
                                    <input type="hidden" name="role" value="<?php echo $_SESSION['JOB_TITLE']; ?>">

                                    <table class="table">
                                        <tr>
                                            <th width="55%">Student name</th>
                                            <th width="10%">registration number</th>
                                            <th width="15%">coursework</th>
                                            <th width="15%">result</th>
                                            <th width="5%">status</th>
                                        </tr>
                                        <?php

if (!empty($_SESSION['pointofsale'])):

    $total = 0;

    foreach ($_SESSION['pointofsale'] as $key => $product):
    ?>
                                        <tr>
                                            <td>
                                                <input type="hidden" name="name[]"
                                                    value="<?php echo $product['name']; ?>">
                                                <?php echo $product['name']; ?>
                                            </td>

                                            <td>
                                                <input type="hidden" name="quantity[]"
                                                    value="<?php echo $product['quantity']; ?>">
                                                <?php echo $product['quantity']; ?>
                                            </td>

                                            <td>
                                                <input type="hidden" name="price[]"
                                                    value="<?php echo $product['price']; ?>">
                                                TZS <?php echo number_format($product['price']); ?>
                                            </td>

                                            <td>
                                                <input type="hidden" name="total"
                                                    value="<?php echo $product['quantity'] * $product['price']; ?>">
                                                TZS
                                                <?php echo number_format($product['quantity'] * $product['price'], 2); ?>
                                            </td>
                                            <td>
                                                <a href="pos.php?action=delete&id=<?php echo $product['id']; ?>">
                                                    <div class="btn bg-gradient-danger btn-danger"><i
                                                            class="fas fa-fw fa-trash"></i></div>
                                                </a>
                                            </td>
                                        </tr>
                                        <?php
    $total = $total + ($product['quantity'] * $product['price']);
endforeach;
?>


                                        <?php
endif;
?>
                                    </table>
                            </div>
                        </div>

                        <?php
include 'posside.php';

?>

                    </div>
                    <?php
include '../includes/footer.php';
?>