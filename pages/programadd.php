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
    $programID = $_POST['programID'];
    $pName = $_POST['pName'];
    $durationINYear = $_POST['durationINYear'];
    $depertmentID = $_POST['depertmentID'];
    $level = $_POST['level'];

    $insert = "INSERT INTO program (programID, pName, durationINYear, depertmentID, level)values('" . $programID .
        "','" . $pName . "','" . $durationINYear . "','" . $depertmentID . "','" . $level . "')";
    $sql = "SELECT programID FROM program where programID='" . $programID . "'";
    if ($result = mysqli_query($db, $sql)) {

        if (mysqli_num_rows($result) > 0) {
            #error exist
            $errorep = "program already exit in database";

        } else {
            mysqli_autocommit($db, false);
            #insertion

            if (!mysqli_query($db, $insert)) {
                #error
                $errorep = "2.0 connection error";

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
        title: 'program  NOT ADDED',
        text: errorcat,

        footer: '<a href="program.php">view view program here!</a>'

    }).then((result) => {
        if (result.value) {
            $(document).ajaxStart(function() {
                $("#wait").css("display", "block");
                $("#loadertz").fadeOut(2);
            });
            $(document).ajaxComplete(function() {
                $("#wait").css("display", "none");
            });
            $('#ajaxorg').load('program.php');
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
        title: 'student INFORMATION ADDED SUCCESSFULLY',
        text: 'all information now are live!',
        footer: '<a href="program.php">view department!</a>'

    }).then((result) => {
        if (result.value) {
            $(document).ajaxStart(function() {
                $("#wait").css("display", "block");
                $("#loadertz2").fadeOut(2);
            });
            $(document).ajaxComplete(function() {
                $("#wait").css("display", "none");
            });

            $('#ajaxorg').load('program.php');
        }
    });
    </script>
    <?php }
    ?>

    <?php
}

?>