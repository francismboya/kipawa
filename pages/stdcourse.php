<?php

include '../includes/connection.php';
include '../includes/stdsidebar.php';

$users = $_SESSION['users'];
$typid = $_SESSION['typid'];
$ID = $_SESSION['id'];

$query = "SELECT u." . $ID . ", t.statusName
                          FROM " . $users . " u
                          JOIN status t ON t.email=u.email WHERE u.email = '" . $_SESSION['email'] . "'";
$result = mysqli_query($db, $query) or die(mysqli_error($db));

while ($row = mysqli_fetch_assoc($result)) {
    $Aa = $row['statusName'];

    if ($Aa == 'User') {

        ?> <script type="text/javascript">
//then it will be redirected
alert("Restricted Page! You will be redirected to POS");
window.location = "index.php";
</script>
<?php }

}
?>






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

    </style>
</head>

<body id="page-top">

    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">

            <div class="container-fluid">
                <div class="d-sm-flex justify-content-between align-items-center mb-4">
                    <h3 class="text-dark mb-0" style="font-size:24px; font-style: italic;">Registered course: <?php echo
    "<span style='color:#007bff; margin-left:2px;'>" . $_SESSION['ID'] . "</span>"; ?>
                    </h3>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-xl-12 col-sm-12">
                        <div class="card mb-4">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h6 class="text-primary font-weight-bold m-0" style="font-style: italic;">The following
                                    are the courses registered
                                    by
                                    <?php echo " " . $_SESSION['fname'] . " " . $_SESSION['mname'] . " " . $_SESSION['lname'] ?>
                                </h6>

                            </div>
                            <div class="card-body">
                                <?php

?>
                                <div class="container">
                                    <h3 class="text-dark mb-1" style="font-size:24px; font-style: italic;">semester 1
                                    </h3>
                                    <div class="table-responsive" style="font-size:14px">
                                        <table class="table table-bordered" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th style="font-size:14px">SN</th>
                                                    <th style="font-size:14px">Course Code</th>
                                                    <th style="font-size:14px">Course Name</th>
                                                    <th style="font-size:14px">Classification</th>
                                                    <th style="font-size:14px">Credit</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
$query = "select course.courseID, course.cName, course.classfication,course.credit from student join courseprogram on courseprogram.programID=student.programID AND courseprogram.level=student.level
 join course on course.courseID=courseprogram.courseID WHERE student.regno='" . $_SESSION['ID'] . "' ORDER BY course.courseID";

$result = mysqli_query($db, $query) or die(mysqli_error($db));
$counter = 1;
while ($row = mysqli_fetch_assoc($result)) {
    $sem = substr($row['courseID'], 5, 1);
    if ($sem == 1) {
        echo '<tr>';
        echo '<td style="font-size:14px">' . $counter . '</td>';
        echo '<td style="font-size:14px">' . $row['courseID'] . '</td>';
        echo '<td style="font-size:14px">' . $row['cName'] . '</td>';
        if ($row['classfication'] == "c") {
            echo '<td style="font-size:14px">credit</td>';
        } else {
            echo '<td style="font-size:14px">fundamental</td>';

        }

        echo '<td style="font-size:14px">' . $row['credit'] . '</td>';

        echo '</tr> ';
        $counter++;
    }
}
?>
                                            </tbody>
                                        </table>
                                    </div>


                                </div>
                                <!--/semester 1 end-->
                                <!--semester2-->

                                <div class="container" id="sem2" style="display:none;">
                                    <h3 class="text-dark mb-1" style="font-size:24px; font-style: italic;">semester 2
                                    </h3>
                                    <div class="table-responsive" style="font-size:14px">
                                        <table class="table table-bordered" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th style="font-size:14px">SN</th>
                                                    <th style="font-size:14px">Course Code</th>
                                                    <th style="font-size:14px">Course Name</th>
                                                    <th style="font-size:14px">Classification</th>
                                                    <th style="font-size:14px">Credit</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
$query = "select course.courseID, course.cName, course.classfication,course.credit from student join courseprogram on courseprogram.programID=student.programID AND courseprogram.level=student.level
 join course on course.courseID=courseprogram.courseID WHERE student.regno='" . $_SESSION['ID'] . "' ORDER BY course.courseID";
$ifsem2 = 0;
$result = mysqli_query($db, $query) or die(mysqli_error($db));
$counter = 1;
while ($row = mysqli_fetch_assoc($result)) {
    $sem = substr($row['courseID'], 5, 1);
    if ($sem == 2) {
        $ifsem2 = 1;
        echo '<tr>';
        echo '<td style="font-size:14px">' . $counter . '</td>';
        echo '<td style="font-size:14px">' . $row['courseID'] . '</td>';
        echo '<td style="font-size:14px">' . $row['cName'] . '</td>';
        if ($row['classfication'] == "c") {
            echo '<td style="font-size:14px">credit</td>';
        } else {
            echo '<td style="font-size:14px">fundamental</td>';

        }

        echo '<td style="font-size:14px">' . $row['credit'] . '</td>';

        echo '</tr> ';
        $counter++;
    }
}
?>
                                            </tbody>
                                        </table>
                                    </div>


                                </div>




                                <!--/semester2 end-->
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
if ($ifsem2 == "1") {
    ?>
<script>
var sm = document.getElementById("sem2");
sm.style.display = "block";
</script>
<?php
}
?>


</html>




<a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>