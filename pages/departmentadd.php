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
    $did = $_POST['partmentid'];
    $dname = $_POST['departmentname'];

    $insert = "INSERT INTO department (depertmentID,dName)values('" . $did .
        "','" . $dname . "')";
    $sql = "SELECT depertmentID FROM department where depertmentID='" . $did . "'";
    if ($result = mysqli_query($db, $sql)) {

        if (mysqli_num_rows($result) > 0) {
            #error exist
            $errorep = "deparment already exit in database";

        } else {
            mysqli_autocommit($db, false);
            #insertion

            if (!mysqli_query($db, $insert)) {
                #error
                $errorep = "2.0 connrction error";

            }
            #check if error occured
            if (strcmp($errorep, "") > 0) {

                $db->rollback();

            } else {
                $db->commit();

            }

        }
    } else {
        $errorep = "2.1 connrction error";

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
        title: 'department  NOT ADDED',
        text: errorcat,

        footer: '<a href="department.php">view department here!</a>'

    }).then((result) => {
        if (result.value) {
            $(document).ajaxStart(function() {
                $("#wait").css("display", "block");
                $("#loadertz").fadeOut(2);
            });
            $(document).ajaxComplete(function() {
                $("#wait").css("display", "none");
            });
            $('#ajaxorg').load('department.php');
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
        title: 'department INFORMATION ADDED SUCCESSFULLY',
        text: 'all information now are live!',
        footer: '<a href="department.php">view department!</a>'

    }).then((result) => {
        if (result.value) {
            $(document).ajaxStart(function() {
                $("#wait").css("display", "block");
                $("#loadertz2").fadeOut(2);
            });
            $(document).ajaxComplete(function() {
                $("#wait").css("display", "none");
            });

            $('#ajaxorg').load('department.php');
        }
    });
    </script>
    <?php }
    ?>

    <?php
}

?>