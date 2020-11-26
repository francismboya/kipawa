<head>
    <meta name="viewport" content="width=device-width, initial-scale=0.6 user-scalable=no">

    <style type="text/css">
    #overlay {
        position: fixed;
        display: none;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: rgba(0, 0, 0, 0.5);
        z-index: 2;
        cursor: pointer;
    }

    #text {
        position: absolute;
        top: 50%;
        left: 50%;
        font-size: 50px;
        color: white;
        transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
    }
    </style>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=0.6 user-scalable=no">

    <title>SRM</title>
    <link rel="icon" href="../img/favicon.png" type="image/png" sizes="16x16">

    <!-- Custom fonts for this template-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>
<?php
include '../includes/connection.php';
//require 'session.php';
include '../includes/sidebar.php';
if (isset($_GET['year'])) {
    $_SESSION['coID'] = $_GET['year'];
}

?>
<div class="row" style="right:0;top:0; margin-left:80%">
    <button class="badge btn btn-warning" style="margin-top:0px; margin-bottom:20px;">Hide Result Panel</button>
    <input type="button" class="btn btn-primary hid" name="bot" id="viewer2"
        style="margin-right:40px; margin-top:0px; margin-bottom:20px; background-color:#9e9e9e;" value="OFF"
        onclick="expert2(this)">
</div>

<div class="row" id="rpnl">

    <div class="col-lg-12">
        <div class="card  mb-0">
            <div class="card-header py-2">
                <h4 class="m-1 text-lg text-primary">Result Panel</h4>
            </div>
            <!-- /.panel-heading -->
            <div class="card-body">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs">
                    <?php $sqldep = "SELECT DISTINCT depertmentID, dName
FROM department where depertmentID !='MNG'order by depertmentID asc";
$resultdep = mysqli_query($db, $sqldep) or die("Bad SQL: $sqldep");
$dep = "";
while ($row = mysqli_fetch_assoc($resultdep)) {

    $dep .= '<li class="nav-item">
                        <a class="nav-link" href="' . '#' . $row['depertmentID'] . '" data-toggle="tab">' . $row['depertmentID'] . '</a>
                    </li>';

}
echo $dep;
$path = '../img/logo21.png';
$type = pathinfo($path, PATHINFO_EXTENSION);
$data = file_get_contents($path);
$base64 = 'data:image/' . $type . ';base64,' . base64_encode($data);

?>

                </ul>


                <?php include 'resultsele.php';
$hrefid = array();
$hrefid[1] = "'#dataTable'";
?>


                <div style="clear:both"></div>
                <br />
                <div class="card  mb-4 col-md-12" style="display:none" id="poor">
                    <div class="card-header py-3 bg-white">
                        <h4 class="m-2 font-weight-bold text-primary">RESULTS

                            <span>
                                <button type="button" class="btn btn-success m-2" data-toggle="modal"
                                    data-target="#posMODAL">ACCEPT</button>
                                <button type="button" class="btn btn-danger m-2" data-toggle="modal"
                                    data-target="#posMODAL">DENY</button>


                                <button class="btn btn-rounded btn-sm btn-warning m-2" style="height:50px">ADVANCED
                                    VIEW
                                    <input type="button" class="btn btn-danger btn-sm" name="bot" id="viewer"
                                        value="OFF" style="background-color:#9e9e9e; height:35px"
                                        onclick="expert(this)"></button>




                            </span>
                        </h4>
                    </div>

                    <div class="row" id='hdtable'>
                        <div class="card-body col-md-12">
                            <div class="table-responsive" style="font-size:14px">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Student name</th>
                                            <th>registration number</th>
                                            <th>course credit</th>
                                            <th>coursework</th>
                                            <th>result</th>
                                            <th>grade</th>
                                            <th>overal result</th>
                                            <th>status</th>
                                        </tr>
                                    </thead>
                                    <?php
$crdo = 0;
$on = 0;
if (isset($_POST['viewee'])) {
    if (isset($_POST['courseID']) && !empty($_POST['courseID'])) {
        $on = 1;
        $query = "SELECT * from (SELECT courseID, score as scr,
result.grade, regno, coID FROM result WHERE courseID='" . $_POST['courseID'] . "'
AND coID='" . $_POST['coID'] . "') a
 JOIN (SELECT * FROM coursework WHERE courseID='" . $_POST['courseID'] . "'
AND coID='" . $_POST['coID'] . "') b
 JOIN (SELECT fname, mname, lname, courseprogram.courseID, student.regno FROM student join courseprogram
 on courseprogram.programID=student.programID AND courseprogram.level=student.level where
 courseprogram.courseID='" . $_POST['courseID'] . "')c
 ON a.regno = b.regno and a.coID = b.coID and b.courseID=c.courseID and b.regno=c.regno";
        $result = mysqli_query($db, $query) or die(mysqli_error($db));
        $crd = "select * from course where courseID='" . $_POST['courseID'] . "' ";
        $rel = mysqli_query($db, $crd) or die(mysqli_error($db));
        if (mysqli_num_rows($rel) > 0) {
            while ($row2 = mysqli_fetch_assoc($rel)) {
                $crdo = $row2['credit'];

            }
        }
        ?>
                                    <tbody>
                                        <?php
if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                ?>

                                        <tr>
                                            <td>
                                                <?php echo $row['fname'] . " " . $row['mname'] . " " . $row['lname']
                ?>
                                            </td>

                                            <td>
                                                <?php echo $row['regno']; ?>

                                            </td>

                                            <td>
                                                <?php echo $crdo; ?>

                                            </td>

                                            <td>
                                                <?php echo $row['score']; ?>

                                            </td>
                                            <td>
                                                <?php
if ($row['scr'] == "inc") {echo $row['scr'];
                } else {
                    echo $row['scr'] - $row['score'];
                }
                ?>

                                            </td>
                                            <td>
                                                <?php echo $row['grade']; ?>

                                            </td>

                                            <?php
echo '<td align="center">
         <a type="button" class="btn btn-success bg-gradient-success" href="manageedit.php?action=edit & id='
                    . $row['courseID'] . '"><i class="far fa-eye" style="margin-right:5px;"></i>view</a>
                </td>';

                ?>


                                            <td>

                                                <?php
if (strcmp($row['grade'], "F") == 0 || strcmp($row['grade'], "D") == 0) {
                    echo "FAIL";

                } else {
                    echo "PASS";

                }
                ?>


                                            </td>


                                        </tr>
                                        <?php }
            ?>

                                        <?php

        }
        ?>


                                        <?php
}

}

?>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>


                </div>

                <?php

if (isset($_POST['analytical'])) {
    if (isset($_POST['courseID']) && !empty($_POST['courseID'])) {
        $on = 3;
        ?>

                <?php
include 'adchart.php';
        ?>
                <?php
}
}

include '../includes/footer.php';

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
                        jc = document.getElementById("rpnl");
                        jc.style.display = "block";
                        bot.style.background = "#007bff";
                        jc3 = document.getElementById("poor");
                        jc3.style.display = "none";
                    } else if (bot.value = "ON") {
                        bot.value = "OFF";
                        jc = document.getElementById("rpnl");
                        jcb = document.getElementById("an");
                        jc.style.display = "none";
                        jcb.style.display = "none";
                        bot.style.background = "#9e9e9e";
                    }
                }
                </script>
                <?php if ($on == 1) {?>
                <script>
                bot2 = document.getElementById("viewer2");
                bot2.value = "OFF";
                jc2 = document.getElementById("rpnl");
                jc3 = document.getElementById("poor");
                jc3.style.display = "block";
                jc2.style.display = "none";
                bot2.style.background = "#9e9e9e";
                </script>
                <?php } else if ($on == 3) {
    ?>
                <script>
                bot2 = document.getElementById("viewer2");
                bot2.value = "OFF";
                jc2 = document.getElementById("rpnl");
                jc3 = document.getElementById("hdtable");
                jcb2 = document.getElementById("an");
                jc3.style.display = "none";
                jcb2.style.display = "block";
                jc2.style.display = "none";
                bot2.style.background = "#9e9e9e";
                </script>
                <?php
} else {
    ?>
                <script>
                bot3 = document.getElementById("viewer2");
                expert2(bot3)
                </script>
                <?php
}
?>

                <script src="../vendor/assets/bootstrap/js/bootstrap.min.js"></script>
                <script>
                function expert(bot) {

                    var col = document.getElementById("hid");
                    if (bot.value == "OFF") {
                        bot.className = "btn btn-primary";
                        $(document).ready(function() {
                            var a =
                                '<h2 style="text-align:center;color:black;padding-top:90px;">Registered Student Kipawa ICT<h2>';
                            var b = '<div class="hero-image"';
                            var c = "style ='background-image: url";
                            var d =
                                '("https: //1.bp.blogspot.com/-vTxIJk9Q82I/X5lOz-6fAzI/AAAAAAAAN94/ECwlZ55kYHUhcaHRh0fPIvo4s9v2tVITACLcBGAsYHQ/s517/logo3.png");';
                            var f =
                                "padding-top:5%; padding-bottom:5%; background-repeat: no-repeat; background-size: cover;'>";
                            var g = '</div>';
                            var ba = "<?php echo $base64; ?>";
                            var ids = <?php echo json_encode($hrefid); ?>;
                            var vl = "<?php echo $_POST['courseID']; ?>";

                            $.each(ids, function(index, value) {
                                var value2 =
                                    '<h2 style="text-align:center;color:black;padding-top:90px;">Course Result ' +
                                    vl + '</h2>';
                                var ad = b + c + d + f + value2 + g;
                                var table = $(eval(value)).DataTable({
                                    "bDestroy": true,
                                    "dom": '<"dt-buttons"Bf><"clear">lirtp',
                                    "searching": true,
                                    "paging": true,
                                    "autoWidth": true,
                                    lengthMenu: [
                                        [10, 25, 50, 100, 200, -1],
                                        [10, 25, 50, 100, 200, "All"]
                                    ],


                                    buttons: [{
                                            extend: 'print',
                                            title: '',
                                            text: 'print',
                                            messageTop: ad,
                                            className: 'btn btn-primary',
                                            exportOptions: {
                                                columns: ':visible'
                                            },

                                            customize: function(win) {

                                                $(win.document.body)
                                                    .css('font-size', '10pt')
                                                    .prepend(
                                                        '<img src="https://1.bp.blogspot.com/-vTxIJk9Q82I/X5lOz-6fAzI/AAAAAAAAN94/ECwlZ55kYHUhcaHRh0fPIvo4s9v2tVITACLcBGAsYHQ/s517/logo3.png"  style="pointer-events: none; cursor: default; height: 180px; left: 50%; margin-top: -90px; margin-left: -90px; padding-bottom:5%; position: absolute; top: 7%;  opacity: 1; width: 180px;" />',
                                                    );

                                                $(win.document.body).find('table')
                                                    .addClass('compact')
                                                    .css('font-size', 'inherit');



                                            }

                                        },

                                        {
                                            extend: 'colvis',
                                            text: 'Column visibility',
                                            className: 'btn btn-primary',
                                            collectionLayout: 'fixed two-column'


                                        }
                                    ]
                                });
                            });

                        });
                        bot.value = "ON";
                        bot.style.background = "#007bff";
                    } else if (bot.value = "ON") {
                        bot.value = "OFF";
                        bot.style.background = "#9e9e9e";
                        var ids = <?php echo json_encode($hrefid); ?>;
                        // Display the array elements
                        $.each(ids, function(index, value) {

                            var table = $(eval(value)).DataTable({
                                "bDestroy": true,
                                "searching": false,
                                "paging": false,
                                "autoWidth": true,

                            });
                        });
                    }
                }
                </script>