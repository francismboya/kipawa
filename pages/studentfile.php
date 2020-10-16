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
            if (($_FILES["filer"]["size"][$i] > 1000000)) {
                $response[$bc] = $filename;
                $bc++;

            } else if ($width != "225" || $height != "225") {
                $response[$bc] = $filename;
                $bc++;

            } else {

                move_uploaded_file($_FILES['filer']['tmp_name'][$i], '../stdimg/' . $filename);

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

            $i = 0;

            while (($col = fgetcsv($file, 10000, ",")) !== false and $row < $linecount) {
                $row++;
                if ($row == 1) {
                    continue;
                }
                $insert = "INSERT INTO student (regno,fname,mname,lname,
            depertmentID,programID,year,level,email,file,gender,state,regDate,phoneno)values('" . $col[2] . "','" . $col[3] . "','" . $col[4] .
                    "','" . $col[5] . "','" . $col[6] . "','" . $col[7] . "','" . $col[8] . "','" . $col[9] .
                    "','" . $col[10] . "','" . $col[11] . "','" . $col[12] . "','" . $col[13] . "','" . $col[14] .
                    "','" . $col[15] . "')";

                mysqli_autocommit($db, false);
                if (in_array($col[11], $response)) {
                    $validity = 1;
                    $regno[$i] = $col[2];
                    $fname[$i] = $col[3];
                    $mname[$i] = $col[4];
                    $lname[$i] = $col[5];
                    $depertmentID[$i] = $col[6];
                    $programID[$i] = $col[7];
                    $year[$i] = $col[8];
                    $level[$i] = $col[9];
                    $email[$i] = $col[10];
                    $file2[$i] = $col[11];
                    $gender[$i] = $col[12];
                    $state[$i] = $col[13];
                    $regDate[$i] = $col[14];
                    $phoneno[$i] = $col[15];
                    $reason[$i] = "error on image";
                    $i++;

                } else if (!mysqli_query($db, $insert)) {
                    $validity = 1;
                    $regno[$i] = $col[2];
                    $fname[$i] = $col[3];
                    $mname[$i] = $col[4];
                    $lname[$i] = $col[5];
                    $depertmentID[$i] = $col[6];
                    $programID[$i] = $col[7];
                    $year[$i] = $col[8];
                    $level[$i] = $col[9];
                    $email[$i] = $col[10];
                    $file2[$i] = $col[11];
                    $gender[$i] = $col[12];
                    $state[$i] = $col[13];
                    $regDate[$i] = $col[14];
                    $phoneno[$i] = $col[15];
                    $reason[$i] = "error on csv file info";

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
                echo json_encode(['status' => "success"]);
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
    } else {

    }
}
include '../includes/footer.php';

?>

</div>