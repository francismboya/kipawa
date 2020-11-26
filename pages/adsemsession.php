<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Dashboard - Brand</title>
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap4/js/bootstrap.min.js"></script>
    <link href="../vendor/bootstrap4/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="../assets/fonts/fontawesome-all.min.css">
    <script src="../chart/dist/Chart.bundle.js"></script>
    <style type="text/css">
    .container1 {
        width: 50%;
        margin: 15px auto;
    }

    .msg_cotainer {
        margin-top: auto;
        margin-bottom: auto;
        margin-left: 10px;
        border-radius: 25px;
        background-color: blue;
        position: relative;
        font-weight: bolder;
        margin-left: 35%;
        margin-right: 25%;
        color: white;
    }
    </style>
</head>

<body id="page-top">
    <?php
include '../includes/connection.php';
include '../includes/psidebar.php';
$error = "";
$setting = 0;
if (isset($_POST["add"])) {
    $setting = 1;
    $_POST['sem1'] = strtotime($_POST['sem1']);
    $dy = date("Y", $_POST['sem1']);
    $_POST['sem2'] = strtotime($_POST['sem2']);
    $dy2 = date("Y", $_POST['sem2']);
    $dy3 = $dy . "/" . $dy2;
    $sestateID = "progress";
    $_POST['sem11'] = strtotime($_POST['sem11']);
    $_POST['sem11'] = date("m/d/Y", $_POST['sem11']);

    $_POST['sem12'] = strtotime($_POST['sem12']);
    $_POST['sem12'] = date("m/d/Y", $_POST['sem12']);

    $_POST['sem21'] = strtotime($_POST['sem21']);
    $_POST['sem21'] = date("m/d/Y", $_POST['sem21']);

    $_POST['sem22'] = strtotime($_POST['sem22']);
    $_POST['sem22'] = date("m/d/Y", $_POST['sem22']);
    $dh = intval($dy2) - intval($dy);
    $sqlr = " INSERT INTO semisterstate(seID, sestateID, sem1st, sem1end, sem2st,
    sem2end, sem1state, sem2state)
      VALUES ('" . $dy3 . "','" . $sestateID . "','" . $_POST['sem11'] . "','" . $_POST['sem12'] . "','
    " . $_POST['sem21'] . "','" . $_POST['sem22'] . "','" . $sestateID . "','" . $sestateID . "')";

    $checkexit = "SELECT seID FROM `semisterstate` where seID='" . $dy3 . "'";
    $returnexit = mysqli_query($db, $checkexit);

    if ($dh != 1) {
        $error = "Invalid period for Academic session";
    } else if (strtotime($_POST['sem11']) > strtotime($_POST['sem12'])) {
        $error = "Semister1 ending date must not be small than starting date";
    } else if (strtotime($_POST['sem21']) > strtotime($_POST['sem22'])) {
        $error = "Semister 2 ending date must not be small than starting date";

    } else if (mysqli_num_rows($returnexit) > 0) {
        $error = "academic year already started";

    } else if (!mysqli_query($db, $sqlr)) {
        $error = "connection error";

    }

}

?>
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-xl-12 col-sm-12">
                        <div class="card shadow mb-4">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <div class="msg_cotainer">
                                    <label for="viewer2" class="badge-pill badge-primary m-2">START NEW ACADEMIC
                                        SESSION</label>
                                    <input type="button" class="btn btn-primary hid" name="bot" id="viewer2"
                                        style="margin-right:40px; margin-top:0px; margin-bottom:20px; background-color:#9e9e9e;"
                                        value="OFF" onclick="expert2(this) " hidden>

                                </div>
                            </div>
                            <div class="card-body">
                                <?php

?>
                                <!--hidden-->
                                <div class="container">
                                    <div class="panel-body">
                                        <div class="panel-group" id="accordion">
                                            <!--add sem-->
                                            <div id="togglef" style="display:none;">
                                                <form role="form" method="post" action="adsemsession.php?action=add"
                                                    class="form-horizontal" enctype="multipart/form-data">
                                                    <div class="row m-2 justify-content-center">
                                                        <p class="btn text-primary">
                                                            ACADEMIC SESSION DURATION
                                                        </p>
                                                    </div>
                                                    <div class="row m-2 justify-content-center">
                                                        <div class="form-group col-sm-4">
                                                            <input placeholder="Starting Year" type="text"
                                                                onfocus="(this.type='month')"
                                                                onblur="(this.type='text')" id="FromDate" name="sem1"
                                                                class="form-control" required />
                                                        </div>
                                                        <div class="form-group col-sm-4">
                                                            <input placeholder="Ending Year" type="text"
                                                                onfocus="(this.type='month')"
                                                                onblur="(this.type='text')" id="FromDate1" name="sem2"
                                                                class="form-control" required />
                                                        </div>


                                                    </div>

                                                    <div class="row m-2 justify-content-center">
                                                        <p class="text-primary">
                                                            SEMESTER 1 DURATION
                                                        </p>
                                                    </div>
                                                    <div class="row m-2 justify-content-center">
                                                        <div class="form-group col-sm-4">
                                                            <input placeholder="Starting Date" type="text"
                                                                onfocus="(this.type='date')" onblur="(this.type='text')"
                                                                id="FromDate1" name="sem11" class="form-control"
                                                                required />
                                                        </div>
                                                        <div class="form-group col-sm-4">
                                                            <input placeholder="Ending Date" type="text"
                                                                onfocus="(this.type='date')" onblur="(this.type='text')"
                                                                id="FromDate1" name="sem12" class="form-control"
                                                                required />
                                                        </div>


                                                    </div>

                                                    <div class="row m-2 justify-content-center">
                                                        <p class="text-primary">
                                                            SEMESTER 2 DURATION
                                                        </p>
                                                    </div>
                                                    <div class="row m-2 justify-content-center">
                                                        <div class="form-group col-sm-4">
                                                            <input placeholder="Starting Date" type="text"
                                                                onfocus="(this.type='date')" onblur="(this.type='text')"
                                                                id="FromDate" name="sem21" class="form-control"
                                                                required />
                                                        </div>
                                                        <div class="form-group col-sm-4">
                                                            <input placeholder="Ending Date" type="text"
                                                                onfocus="(this.type='date')" onblur="(this.type='text')"
                                                                id="FromDate1" name="sem22" class="form-control"
                                                                required />
                                                        </div>


                                                    </div>


                                                    <hr>
                                                    <div class="row m-2 justify-content-center">
                                                        <button type="submit" class="btn btn-success m-2" name="add"><i
                                                                class="fa fa-check fa-fw"></i>Save</button>
                                                        <button type="reset" class="btn btn-danger m-2"
                                                            onclick="clear()"><i
                                                                class="fa fa-times fa-fw"></i>Reset</button>
                                                    </div>
                                                </form>
                                            </div>
                                            <!--/add sem-->
                                            <!--SEM-->
                                            <style>
                                            .emptytz {
                                                display: none;
                                            }
                                            </style>
                                            <div id="prog" class="row">
                                                <?php
$a = 1;
$search = "SELECT DISTINCT * FROM `semisterstate` ORDER BY seID DESC";
$returned = mysqli_query($db, $search);
if (mysqli_num_rows($returned) > 0) {
    while ($oursem = mysqli_fetch_assoc($returned)) {

        ?>
                                                <div class="col-sm-4 col-md-4">

                                                    <div class="card" style="width:100%">

                                                        <div class="card-body">

                                                            <h4 class="card-title btn btn-primary rounded-pill"
                                                                style="font-size:14px; background-color:white; color:black;">
                                                                ACADEMIC SESSION <?php echo $oursem['seID'] ?>
                                                            </h4>


                                                            <div>
                                                                <button class="btn text-primary"
                                                                    style="font-size:14px">SEMESTER <span
                                                                        class="badge badge-primary">1</span>
                                                                </button>
                                                            </div>

                                                            <div>
                                                                <p style="margin-left: 10%;">
                                                                    semister status: <span
                                                                        class="text text-success"><?php echo $oursem['sem1state'] ?>
                                                                    </span>

                                                                </p>
                                                            </div>
                                                            <div class="row">
                                                                <div>
                                                                    <p style="margin-left: 30%;">
                                                                        started: <span class="text text-danger"
                                                                            style="font-size:14px">
                                                                            <?php echo $oursem['sem1st'] ?>
                                                                        </span>

                                                                    </p>
                                                                </div>
                                                                <div>
                                                                    <p style="margin-left: 30%;">
                                                                        ending <span class="text text-danger"
                                                                            style="font-size:14px">
                                                                            <?php echo $oursem['sem1end'] ?>
                                                                        </span>

                                                                    </p>
                                                                </div>
                                                            </div>
                                                            <div class="row" style="margin-left: 10%;">
                                                                <button type="submit" name="analytical"
                                                                    class="btn btn-info badge-pill m-2"> <i
                                                                        class="fa fa-edit" aria-hidden="true"></i>EDIT
                                                                </button>

                                                                <button type="submit" name="viewee"
                                                                    class="btn btn-warning badge-pill m-2"><i
                                                                        class="fa fa-stop-circle"
                                                                        aria-hidden="true"></i>STOP</button>



                                                            </div>

                                                            <div>
                                                                <button class="btn text-primary" style="font-size:14px">
                                                                    SEMISTER
                                                                    <span class="badge badge-primary">2</span></button>
                                                            </div>
                                                            <div>
                                                                <p style="margin-left: 10%;">
                                                                    semister status: <span
                                                                        class="text text-success"><?php echo $oursem['sem1state'] ?>
                                                                    </span>

                                                                </p>
                                                            </div>
                                                            <div class="row">
                                                                <div>
                                                                    <p style="margin-left: 30%;">
                                                                        started: <span class="text text-danger"
                                                                            style="font-size:14px"><?php echo $oursem['sem2st'] ?>
                                                                        </span>

                                                                    </p>
                                                                </div>
                                                                <div>
                                                                    <p style="margin-left: 10%;">
                                                                        ending <span class="text text-danger"
                                                                            style="font-size:14px"><?php echo $oursem['sem2end'] ?>
                                                                        </span>

                                                                    </p>
                                                                </div>
                                                            </div>
                                                            <div class="row" style="margin-left: 10%;">
                                                                <button type="submit" name="analytical"
                                                                    class="btn btn-info badge-pill m-2"> <i
                                                                        class="fa fa-edit" aria-hidden="true"></i>EDIT
                                                                </button>

                                                                <button type="submit" name="viewee"
                                                                    class="btn btn-warning badge-pill m-2"><i
                                                                        class="fa fa-stop-circle"
                                                                        aria-hidden="true"></i>STOP</button>



                                                            </div>

                                                        </div>
                                                        <div class="row col-sm-12">
                                                            <hr class="col-sm-12"
                                                                style="margin-left:0%; border-width: 2px; margin-top:1%; margin-bottom:2%;" />
                                                        </div>
                                                        <div class="row justify-content-center">
                                                            <button class="card-title btn btn-danger rounded-pill">
                                                                <i class="fa fa-trash" aria-hidden="true"></i>
                                                                Dismiss
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <?php
$a++;
    }
} else {
    ?>
                                                <div class="col-sm-12 col-md-12">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            Academic Session Detail
                                                        </div>
                                                        <div class="card-body bg-gradient-warning">
                                                            <h4 class="card-title">Dear user</h4>
                                                            <p class="card-text text-dark font-italic font-weight-bold">
                                                                No academic
                                                                session started
                                                                yet
                                                            </p>

                                                        </div>
                                                    </div>

                                                </div>
                                                <?php

}
?>
                                            </div>
                                            <!--/SEM-->



                                        </div>
                                    </div>
                                </div>
                                <!--/hidden-->

                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
</body>
<?php
include "../includes/footer2.php";
?>

<script>
// Access the array elements
function expert2(bot) {
    // var cols = document.getElementsByClassName('hid');
    // for (i = 0; i < cols.length; i++) {
    //  cols[i].style.display = 'none';
    // }
    var col = document.getElementById("hid");
    if (bot.value == "OFF") {
        bot.value = "ON";
        bot.className = "btn btn-primary";
        jc = document.getElementById("togglef");
        jc.style.display = "block";
        bot.style.background = "#007bff";
        jc3 = document.getElementById("prog");
        jc3.className = "emptytz";
    } else if (bot.value = "ON") {
        bot.value = "OFF";
        jc = document.getElementById("togglef");
        jcb = document.getElementById("prog");
        jc.style.display = "none";
        //jcb.style.display = "initial";
        jcb.className = "row";
        bot.style.background = "#9e9e9e";
    }
}
</script>



<?php

if (strcmp($error, "") > 0 && $setting == 1) {
    ?>
<script>
var errorcat = "<?php echo $error ?>";
Swal.fire({
    icon: 'error',
    title: 'Academic Session Not Added',
    text: errorcat,

});
</script>
<?php } else if ($setting == 1) {

    ?>

<script>
Swal.fire({
    icon: 'success',
    title: 'Academic Session Added Successfully',
    text: 'academic session now is Live!',
});
</script>
<?php }
?>

</html>