<div id='ajaxorg'>
    <div id="wait" style="display:none; justify-content: center;">
        <img src='../img/loadpage.gif'
            style="pointer-events: none; cursor: default; height: 280px; left: 50%; margin-top: -140px; margin-left: -140px; position: absolute; top: 50%; width: 280px;">
    </div>
    <script src='../alertcss/alert.js'></script>
    <script src='../alertcss/index.js'></script>
    <script src='../alertcss/notify.min.js'></script>

    <?php
include '../includes/connection.php';
include '../includes/sidebar.php';

$users = $_SESSION['users'];
$typid = $_SESSION['typid'];
$ID = $_SESSION['id'];
$name1 = $_SESSION['fname'];
$name2 = $_SESSION['lname'];
$emp = $_SESSION['ID'];
$imgContent = array();

if (isset($_POST['save'])) {
    $errorep = "";
    $fname = $_POST['firstname'];
    $mname = $_POST['middlename'];
    $lname = $_POST["lastname"];
    $email = $_POST['email'];
    $phoneno = $_POST['phonenumber'];
    $level = $_POST['level'];
    $gender = $_POST['gender'];
    $department = $_POST['deparment'];
    $department = $_POST['deparment'];
    $programID = $_POST['program'];
    $regno = $_POST['regno'];
    $d = strtotime($_POST['regddate']);
    $regDate = date("m/d/yy", $d);
    $year = date("yy", $d);
    $passwd = $lname;
    $statusName = "student";
    $lstate = "enabled";
    $state = "Approved";
    $name = $regno . ".png";
    $image = pathinfo($_FILES["image"]["name"], PATHINFO_EXTENSION);
    if ($image == "png") {
        $fileinfo = @getimagesize($_FILES["image"]["tmp_name"]);
        $width = $fileinfo[0];
        $height = $fileinfo[1];
        if ($width != "225" || $height != "225") {
            #not width or height limit
            $errorep = "incorret dimession of image";

        } else {
            #validated
            $image = $_FILES['image']['tmp_name'];
            $imgContent[$name] = addslashes(file_get_contents($image));

            //move_uploaded_file($_FILES['image']['tmp_name'], '../stdimg/' . $name);
            $file = $name;
            #validation of other detail
            $regno2 = substr($regno, 0, 9);

            if (strcmp($regno2, "KICTC-CER") == 0 || strcmp($regno2, "KICTC-DIP") == 0) {
                #valid
                if (strcmp($mname, "") == 0) {
                    #no middle name
                    $insert = "INSERT INTO student (regno,fname,lname,
            depertmentID,programID,year,level,email,file,gender,state,regDate,phoneno)values('" . $regno . "','" . $fname . "','" . $lname . "','" . $department . "','" . $programID . "','" . $year . "','" . $level .
                        "','" . $email . "','" . $imgContent[$name] . "','" . $gender . "','" . $state . "','" . $regDate .
                        "','" . $phoneno . "')";

                } else {
                    $insert = "INSERT INTO student (regno,fname,mname,lname,
            depertmentID,programID,year,level,email,file,gender,state,regDate,phoneno)values('" . $regno . "','" . $fname . "','" . $mname .
                        "','" . $lname . "','" . $department . "','" . $programID . "','" . $year . "','" . $level .
                        "','" . $email . "','" . $imgContent[$name] . "','" . $gender . "','" . $state . "','" . $regDate .
                        "','" . $phoneno . "')";
                }
                $loginis = "INSERT INTO login (email, password) values('" . $email . "','" . $passwd . "')";
                $statusis = "INSERT INTO status (statusName, email, lstate) values('" . $statusName . "','" . $email . "','" . $lstate . "')";
                $sql = "SELECT email FROM login where email='" . $email . "'";
                if ($result = mysqli_query($db, $sql)) {

                    if (mysqli_num_rows($result) > 0) {
                        #error exist
                        $errorep = "user already exit in database";

                    } else {
                        mysqli_autocommit($db, false);
                        #insertion

                        if (!mysqli_query($db, $loginis)) {
                            #error
                            $errorep = "error on student information";

                        }

                        if (!mysqli_query($db, $insert)) {
                            #error
                            $errorep = "error on student information";

                        }

                        if (!mysqli_query($db, $statusis)) {
                            #error
                            $errorep = "error on student information";

                        }
                        #check if error occured
                        if (strcmp($errorep, "") > 0) {

                            $db->rollback();

                        } else {
                            $db->commit();

                        }

                    }

                }

            } else {
                $errorep = "invalid registration number";

            }

        }

    } else {
        #not png
        $errorep = "uploaded image not png";

    }

    ?>
    <?php
if (strcmp($errorep, "") > 0) {
        ?>


    <!--failed-->
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
    var errorcat = "<?php echo $errorep ?>";
    Swal.fire({
        icon: 'error',
        title: 'STUDENT  NOT ADDED',
        text: errorcat,

        footer: '<a href="student.php">view student here!</a>'

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
    <?php } else {

        ?>




    <!--success-->
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
        title: 'STUDENT INFORMATION ADDED SUCCESSFULLY',
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
    <?php }
    ?>

    <?php

}
?>