<div id='ajaxorg'>
    <div id="wait" style="display:none; justify-content: center;">
        <img src='../img/loadpage.gif'
            style="pointer-events: none; cursor: default; height: 280px; left: 50%; margin-top: -140px; margin-left: -140px; position: absolute; top: 50%; width: 280px;">
    </div>
    <script src='../alertcss/alert.js'></script>
    <script src='../alertcss/index.js'></script>
    <script src='../alertcss/notify.min.js'></script>
    <!-- <script src='../js/ajax.js'></script>-->

    <head>
        <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link rel="stylesheet" href="../css/style.css">
        <link rel='stylesheet' href='../vendor/bootstrap/css/bootstrap.min.css'>
    </head>
    <?php
// connection of database
include '../includes/connection.php';
include '../includes/hsidebar.php';

//$con = mysqli_connect('localhost', 'remote', '123456', 'kipawa');
$users = $_SESSION['users'];
$typid = $_SESSION['typid'];
$ID = $_SESSION['id'];
$name1 = $_SESSION['fname'];
$name2 = $_SESSION['lname'];
$emp = $_SESSION['ID'];
$response = array();
$errorf = array();

$reason = array();
$bc = 0;
$errorfile = "../error/" . $emp . ".txt";
if (isset($_POST['import'])) {
// Count total files
    $filename2 = $_FILES["file"]["tmp_name"];
    $linecount = count(file($filename2));
    if ($_FILES["file"]["size"] > 0) {
        $linecount = count(file($filename2));

        $file = fopen($filename2, "r");
        $row = 0;

        $regno = array();
        $score = array();
        $remark = array();
        $coID = array();
        $courseID = array();
        $validity = 0;
        $i = 0;

        while (($col = fgetcsv($file, 10000, ",")) !== false and $row < $linecount) {
            if (strcmp($col[0], "") > 0) {
                $row++;
                if ($row == 1) {
                    continue;
                }
                $courseID1 = $_POST["courseID"];
                $regno3 = substr($col[0], 0, 9);
                $coID1 = $courseID1 . $_SESSION['coID'];
                $insert = "INSERT INTO coursework (courseID,score,remarks,regno,coID)
            values('" . $courseID1 . "','" . $col[1] . "','" . $col[2] .
                    "','" . $col[0] . "','" . $coID1 . "')";

                $loginis = "INSERT INTO studentviewco (stateView, coID) values('no', " . "'" . $coID1 . "')";
                $sql = "select student.regno from student join courseprogram on courseprogram.programID=student.programID AND courseprogram.level=student.level WHERE
                 courseprogram.courseID='" . $courseID1 . "' and student.regno='" . $col[0] . "'";

                $sql2 = "SELECT regno FROM student where regno='" . $col[0] . "'";
                $sql3 = "SELECT coID FROM studentviewco where coID='" . $coID1 . "'";

                if ($result = mysqli_query($db, $sql)) {

                } else {
                    $validity = 1;
                    $regno[$i] = $col[0];
                    $score[$i] = $col[1];
                    $remark[$i] = $col[2];
                    $coID[$i] = $coID1;
                    $courseID[$i] = $courseID1;
                    $reason[$i] = "connection error";
                    $i++;

                }

                if ($result2 = mysqli_query($db, $sql2)) {

                } else {
                    $validity = 1;
                    $regno[$i] = $col[0];
                    $score[$i] = $col[1];
                    $remark[$i] = $col[2];
                    $coID[$i] = $coID1;
                    $courseID[$i] = $courseID1;
                    $reason[$i] = "connection error";
                    $i++;

                }
                if ($result3 = mysqli_query($db, $sql3)) {

                } else {
                    $validity = 1;
                    $regno[$i] = $col[0];
                    $score[$i] = $col[1];
                    $remark[$i] = $col[2];
                    $coID[$i] = $coID1;
                    $courseID[$i] = $courseID1;
                    $reason[$i] = "connection error";
                    $i++;

                }

                mysqli_autocommit($db, false);
                if (strcmp($regno3, "KICTC-CER") > 0 && strcmp($regno3, "KICTC-DIP") > 0) {
                    $validity = 1;
                    $regno[$i] = $col[0];
                    $score[$i] = $col[1];
                    $remark[$i] = $col[2];
                    $coID[$i] = $coID1;
                    $courseID[$i] = $courseID1;
                    $reason[$i] = "invalid registration number";
                    $i++;

                } else if (mysqli_num_rows($result2) <= 0) {

                    $validity = 1;
                    $regno[$i] = $col[0];
                    $score[$i] = $col[1];
                    $remark[$i] = $col[2];
                    $coID[$i] = $coID1;
                    $courseID[$i] = $courseID1;

                    $reason[$i] = "student not found in a system";
                    $i++;

                } else if (mysqli_num_rows($result) <= 0) {
                    $validity = 1;
                    $regno[$i] = $col[0];
                    $score[$i] = $col[1];
                    $remark[$i] = $col[2];
                    $coID[$i] = $coID1;
                    $courseID[$i] = $courseID1;

                    $reason[$i] = "student not take this course";
                    $i++;

                } else if (!mysqli_query($db, $insert)) {
                    $validity = 1;

                    $regno[$i] = $col[0];
                    $score[$i] = $col[1];
                    $remark[$i] = $col[2];
                    $coID[$i] = $coID1;
                    $courseID[$i] = $courseID1;
                    $reason[$i] = "1.0 error on CSV";
                    $i++;

                } else if ((mysqli_num_rows($result3) <= 0)) {
                    if (!mysqli_query($db, $loginis)) {
                        $validity = 1;
                        $regno[$i] = $col[0];
                        $score[$i] = $col[1];
                        $remark[$i] = $col[2];
                        $coID[$i] = $coID1;
                        $courseID[$i] = $courseID1;
                        $reason[$i] = "1.1 error on CSV";
                        $i++;

                    }
                }
            }
        }

        if ($validity == 1) {
            $db->rollback();
            $ln = count($regno);
            $counter = 1;

            for ($i = 0; $i < $ln; $i++) {
                if ($i == 0) {
                    $fp = fopen($errorfile, "w") or exit("Unable to open file!");
                    fwrite($fp, '<div class="card-body">');
                    fclose($fp);
                    $stadd = '<tr>';
                    $stadd = $stadd . '<td style="font-size:14px">' . $counter . '</td>';
                    $stadd = $stadd . '<td style="font-size:14px">' . $courseID[$i] . '</td>';
                    $stadd = $stadd . '<td style="font-size:14px">' . $regno[$i] . '</td>';
                    $stadd = $stadd . '<td style="font-size:14px">' . $score[$i] . '</td>';
                    $stadd = $stadd . '<td style="font-size:14px">' . $remark[$i] . '</td>';
                    $stadd = $stadd . '<td style="font-size:14px; color:red;">'
                        . $reason[$i] . '</td>';
                    $stadd = $stadd . '</tr> ';
                    $hinfo = "Dear," . " " . $name1 . " " . $name2 . "  the following Student info contain error:";
                    $fp = fopen($errorfile, "a") or exit("Unable to open file!");

                    file_put_contents($errorfile, '<div class="table-responsive" style="font-size:14px">' .
                        '<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">' .
                        ' <thead><p>' . $hinfo . '</p><tr> <th style="font-size:14px">SN</th><th style="font-size:14px">Course ID</th>
                            <th style="font-size:14px">Reg No</th>  <th style="font-size:14px">Score</th>
                            <th style="font-size:14px">Remark</th>
                            <th style="font-size:14px">reason</th></tr></thead>
                            <tbody>' . ' ' . $stadd . "\n", FILE_APPEND);
                    fclose($fp);
                } else {
                    $stadd = '<tr>';
                    $counter = $counter + 1;
                    $stadd = $stadd . '<td style="font-size:14px">' . $counter . '</td>';
                    $stadd = $stadd . '<td style="font-size:14px">' . $courseID[$i] . '</td>';
                    $stadd = $stadd . '<td style="font-size:14px">' . $regno[$i] . '</td>';
                    $stadd = $stadd . '<td style="font-size:14px">' . $score[$i] . '</td>';
                    $stadd = $stadd . '<td style="font-size:14px">' . $remark[$i] . '</td>';
                    $stadd = $stadd . '<td style="font-size:14px; color:red;">' . $reason[$i] . '</td>';
                    $stadd = $stadd . '</tr> ';

                    $fp = fopen($errorfile, "a") or exit("Unable to open file!");
                    file_put_contents($errorfile, $stadd . "\n", FILE_APPEND);

                }
            }
            $stadd = '</tbody></table></div></div>';
            file_put_contents($errorfile, $stadd . "\n", FILE_APPEND);
            @fclose($fp);
            ?>
    <div class="shadow mb-4">
        <div class="card-body bg" id="loadertz">'
            <style>
            .bg {
                /* The image used */
                background-image: url("../img/back2.gif");

                /* Full height */
                height: 100%;

                /* Center and scale the image nicely */
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }
            </style>

        </div>
    </div>
    <script>
    Swal.fire({
        icon: 'error',
        title: 'STUDENT INFO NOT UPDATED',
        text: 'Some error detected on uploaded detail!',

        footer: '<a href="errort.php">view error here!</a>'

    }).then((result) => {
        if (result.value) {
            $(document).ajaxStart(function() {
                $("#wait").css("display", "block");
                $("#loadertz").fadeOut(2);
            });
            $(document).ajaxComplete(function() {
                $("#wait").css("display", "none");
            });
            $('#ajaxorg').load('errort.php');
        }
    });
    </script>
    <?php
} else {
            $db->commit();
            // echo json_encode(['status' => "success"]);
            ?>
    <div class="shadow mb-4" id="loadertz2">
        <div class="card-body bg">'
            <style>
            .bg {
                /* The image used */
                background-image: url("../img/back.gif");

                /* Full height */
                height: 100%;

                /* Center and scale the image nicely */
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }
            </style>

        </div>
    </div>
    <script>
    Swal.fire({
        icon: 'success',
        title: 'COURSEWORK RESULT UPLOADED SUCCESSFULLY',
        text: 'all information now are live!',
        footer: '<a href="coursework1.php">view student!</a>'

    }).then((result) => {
        if (result.value) {
            $(document).ajaxStart(function() {
                $("#wait").css("display", "block");
                $("#loadertz2").fadeOut(2);
            });
            $(document).ajaxComplete(function() {
                $("#wait").css("display", "none");
            });

            $('#ajaxorg').load('coursework1.php');
        }
    });
    </script>
    <?php

        }

    }

}
include '../includes/footer.php';

?>

</div>