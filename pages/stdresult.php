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
                    <h3 class="text-dark mb-0" style="font-size:24px; font-style: italic;">Course Result: <?php echo
    "<span style='color:#007bff; margin-left:2px;'>" . $_SESSION['ID'] . "</span>"; ?>
                    </h3>
                </div>
                <div class="row">

                    <div class="col-lg-12 col-xl-12 col-sm-12">
                        <div class="card mb-4">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h6 class="text-primary font-weight-bold m-0" style="font-style: italic;">The following
                                    are the course results for
                                    <?php echo " " . $_SESSION['fname'] . " " . $_SESSION['mname'] . " " . $_SESSION['lname'] ?>
                                </h6>

                            </div>
                            <div class="card-body" id="sempub" style="display:none">
                                <div class="col-lg-6 col-xl-6" id="gpa" style="display:none;">
                                    <div class="card  mb-4">
                                        <div class="card-header d-flex justify-content-between align-items-center">
                                            <h6 class="text-primary font-weight-bold m-0">Year Result Summary
                                            </h6>

                                        </div>
                                        <div class="card-body">
                                            <!--start-->
                                            <?php

$credit = 0;
$gradep = 0;
$gpac = 0;
$gpa = 0;
$remarks = "";
foreach ($courses as $cb) {
    $cid = $cb . $_SESSION['coID'];
    $query = "SELECT * from
                                            (SELECT courseID, score as scr, result.grade, regno, coID
                                            FROM result
                                            WHERE regno='" . $_SESSION["ID"] . "' AND coID='" . $cid . "') a

                                            JOIN

                                            (SELECT *
                                            FROM coursework
                                            WHERE regno='" . $_SESSION["ID"] . "' AND coID='" . $cid . "') b
                                            JOIN
                                            (SELECT *
                                            FROM course
                                            WHERE courseID='" . $cb . "') c
                                            ON a.regno = b.regno and a.coID = b.coID and b.courseID=c.courseID";
    $result = mysqli_query($db, $query) or die(mysqli_error($db));

    if (mysqli_num_rows($result) > 0) {

        while ($row = mysqli_fetch_assoc($result)) {
            if ($row['grade'] == "A") {
                $credit = $credit + $row['credit'];
                $a = $row['credit'] * 5;
                $gpac = $gpac + $a;

                $gradep = $gradep + 5;
            } else if ($row['grade'] == "B+") {
                $credit = $credit + $row['credit'];
                $a = $row['credit'] * 4;
                $gpac = $gpac + $a;

                $gradep = $gradep + 4;

            } else if ($row['grade'] == "B") {
                $credit = $credit + $row['credit'];
                $a = $row['credit'] * 3;
                $gpac = $gpac + $a;

                $gradep = $gradep + 3;

            } else if ($row['grade'] == "C") {
                $credit = $credit + $row['credit'];
                $a = $row['credit'] * 2;
                $gpac = $gpac + $a;

                $gradep = $gradep + 2;

            } else if ($row['grade'] == "D") {
                $credit = $credit + $row['credit'];
                $a = $row['credit'] * 1;
                $gpac = $gpac + $a;

                $gradep = $gradep + 1;

            } else if ($row['grade'] == "F") {
                $credit = $credit + $row['credit'];
                $a = $row['credit'] * 0;
                $gpac = $gpac + $a;

                $gradep = $gradep + 0;

            }

        }
    }
}
$gpac = intval($gpac);

$credit = intval($credit);

$gpa = $gpac / $credit;
$gpa = round($gpa, 1);
if ($gpa < 2.0) {
    $remarks = "discontinuous";
} else {
    $remarks = "progress";
}

?>




                                            <!---end-->
                                            <!--gpa-->
                                            <div class="table-responsive" style="font-size:12px;width:100%;">
                                                <table class="table" width="100%" cellspacing="0" style="width:100%;">
                                                    <tr>
                                                        <th>Total Credits:</th>
                                                        <td><?php echo $credit ?></td>
                                                    </tr>
                                                    <tr>
                                                        <th>Total Grade Points:</th>
                                                        <td><?php echo $gradep ?>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>GPA:</th>
                                                        <td><?php echo $gpa ?>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Remarks:</th>
                                                        <td><?php echo $remarks ?>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>



                                            <!--end-->
                                        </div>
                                    </div>
                                </div>
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
                                                    <th style="font-size:14px">course credit</th>
                                                    <th style="font-size:14px">Grade</th>
                                                    <th style="font-size:14px">Remarks</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
$counter = 1;

foreach ($courses as $cb) {
    $pf = 0;

    $cid = $cb . $_SESSION['coID'];
    $query = "SELECT * from
(SELECT courseID, score as scr, result.grade, regno, coID
FROM result
WHERE regno='" . $_SESSION["ID"] . "' AND coID='" . $cid . "') a

JOIN

(SELECT *
FROM coursework
WHERE regno='" . $_SESSION["ID"] . "' AND coID='" . $cid . "') b
JOIN
(SELECT *
FROM course
WHERE courseID='" . $cb . "') c
ON a.regno = b.regno and a.coID = b.coID and b.courseID=c.courseID";
    $result = mysqli_query($db, $query) or die(mysqli_error($db));

    if (mysqli_num_rows($result) > 0) {

        while ($row = mysqli_fetch_assoc($result)) {
            $row['stateView'] = "yes";
            if ($row['stateView'] == "yes") {
                if ($pub == 0) {
                    $pub = 1;

                }

                $sem = substr($row['courseID'], 5, 1);
                if ($sem == 1) {

                    if ($row['grade'] == "D" || $row['grade'] == "E" || $row['grade'] == "F") {

                        echo '<tr class="text-danger">';
                        $pf = 1;

                    } else {

                        echo '<tr>';

                    }
                    echo '<td style="font-size:14px" class="text-dark">' . $counter . '</td>';
                    echo '<td style="font-size:14px">' . $row['courseID'] . '</td>';
                    echo '<td style="font-size:14px">' . $row['cName'] . '</td>';
                    echo '<td style="font-size:14px">' . $row['credit'] . '</td>';

                    echo '<td style="font-size:14px ;">' . $row['grade'] . '</td>';
                    if ($pf == 0) {
                        echo '<td style="font-size:14px ;"> passed </td>';
                    } else {
                        echo '<td style="font-size:14px ;"> supplementary </td>';

                    }

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
                                                    <th style="font-size:14px">course credit</th>
                                                    <th style="font-size:14px">Grade</th>
                                                    <th style="font-size:14px">Remarks</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
$counter = 1;
$ifsem2 = 0;

foreach ($courses as $cb) {
    $pf = 0;

    $cid = $cb . $_SESSION['coID'];
    $query = "SELECT * from
(SELECT courseID, score as scr, result.grade, regno, coID
FROM result
WHERE regno='" . $_SESSION["ID"] . "' AND coID='" . $cid . "') a

JOIN

(SELECT *
FROM coursework
WHERE regno='" . $_SESSION["ID"] . "' AND coID='" . $cid . "') b
JOIN
(SELECT *
FROM course
WHERE courseID='" . $cb . "') c
ON a.regno = b.regno and a.coID = b.coID and b.courseID=c.courseID";
    $result = mysqli_query($db, $query) or die(mysqli_error($db));

    if (mysqli_num_rows($result) > 0) {

        while ($row = mysqli_fetch_assoc($result)) {
            $row['stateView'] = "yes";
            if ($row['stateView'] == "yes") {
                if ($pub == 0) {
                    $pub = 1;

                }

                $sem = substr($row['courseID'], 5, 1);
                if ($sem == 2) {
                    $ifsem2 = 1;

                    if ($row['grade'] == "D" || $row['grade'] == "E" || $row['grade'] == "F") {

                        echo '<tr class="text-danger">';
                        $pf = 1;

                    } else {

                        echo '<tr>';

                    }
                    echo '<td style="font-size:14px" class="text-dark">' . $counter . '</td>';
                    echo '<td style="font-size:14px">' . $row['courseID'] . '</td>';
                    echo '<td style="font-size:14px">' . $row['cName'] . '</td>';
                    echo '<td style="font-size:14px">' . $row['credit'] . '</td>';

                    echo '<td style="font-size:14px ;">' . $row['grade'] . '</td>';
                    if ($pf == 0) {
                        echo '<td style="font-size:14px ;"> passed </td>';
                    } else {
                        echo '<td style="font-size:14px ;"> supplementary </td>';

                    }

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
                                <p class="card-text text-dark font-italic font-weight-bold">Result for this
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
var gp = document.getElementById("gpa");
var sm = document.getElementById("sem2");

gp.style.display = "block";
sm.style.display = "block";
</script>
<?php
}
?>

</html>

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


<a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>