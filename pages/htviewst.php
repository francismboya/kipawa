<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <link rel="stylesheet" href="../vendor/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../vendor/stde/assets/css/tablearrow.css">
    <link rel="stylesheet" href="../vendor/stde/assets/css/styles.css">
    <!--<link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">-->
    <link rel="stylesheet" href="../assets/css/styles.css">
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <link rel="stylesheet" href="../css/style.css">
    <link rel='stylesheet' href='../vendor/bootstrap/css/bootstrap.min.css'>
</head>

<body>
    <?php
include '../includes/connection.php';
include '../includes/hsidebar.php';
$users = $_SESSION['users'];
$typid = $_SESSION['typid'];
$ID = $_SESSION['id'];
$emp = $_SESSION['ID'];
$data = ''; // env data
$query = "SELECT u." . $ID . ", t.statusName
                          FROM " . $users . " u
                          JOIN status t ON t.email=u.email WHERE u.email = '" . $_SESSION['email'] . "'";
$result = mysqli_query($db, $query) or die(mysqli_error($db));

while ($row = mysqli_fetch_assoc($result)) {
    $Aa = $row['statusName'];

    if ($Aa == 'User') {
        ?>
    <script type="text/javascript">
    //then it will be redirected
    alert("Restricted Page! You will be redirected to POS");
    window.location = "pos.php";
    </script>
    <?php
}
}
$sql = "SELECT regno, fname, mname, lname, depertmentid,
year, level, email, gender, state, regdate, programID, phoneno FROM student";
$result = mysqli_query($db, $sql) or die("Bad SQL: $sql");
?>
    <?php
$sqldip = "SELECT DISTINCT depertmentID, dName FROM department order by depertmentID asc";
$result = mysqli_query($db, $sqldip) or die("Bad SQL: $sqldip");

$dip = "<select class='form-control' name='deparment' required>
        <option value='' disabled selected hidden>Select Department</option>";
while ($row = mysqli_fetch_assoc($result)) {
    $dip .= "<option value='" . $row['depertmentID'] . "'>" . $row['dName'] . "</option>";
}
$dip .= "</select>";

$sqlpro = "SELECT DISTINCT programID, pName
FROM program order by programID asc";
$result = mysqli_query($db, $sqlpro) or die("Bad SQL: $sqlpro");

$pro = "<select class='form-control col-sm-12' name='program' required>
        <option value='' disabled selected hidden>Select Program</option>";
while ($row = mysqli_fetch_assoc($result)) {
    $pro .= "<option value='" . $row['programID'] . "'>" . $row['pName'] . "</option>";
}

$pro .= "</select>";
?>

    <div class="card shadow mb-" 6>
        <?php
$query = "select student.regno,student.fname,student.lname, student.programID, courseprogram.level,program.programID,program.pName,course.courseID,course.employeeID,course.cName,course.depertmentID,course.level  from student join courseprogram on courseprogram.programID=student.programID join course on course.courseID=courseprogram.courseID join program on program.programID=student.programID where course.employeeID='" . $emp . "' and student.level= courseprogram.level";
$result = mysqli_query($db, $query) or die(mysqli_error($db));
$k = 0;
$j = 0;
$counter = 0;
$courseID = array();
$regno = array();
$fname = array();
$lname = array();
$programID = array();
$level = array();
$pName = array();
$employeeID = array();
$cName = array();
$depertmentID = array();
$href = array();
while ($row = mysqli_fetch_assoc($result)) {
    $regno[$counter] = $row['regno'];
    if (!in_array($row['courseID'], $courseID)) {
        $courseID[count($courseID)] = $row['courseID'];
        # code...
    }
    $counter++;
}
$len = count($courseID);
?>
        <div class="col-md-12">
            <div class="div class=" col-md-12 mb-12">
                <div class="table-responsive" style="font-size:14px">
                    <div class="container py-5">
                        <div class="p-5 bg-white rounded shadow mb-5">
                            <!-- Bordered tabs-->
                            <ul id="myTab1" role="tablist"
                                class="nav nav-tabs nav-pills with-arrow flex-column flex-sm-row text-center">
                                <?php

for ($i = 0; $i < $len; $i++) {
    while ($j < $len) {
        if ($j == 0) {
            $upl = '<li class="nav-item flex-sm-fill">
        <a id="home1-tab" data-toggle="tab" href=';
            $href[$j] = '"#' . $courseID[$j] . '"';
            $dwl = 'role="tab" aria-controls="home1" aria-selected="true" class="nav-link text-uppercase font-weight-bold mr-sm-3 rounded-0 border active">';
            $course = $courseID[$j] . '</a>';
            $record = $upl . $href[$j] . $dwl . $course;
            echo $record;
        } else {
            $upl = '<li class="nav-item flex-sm-fill">
        <a id="home1-tab" data-toggle="tab" href=';
            $href[$j] = '"#' . $courseID[$j] . '"';
            $dwl = 'role="tab" aria-controls="profile1" aria-selected="false" class="nav-link text-uppercase font-weight-bold mr-sm-3 rounded-0 border">';
            $course = $courseID[$j] . '</a>';
            $record = $upl . $href[$j] . $dwl . $course;
            echo $record;
        }
        $j++;

    }
    if ($k == 0) {
        echo "</ul>";
        $k++;
    }
    if ($i == 0) {
        $headt = '<div id="myTab1Content" class="tab-content">';
        $hrefd = '<div id="' . substr($href[$i], 2);
        $tbody1 = 'role="tabpanel" aria-labelledby="home-tab" class="tab-pane fade px-4 py-5 show active">
       <table class="table">
            <thead>
                <tr><h4> Student enrolled in course' . ' ' . $courseID[$i] . '</h4></tr>   <tr>
                        <th style="font-size:14px">Reg no</th>
                        <th style="font-size:14px">Name</th>
                        <th style="font-size:14px">Department</th>
                        <th style="font-size:14px">Program</th>
                        <th style="font-size:14px">NTA Level</th>
                    </tr>
                </thead>
                <tbody>';
        $sql3 = "select student.regno,student.fname,student.lname, student.programID, student.depertmentID,courseprogram.level  from student join courseprogram on courseprogram.programID=student.programID AND courseprogram.level=student.level WHERE courseprogram.courseID='" . $courseID[$i] . "'";
        $result21 = mysqli_query($db, $sql3) or die(mysqli_error($db));
        $counter = 0;
        $regno = array();

        while ($row = mysqli_fetch_assoc($result21)) {
            $regno[$counter] = $row['regno'];
            $fname[$counter] = $row['fname'];
            $lname[$counter] = $row['lname'];
            $programID[$counter] = $row['programID'];
            $level[$counter] = $row['level'];
            $depertmentID[$counter] = $row['depertmentID'];
            $counter++;

        }
        $reg2 = count($regno);

        for ($r = 0; $r < $reg2; $r++) {
            $data = $data . '<tr><td>' . $regno[$r] . '</td>' .
                '<td style="font-size:14px">' . $fname[$r] . ' ' . $lname[$r] . '</td>' .
                '<td style="font-size:14px">' . $depertmentID[$r] . '</td>' .
                '<td style="font-size:14px">' . $programID[$r] . '</td>' .
                '<td style="font-size:14px">' . $level[$r] . '</td> </tr>';
        }
        $close = "
                </tbody>
        </table>
      </div>";
        $divend = "</div>";
        $edata = $headt . $hrefd . $tbody1 . $data . $close;
        echo $edata;
        $data = '';
    } else {

        $hrefd = '<div id="' . substr($href[$i], 2);
        $tbody1 = 'role="tabpanel" aria-labelledby="home-tab" class="tab-pane fade px-4 py-5">
       <table class="table">
            <thead>
                <tr><h4> Student enrolled in course' . ' ' . $courseID[$i] . '</h4></tr>   <tr>
                        <th style="font-size:14px">Reg no</th>
                        <th style="font-size:14px">Name</th>
                        <th style="font-size:14px">Department</th>
                        <th style="font-size:14px">Program</th>
                        <th style="font-size:14px">NTA Level</th>
                    </tr>
                </thead>
                <tbody>';
        $sql3 = "select student.regno,student.fname,student.lname, student.programID, student.depertmentID,courseprogram.level  from student join courseprogram on courseprogram.programID=student.programID AND courseprogram.level=student.level WHERE courseprogram.courseID='" . $courseID[$i] . "'";
        $result21 = mysqli_query($db, $sql3) or die(mysqli_error($db));
        $counter = 0;
        $regno = array();

        while ($row = mysqli_fetch_assoc($result21)) {
            $regno[$counter] = $row['regno'];
            $fname[$counter] = $row['fname'];
            $lname[$counter] = $row['lname'];
            $programID[$counter] = $row['programID'];
            $level[$counter] = $row['level'];
            $depertmentID[$counter] = $row['depertmentID'];
            $counter++;

        }
        $reg = count($regno);

        for ($r = 0; $r < $reg; $r++) {
            $data = $data . '<tr><td>' . $regno[$r] . '</td>' .
                '<td style="font-size:14px">' . $fname[$r] . ' ' . $lname[$r] . '</td>' .
                '<td style="font-size:14px">' . $depertmentID[$r] . '</td>' .
                '<td style="font-size:14px">' . $programID[$r] . '</td>' .
                '<td style="font-size:14px">' . $level[$r] . '</td> </tr>';
        }
        $close = "
                </tbody>
        </table>
      </div>";
        $edata = $hrefd . $tbody1 . $data . $close;
        echo $edata;
        $data = '';
    }
    if ($i == $len - 1) {
        echo $divend;
    }

    ?>
                                <?php }
?>
                                <!-- End bordered tabs -->
                        </div>
                    </div>
                    <?php
include '../includes/footer.php';
?>

                    <script src="../vendor/assets/bootstrap/js/bootstrap.min.js"></script>
                    <script src="../vendor/stde/assets/js/jquery.min.js"></script>
                    <!-- Customer Modal-->