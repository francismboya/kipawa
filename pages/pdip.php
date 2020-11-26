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
                                <h5 class="text-white font-weight-bold m-0">Dear
                                    <?php echo "$name1 $name2  The following are List of Department  "; ?>
                                    <span><a class="btn btn-danger"> <span><i
                                                    class='fas fa-chart-line'></i></span></a></span>
                                </h5>


                            </div>
                            <div class="card-body">
                                <?php

?>
                                <div class="container">
                                    <div class="panel-body">
                                        <div class="panel-group" id="accordion">
                                            <div class="table-responsive">
                                                <table class="table table-bordered" id="dataTable2" width="100%"
                                                    cellspacing="0" style="font-size:16px;width:100%;">


                                                    <tr>
                                                        <th>Department ID</th>
                                                        <th>Department Name</th>
                                                        <th>Courses</th>
                                                        <th>Employee</th>
                                                        <th>Student</th>

                                                    </tr>


                                                    <tbody>
                                                        <?php
$uemail = $_SESSION['email'];

$query = "SELECT * from department where depertmentID!='MNG'";
$result = mysqli_query($db, $query) or die(mysqli_error($db));

while ($row = mysqli_fetch_assoc($result)) {
    echo '<tr>';
    echo '<td style="font-size:14px">' . $row['depertmentID'] . '</td>';
    echo '<td style="font-size:14px">' . $row['dName'] . '</td>';

    echo '<td align="center" style="font-size:14px">
        <form method="post" action="result1.php?">
        <input type="text" name="courseID" value="" style="display:none;">
        <input type="text" name="coID" value="" style="display:none;">

         <button type="submit" name="view" class="btn btn-success bg-gradient-success"><i class="far fa-eye" style="margin-right:5px;"></i>view</button>
         </form></td>'
    ;

    echo '<td align="center" style="font-size:14px">
        <form method="post" action="result1.php?">
        <input type="text" name="courseID" value="" style="display:none;">
        <input type="text" name="coID" value="" style="display:none;">

         <button type="submit" name="view" class="btn btn-success bg-gradient-success"><i class="far fa-eye" style="margin-right:5px;"></i>view</button>
         </form></td>'
    ;

    echo '<td align="center" style="font-size:14px">
        <form method="post" action="result1.php?">
        <input type="text" name="courseID" value="" style="display:none;">
        <input type="text" name="coID" value="" style="display:none;">

         <button type="submit" name="view" class="btn btn-success bg-gradient-success"><i class="far fa-eye" style="margin-right:5px;"></i>view</button>
         </form></td>'
    ;

    echo '</tr> ';
}
?>
                                                    </tbody>
                                                </table>
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
</div>
<?php include '../includes/footer.php';?>

</html>