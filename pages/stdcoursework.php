<?php
$sql3 = "
SELECT coursework.courseID, coursework.score,
 coursework.remarks, coursework.remarks, coursework.coID,
 studentviewco.stateView FROM coursework JOIN studentviewco ON
 studentviewco.coID=coursework.coID
where regno='KICTC-CER-006-2020' and coursework.coID='ITT051022020'";

include '../includes/connection.php';
include '../includes/stdsidebar.php';
if (isset($_GET['year'])) {
    $_SESSION['coID'] = $_GET['year'];
}
$pub = 0;
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
$query = "select course.courseID, course.cName, course.classfication,course.credit from student join courseprogram on courseprogram.programID=student.programID AND courseprogram.level=student.level
 join course on course.courseID=courseprogram.courseID WHERE student.regno='" . $_SESSION['ID'] . "' ORDER BY course.courseID";

$result21 = mysqli_query($db, $query) or die(mysqli_error($db));

$courses = array();
$counter = 0;
while ($row = mysqli_fetch_assoc($result21)) {
    $courses[$counter] = $row['courseID'];

    $counter++;

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
                    <h3 class="text-dark mb-0" style="font-size:24px; font-style: italic;">Coursework Scores: <?php echo
    "<span style='color:#007bff; margin-left:2px;'>" . $_SESSION['ID'] . "</span>"; ?>
                    </h3>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-xl-12 col-sm-12">
                        <div class="card mb-4">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h6 class="text-primary font-weight-bold m-0" style="font-style: italic;">The following
                                    are the coursework results for
                                    <?php echo " " . $_SESSION['fname'] . " " . $_SESSION['mname'] . " " . $_SESSION['lname'] ?>
                                </h6>

                            </div>
                            <div class="card-body" id="sempub" style="display:none">
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
                                                    <th style="font-size:14px">Score</th>
                                                    <th style="font-size:14px">Remark</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
$counter = 1;

foreach ($courses as $cb) {
    $cid = $cb . $_SESSION['coID'];
    $query = "
SELECT coursework.courseID, coursework.score,
 course.cName, coursework.remarks, coursework.coID,
 studentviewco.stateView FROM coursework JOIN studentviewco ON
 studentviewco.coID=coursework.coID JOIN course on coursework.courseID=course.courseID
where regno='" . $_SESSION["ID"] . "' and coursework.coID='" . $cid . "'";
    $result = mysqli_query($db, $query) or die(mysqli_error($db));

    if (mysqli_num_rows($result) > 0) {

        while ($row = mysqli_fetch_assoc($result)) {
            if ($row['stateView'] == "yes") {
                if ($pub == 0) {
                    $pub = 1;

                }

                $sem = substr($row['courseID'], 5, 1);
                if ($sem == 1) {

                    if ($row['remarks'] == "pass") {
                        echo '<tr>';

                    } else {

                        echo '<tr class="text-danger">';

                    }
                    echo '<td style="font-size:14px" class="text-dark">' . $counter . '</td>';
                    echo '<td style="font-size:14px">' . $row['courseID'] . '</td>';
                    echo '<td style="font-size:14px">' . $row['cName'] . '</td>';
                    echo '<td style="font-size:14px">' . $row['score'] . '</td>';

                    echo '<td style="font-size:14px ;">' . $row['remarks'] . '</td>';

                    echo '</tr> ';
                    $counter++;
                }
            }
        }
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
                                                    <th style="font-size:14px">Score</th>
                                                    <th style="font-size:14px">Remark</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
$counter = 1;
$ifsem2 = 0;

foreach ($courses as $cb) {
    $cid = $cb . $_SESSION['coID'];
    $query = "

SELECT coursework.courseID, coursework.score,
 course.cName, coursework.remarks, coursework.coID,
 studentviewco.stateView FROM coursework JOIN studentviewco ON
 studentviewco.coID=coursework.coID JOIN course on coursework.courseID=course.courseID
where regno='" . $_SESSION["ID"] . "' and coursework.coID='" . $cid . "'";
    $result = mysqli_query($db, $query) or die(mysqli_error($db));

    if (mysqli_num_rows($result) > 0) {

        while ($row = mysqli_fetch_assoc($result)) {
            if ($row['stateView'] == "yes") {
                if ($pub == 0) {
                    $pub = 1;

                }

                $sem = substr($row['courseID'], 5, 1);
                if ($sem == 2) {
                    $ifsem2 = 1;
                    if ($row['remarks'] == "pass") {
                        echo '<tr>';

                    } else {

                        echo '<tr class="text-danger">';

                    }
                    echo '<td style="font-size:14px" class="text-dark">' . $counter . '</td>';
                    echo '<td style="font-size:14px">' . $row['courseID'] . '</td>';
                    echo '<td style="font-size:14px">' . $row['cName'] . '</td>';
                    echo '<td style="font-size:14px">' . $row['score'] . '</td>';

                    echo '<td style="font-size:14px ;">' . $row['remarks'] . '</td>';

                    echo '</tr> ';

                    $counter++;
                }
            }
        }
    }
}
?>
                                            </tbody>
                                        </table>
                                    </div>


                                </div>




                                <!--/semester2 end-->
                            </div>
                            <!--unpub-->
                            <div class="card-body bg-gradient-warning" id="sempub2" style="display:none;">
                                <h4 class="card-title">Dear user</h4>
                                <p class="card-text text-dark font-italic font-weight-bold">Coursework Result for this
                                    academic year
                                    Not published
                                    yet
                                </p>
                            </div>
                            <!--/unpub-->
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

<?php
if ($pub == 0) {
    ?>
<script>
var sm = document.getElementById("sempub2");
sm.style.display = "block";
var sm2 = document.getElementById("sempub");
sm2.style.display = "none";
</script>
<?php
}
?>
<?php
if ($pub == 1) {
    ?>
<script>
var sm = document.getElementById("sempub2");
sm.style.display = "none";
var sm2 = document.getElementById("sempub");
sm2.style.display = "block";
</script>
<?php
}
?>

</html>




<a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>