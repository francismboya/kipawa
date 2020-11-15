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
include '../includes/sidebar.php';

//$con = mysqli_connect('localhost', 'remote', '123456', 'kipawa');
$users = $_SESSION['users'];
$typid = $_SESSION['typid'];
$ID = $_SESSION['id'];
$name1 = $_SESSION['fname'];
$name2 = $_SESSION['lname'];
$emp = $_SESSION['ID'];
$response = array();
$errorf = array();
$imgContent = array();

$reason = array();
$bc = 0;
$errorfile = "../error/" . $emp . ".txt";
if (isset($_POST['import'])) {
// Count total files
    $countfiles = count($_FILES['filer']['name']);
    $filename2 = $_FILES["file"]["tmp_name"];
    $linecount = count(file($filename2));
    if ($countfiles == $linecount - 1) {

        // Looping all files
        for ($i = 0; $i < $countfiles; $i++) {
            $filename = $_FILES['filer']['name'][$i];
            $fileinfo = @getimagesize($_FILES["filer"]["tmp_name"][$i]);

            $width = $fileinfo[0];
            $height = $fileinfo[1];
            $regno2 = substr($filename, 0, 9);
            $rep = strcmp($regno2, "KICTC-DIP");

            if (strcmp($regno2, "KICTC-DIP") > 0 && strcmp($regno2, "KICTC-CER") > 0) {
                $response[$bc] = $filename;
                $errorf[$filename] = "invalid image name";

                $bc++;

            } else if (($_FILES["filer"]["size"][$i] > 1000000)) {
                $response[$bc] = $filename;
                $errorf[$filename] = "size exceed 1MB";

                $bc++;

            } else if ($width != "225" || $height != "225") {
                $response[$bc] = $filename;
                $errorf[$filename] = "image dimension expected 255px X 255px";

                $bc++;

            } else {
                echo $filename;

                $image = $_FILES['filer']['tmp_name'][$i];
                $imgContent[$filename] = addslashes(file_get_contents($image));
                // move_uploaded_file($_FILES['filer']['tmp_name'][$i], '../stdimg/' . $filename);
            }

        }

        if ($_FILES["file"]["size"] > 0) {
            $linecount = count(file($filename2));

            $file = fopen($filename2, "r");
            $row = 0;

            $regno = array();
            $fname = array();
            $mname = array();
            $lname = array();
            $depertmentID = array();
            $programID = array();
            $year = array();
            $level = array();
            $email = array();
            $file2 = array();
            $gender = array();
            $state = array();
            $regDate = array();
            $phoneno = array();
            $validity = 0;
            $statusName = "student";
            $lstate = "enabled";
            $state1 = "Approved";

            $i = 0;

            while (($col = fgetcsv($file, 10000, ",")) !== false and $row < $linecount) {
                $row++;
                if ($row == 1) {
                    continue;
                }
                echo $filerr = $col[0] . ".png";
                $d = strtotime($col[9]);
                $regDate = date("m/d/Y", $d);
                $yearr = date("Y", $d);
                $regno3 = substr($col[0], 0, 9);

                // $insert = "INSERT INTO student (regno,fname,mname,lname,
                //depertmentID,programID,year,level,email,file,gender,state,regDate,phoneno)
                //values('" . $col[0] . "','" . $col[1] . "','" . $col[2] .
                //     "','" . $col[3] . "','" . $col[4] . "','" . $col[5] . "','" . $yearr . "','" . $col[6] .
                //    "','" . $col[7] . "','" . $filerr . "','" . $col[8] . "','" . $state1 . "','" . $regDate .
                //    "','" . $col[10] . "')";

                $loginis = "INSERT INTO login (email, password) values('" . $col[7] . "','" . $col[3] . "')";
                $statusis = "INSERT INTO status (statusName, email, lstate)
                values('" . $statusName . "','" . $col[7] . "','" . $lstate . "')";
                $sql = "SELECT email FROM login where email='" . $col[7] . "'";

                if ($result = mysqli_query($db, $sql)) {

                } else {
                    $validity = 1;
                    $regno[$i] = $col[0];
                    $fname[$i] = $col[1];
                    $mname[$i] = $col[2];
                    $lname[$i] = $col[3];
                    $depertmentID[$i] = $col[4];
                    $programID[$i] = $col[5];
                    $year[$i] = $yearr;
                    $level[$i] = $col[6];
                    $email[$i] = $col[7];
                    $file2[$i] = $filerr;
                    $gender[$i] = $col[8];
                    $state[$i] = $state1;
                    $regDate[$i] = $regDate;
                    $phoneno[$i] = $col[10];
                    $reason[$i] = "connection error";
                    $i++;

                }

                mysqli_autocommit($db, false);
                if (array_key_exists($filerr, $errorf)) {
                    $validity = 1;
                    $regno[$i] = $col[0];
                    $fname[$i] = $col[1];
                    $mname[$i] = $col[2];
                    $lname[$i] = $col[3];
                    $depertmentID[$i] = $col[4];
                    $programID[$i] = $col[5];
                    $year[$i] = $yearr;
                    $level[$i] = $col[6];
                    $email[$i] = $col[7];
                    $file2[$i] = $filerr;
                    $gender[$i] = $col[8];
                    $state[$i] = $state1;
                    $regDate[$i] = $regDate;
                    $phoneno[$i] = $col[10];
                    $reason[$i] = $errorf[$filerr];
                    $i++;

                } else if (strcmp($regno3, "KICTC-CER") > 0 && strcmp($regno3, "KICTC-DIP") > 0) {
                    $validity = 1;
                    $regno[$i] = $col[0];
                    $fname[$i] = $col[1];
                    $mname[$i] = $col[2];
                    $lname[$i] = $col[3];
                    $depertmentID[$i] = $col[4];
                    $programID[$i] = $col[5];
                    $year[$i] = $yearr;
                    $level[$i] = $col[6];
                    $email[$i] = $col[7];
                    $file2[$i] = $filerr;
                    $gender[$i] = $col[8];
                    $state[$i] = $state1;
                    $regDate[$i] = $regDate;
                    $phoneno[$i] = $col[10];
                    $reason[$i] = "invalid registration number";
                    $i++;

                } else if (mysqli_num_rows($result) > 0) {

                    $validity = 1;
                    $regno[$i] = $col[0];
                    $fname[$i] = $col[1];
                    $mname[$i] = $col[2];
                    $lname[$i] = $col[3];
                    $depertmentID[$i] = $col[4];
                    $programID[$i] = $col[5];
                    $year[$i] = $yearr;
                    $level[$i] = $col[6];
                    $email[$i] = $col[7];
                    $file2[$i] = $filerr;
                    $gender[$i] = $col[8];
                    $state[$i] = $state1;
                    $regDate[$i] = $regDate;
                    $phoneno[$i] = $col[10];
                    $reason[$i] = "user exit in system";
                    $i++;

                } else if (!mysqli_query($db, $loginis)) {
                    $validity = 1;
                    $regno[$i] = $col[0];
                    $fname[$i] = $col[1];
                    $mname[$i] = $col[2];
                    $lname[$i] = $col[3];
                    $depertmentID[$i] = $col[4];
                    $programID[$i] = $col[5];
                    $year[$i] = $yearr;
                    $level[$i] = $col[6];
                    $email[$i] = $col[7];
                    $file2[$i] = $filerr;
                    $gender[$i] = $col[8];
                    $state[$i] = $state1;
                    $regDate[$i] = $regDate;
                    $phoneno[$i] = $col[10];
                    $reason[$i] = "error on CSV";
                    $i++;

                } else if (array_key_exists($filerr, $imgContent)) {
                    $img = $imgContent[$filerr];
                    $runner = "SET GLOBAL SESSION max_allowed_packet=1024*1024*1024";
                    mysqli_query($db, $runner);

                    $insert = "INSERT INTO student (regno,fname,mname,lname,
            depertmentID,programID,year,level,email,file,gender,state,regDate,phoneno)
            values('" . $col[0] . "','" . $col[1] . "','" . $col[2] .
                        "','" . $col[3] . "','" . $col[4] . "','" . $col[5] . "','" . $yearr . "','" . $col[6] .
                        "','" . $col[7] . "','" . $img . "','" . $col[8] . "','" . $state1 . "','" . $regDate .
                        "','" . $col[10] . "')";

                    if (!mysqli_query($db, $insert)) {
                        mysqli_query($db, $insert) or die(mysqli_error($db));
                        $validity = 1;
                        $regno[$i] = $col[0];
                        $fname[$i] = $col[1];
                        $mname[$i] = $col[2];
                        $lname[$i] = $col[3];
                        $depertmentID[$i] = $col[4];
                        $programID[$i] = $col[5];
                        $year[$i] = $yearr;
                        $level[$i] = $col[6];
                        $email[$i] = $col[7];
                        $file2[$i] = $filerr;
                        $gender[$i] = $col[8];
                        $state[$i] = $state1;
                        $regDate[$i] = $regDate;
                        $phoneno[$i] = $col[10];
                        $reason[$i] = "12error on CSV";
                        $i++;

                    } else if (!mysqli_query($db, $statusis)) {
                        $validity = 1;
                        $regno[$i] = $col[0];
                        $fname[$i] = $col[1];
                        $mname[$i] = $col[2];
                        $lname[$i] = $col[3];
                        $depertmentID[$i] = $col[4];
                        $programID[$i] = $col[5];
                        $year[$i] = $yearr;
                        $level[$i] = $col[6];
                        $email[$i] = $col[7];
                        $file2[$i] = $filerr;
                        $gender[$i] = $col[8];
                        $state[$i] = $state1;
                        $regDate[$i] = $regDate;
                        $phoneno[$i] = $col[10];
                        $reason[$i] = "error on CSV";
                        $i++;

                    }

                } else {
                    $validity = 1;
                    $regno[$i] = $col[0];
                    $fname[$i] = $col[1];
                    $mname[$i] = $col[2];
                    $lname[$i] = $col[3];
                    $depertmentID[$i] = $col[4];
                    $programID[$i] = $col[5];
                    $year[$i] = $yearr;
                    $level[$i] = $col[6];
                    $email[$i] = $col[7];
                    $file2[$i] = $filerr;
                    $gender[$i] = $col[8];
                    $state[$i] = $state1;
                    $regDate[$i] = $regDate;
                    $phoneno[$i] = $col[10];
                    $reason[$i] = "bad image file";
                    $i++;

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
                        $stadd = $stadd . '<td style="font-size:14px">' . $regno[$i] . '</td>';
                        $stadd = $stadd . '<td style="font-size:14px">' . $fname[$i] . '</td>';
                        $stadd = $stadd . '<td style="font-size:14px">' . $lname[$i] . '</td>';
                        $stadd = $stadd . '<td style="font-size:14px">' . $programID[$i] . '</td>';
                        $stadd = $stadd . '<td style="font-size:14px; color:red;">'
                            . $reason[$i] . '</td>';
                        $stadd = $stadd . '</tr> ';
                        $hinfo = "Dear," . " " . $name1 . " " . $name2 . "  the following Student info contain error:";
                        $fp = fopen($errorfile, "a") or exit("Unable to open file!");

                        file_put_contents($errorfile, '<div class="table-responsive" style="font-size:14px">' .
                            '<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">' .
                            ' <thead><p>' . $hinfo . '</p><tr> <th style="font-size:14px">SN</th><th style="font-size:14px">regno</th>
                            <th style="font-size:14px">fname</th>  <th style="font-size:14px">lname</th>
                            <th style="font-size:14px">programID</th>
                            <th style="font-size:14px">reason</th></tr></thead>
                            <tbody>' . ' ' . $stadd . "\n", FILE_APPEND);
                        fclose($fp);
                    } else {
                        $stadd = '<tr>';
                        $counter = $counter + 1;
                        $stadd = $stadd . '<td style="font-size:14px">' . $counter . '</td>';
                        $stadd = $stadd . '<td style="font-size:14px">' . $regno[$i] . '</td>';
                        $stadd = $stadd . '<td style="font-size:14px">' . $fname[$i] . '</td>';
                        $stadd = $stadd . '<td style="font-size:14px">' . $lname[$i] . '</td>';
                        $stadd = $stadd . '<td style="font-size:14px">' . $programID[$i] . '</td>';
                        $stadd = $stadd . '<td style="font-size:14px; color:red;">' . $reason[$i] . '</td>';
                        $stadd = $stadd . '</tr> ';

                        $fp = fopen($errorfile, "a") or exit("Unable to open file!");
                        file_put_contents($errorfile, $stadd . "\n", FILE_APPEND);

                    }
                }
                $stadd = '</tbody></table></div></div>';
                $fp = fopen($errorfile, "a") or exit("Unable to open file!");
                file_put_contents($errorfile, $stadd . "\n", FILE_APPEND);
                fclose($fp);
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

        footer: '<a href="error.php">view error here!</a>'

    }).then((result) => {
        if (result.value) {
            $(document).ajaxStart(function() {
                $("#wait").css("display", "block");
                $("#loadertz").fadeOut(2);
            });
            $(document).ajaxComplete(function() {
                $("#wait").css("display", "none");
            });
            $('#ajaxorg').load('error.php');
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
        title: 'INFORMATION UPDATED SUCCESSFULLY',
        text: 'all information now are live!',
        footer: '<a href="student.php">view student!</a>'

    }).then((result) => {
        if (result.value) {
            $(document).ajaxStart(function() {
                $("#wait").css("display", "block");
                $("#loadertz2").fadeOut(2);
            });
            $(document).ajaxComplete(function() {
                $("#wait").css("display", "none");
            });

            $('#ajaxorg').load('student.php');
        }
    });
    </script>
    <?php

            }

        }
    } else {?>
    <script>
    Swal.fire({
        icon: 'error',
        title: 'STUDENT INFO NOT UPDATED',
        text: 'Number of file missmatches with image file!',

        footer: '<a href="student.php.php">view student Info!</a>'

    }).then((result) => {
        if (result.value) {
            $(document).ajaxStart(function() {
                $("#wait").css("display", "block");
                $("#loadertz").fadeOut(2);
            });
            $(document).ajaxComplete(function() {
                $("#wait").css("display", "none");
            });
            $('#ajaxorg').load('student.php');
        }
    });
    </script>
    <?php
}
}
include '../includes/footer.php';

?>

</div>