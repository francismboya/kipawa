$query = 'UPDATE customer set FIRST_NAME ="' . $fname . '",
LAST_NAME ="' . $lname . '", PHONE_NUMBER="' . $phone . '" WHERE
CUST_ID ="' . $zz . '"';
$result = mysqli_query($db, $query) or die(mysqli_error($db));

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

if (isset($_POST['save'])) {
    $errorep = "";
    $fname = $_POST['firstname'];
    $mname = $_POST['middlename'];
    $lname = $_POST["lastname"];
    $phoneno = $_POST['phonenumber'];

    $gender = $_POST['gender'];
    $department = $_POST["jobs"];
    $employeeID = $_POST['employeeid'];
    $passwd = $lname;
    $statusName = $_POST["position"];
    $lstate = "enabled";
    $name = $employeeID . ".png";
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
            move_uploaded_file($_FILES['image']['tmp_name'], '../stfimg/' . $name);
            $file = $name;
            #validation of other detail
            $regno2 = substr($employeeID, 0, 9);

            if (strcmp($regno2, "KICTC-STA") == 0) {
                #valid
                if (strcmp($mname, "") == 0) {
                    #no middle name
                    echo $insert = "INSERT INTO employee (employeeID,fname,lname,email,
            file,gender, depertmentID, phoneno)values('" . $employeeID . "','" . $fname . "','" . $lname . "','" . $email . "','"
                        . $file . "','" . $gender . "','" . $department .
                        "','" . $phoneno . "')";

                } else {
                    echo $insert = "INSERT INTO employee (employeeID,fname, mname, lname,email,
            file,gender, depertmentID, phoneno)values('" . $employeeID . "','" . $fname . "','" . $mname . "','" . $lname . "','" . $email . "','"
                        . $file . "','" . $gender . "','" . $department .
                        "','" . $phoneno . "')";
                }
                $loginis = "INSERT INTO login (email, password) values('" . $email . "','" . $passwd . "')";
                $statusis = "INSERT INTO status (statusName, email, lstate) values('" . $statusName . "','" . $email . "','" . $lstate . "')";
                $sql = "SELECT email FROM login where email='" . $email . "'";
                $selrm = "SELECT employee.email FROM employee
                join login ON login.email=employee.email join
                status on status.email =login.email join department
                ON department.depertmentID=employee.depertmentID where
                status.statusName='hod' AND employee.depertmentID='" . $department . "'";
                $a = 0;
                $em = "";
                $seldl = "";

                if ($result = mysqli_query($db, $sql)) {

                    if (mysqli_num_rows($result) > 0) {
                        #error exist
                        $errorep = "user already exit in database";

                    } else {

                        if (strcmp($statusName, "hod") == 0) { #insertion
                        if ($result = mysqli_query($db, $selrm)) {
                            $a = 1;
                        } else {
                            $errorep = "connection error";
                        }
                            if ($a == 1) {
                                if (mysqli_num_rows($result) > 0) {
                                    $found_user = mysqli_fetch_array($result);
                                    $em = $found_user["email"];
                                    $seldl = "update status set statusName='teacher' where email='" . $em . "'";

                                    $a = 2;
                                } else {
                                    $a = 3;
                                }
                            }

                        }
                        mysqli_autocommit($db, false);

                        if ($a == 2) {
                            if (!mysqli_query($db, $seldl)) {
                                #error
                                $errorep = "2.1 connection error";

                            }

                        }

                        if (!mysqli_query($db, $loginis)) {
                            #error
                            $errorep = "2.2 error on user information";

                        }

                        if (!mysqli_query($db, $insert)) {
                            #error
                            $errorep = "2.3 error on user information";

                        }

                        if (!mysqli_query($db, $statusis)) {
                            #error
                            $errorep = "2.4 error on user information";

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
    var tn = "<?php echo $statusName ?>";
    Swal.fire({
        icon: 'error',
        title: tn + ' not added',
        text: errorcat,

        footer: '<a href="teacher.php">view teacher\'s here!</a>'

    }).then((result) => {
        if (result.value) {
            $(document).ajaxStart(function() {
                $("#wait").css("display", "block");
                $("#loadertz").fadeOut(2);
            });
            $(document).ajaxComplete(function() {
                $("#wait").css("display", "none");
            });
            $('#ajaxorg').load('teacher.php');
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
        title: 'USER INFORMATION ADDED SUCCESSFULLY',
        text: 'all information now are live!',
        footer: '<a href="teacher.php">view teacher\'s!</a>'

    }).then((result) => {
        if (result.value) {
            $(document).ajaxStart(function() {
                $("#wait").css("display", "block");
                $("#loadertz2").fadeOut(2);
            });
            $(document).ajaxComplete(function() {
                $("#wait").css("display", "none");
            });

            $('#ajaxorg').load('teacher.php');
        }
    });
    </script>
    <?php }
    ?>

    <?php

}
?>