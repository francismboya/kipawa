<?php?>
<!DOCType html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <link rel="stylesheet" href="../vendor/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../vendor/stde/assets/css/tablearrow.css">
    <link rel="stylesheet" href="../vendor/stde/assets/css/styles.css">
    <!--<link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">-->
    <link rel="stylesheet" href="../assets/css/styles.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel='stylesheet' href='../vendor/bootstrap/css/bootstrap.min.css'>
    <title>Semister Info</title>
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/Animated-Type-Heading.js"></script>
    <link rel="icon" href="../img/logo2.png" type="image/png" sizes="16x16">
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="../assets/fonts/fontawesome-all.min.css">
    <script src="../charts/dist/Chart.bundle.js"></script>
        <style type="text/css">
            .container1 {
                width: 50%;
                margin: 15px auto;
            }
    </style>
</head>

<body id="page-top">
<?php
include '../includes/connection.php';
include '../includes/psidebar.php';
$name1 = $_SESSION['fname'];
$name2 = $_SESSION['lname'];
$users = $_SESSION['users'];
$typid = $_SESSION['typid'];
$ID = $_SESSION['id'];
$emp = $_SESSION['ID'];
$data = '';
?>
<div class="row">
<div class="col-lg-12 col-xl-12 col-sm-12">
    <div class="card shadow mb-4">
        <div class="card-header d-flex justify-content-between align-items-center">
            <h6 class="text-primary font-weight-bold m-0">The following are the list of Semesters at VETA Kipawa</h6>

        </div>
        <div class="card-body">

            <div class="d-flex flex-column" id="content-wrapper">
                <div id="content">
                    <?php
                    $count="select count(distinct year) from semisterstate";
                    $fetch="select DISTINCT seid,year from semisterstate ";
                    $result=mysqli_query($db,$fetch) or die (mysqli_error($db));
                    $j=0;
                    $k=0;
                    $counter=0;
                    $seid=array();
                    $year=array();
                    while($row=mysqli_fetch_assoc($result)){
                        $year[$counter]=$row['year'];
                        if(!in_array($row['year'],$year)){
                            $year[count($year)]=$row['year'];
                        }
                        $counter++;
                    }
                    $len=count($year);
                    ?>
                    <div class="col-md-12">
                        <div class="div class=" col-md-12 mb-12">
                        <div class="table-responsive" style="font-size:14px">
                            <div class="container py-2">
                                <div class="p-5 bg-white rounded mb-5">
                                    <!-- Bordered tabs-->
                                    <ul id="myTab1" role="tablist"
                                        class="nav nav-tabs nav-pills with-arrow flex-column flex-sm-row text-center">
                                        <?php

                                        for ($i = 0; $i < $len; $i++) {
                                            while ($j < $len) {
                                                if ($j == 0) {
                                                    $upl = '<li class="nav-item flex-sm-fill">
 <a id="home1-tab" data-toggle="tab" href=';
                                                    $href[$j] = '"#' . $seid[$j] . '"';
                                                    $hrt[$j] = $seid[$j];
                                                    $dwl = 'role="tab" aria-controls="home1" aria-selected="true" class="nav-link text-uppercase font-weight-bold mr-sm-3 rounded-0 border active">';
                                                    $sem = $seid[$j] . '</a>';
                                                    $record = $upl . $href[$j] . $dwl . $sem;
                                                    echo $record;
                                                } else {
                                                    $upl = '<li class="nav-item flex-sm-fill">
        <a id="home1-tab" data-toggle="tab" href=';
                                                    $href[$j] = '"#' . $seid[$j] . '"';
                                                    $hrt[$j] = $seid[$j];
                                                    $dwl = 'role="tab" aria-controls="profile1" aria-selected="false" class="nav-link text-uppercase font-weight-bold mr-sm-3 rounded-0 border">';
                                                    $sem = $seid[$j] . '</a>';
                                                    $record = $upl . $href[$j] . $dwl . $sem;
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
                                                $hrefid[$i] = '"#j' . substr($href[$i], 2);
                                                $hrefd = '<div id="' . substr($href[$i], 2);
                                                $tbody1 = 'role="tabpanel" aria-labelledby="home-tab" class="tab-pane fade px-4 py-2 show active">
        <div class="table-responsive" style="font-size:14px">
        <table class="table table-bordered" id="' . 'j' . $hrt[$i] . '" width="100%" cellspacing="0">
            <thead>
                <tr><h4> ' . ' ' . $seid[$i] . '</h4>
              </tr>   <tr>
                        <th style="font-size:14px">Semester</th>
                        <th style="font-size:14px">Year</th>
                    </tr>
                </thead>
                <tbody>';
                                                $sql3 = "select seid, year from semisterstate join courseprogram  WHERE year='" . $year[$i] . "'";
                                                $result21 = mysqli_query($db, $sql3) or die(mysqli_error($db));
                                                $counter = 0;
                                                $year = array();

                                                while ($row = mysqli_fetch_assoc($result21)) {
                                                    $year[$counter] = $row['year'];
                                                    $seid[$counter] = $row['seid'];
                                                    $counter++;

                                                }
                                                $reg2 = count($year);

                                                for ($r = 0; $r < $reg2; $r++) {
                                                    $data = $data . '<tr><td>'  .
                                                        '<td style="font-size:14px">' . $seid[$r] . '</td>' .
                                                        '<td style="font-size:14px">' . $year[$r] . '</td>' ;
                                                }
                                                $close = "
                </tbody>
        </table>
      </div>
      </div>";
                                                $divend = "</div>";
                                                $edata = $headt . $hrefd . $tbody1 . $data . $close;
                                                echo $edata;
                                                $data = '';
                                            } else {
                                                $hrefid[$i] = '"#j' . substr($href[$i], 2);

                                                $hrefd = '<div id="' . substr($href[$i], 2);
                                                $tbody1 = 'role="tabpanel" aria-labelledby="home-tab" class="tab-pane fade px-4 py-1">
        <div class="table-responsive" style="font-size:14px">
        <table class="table table-bordered" id="' . 'j' . $hrt[$i] . '" width="100%" cellspacing="0">
            <thead>
                <tr><h4> Student enrolled in course' . ' ' . $courseID[$i] . '</h4>
                </tr>   <tr>
                        <th style="font-size:14px">Semester</th>
                        <th style="font-size:14px">Year</th>
                    </tr>
                </thead>
                <tbody>';
                                                $sql3 = "select seid, year from semisterstate join courseprogram  WHERE year='" . $year[$i] . "'";
                                                $result21 = mysqli_query($db, $sql3) or die(mysqli_error($db));
                                                $counter = 0;
                                                $year = array();

                                                while ($row = mysqli_fetch_assoc($result21)) {
                                                    $seid[$counter] = $row['seid'];
                                                    $year[$counter] = $row['year'];
                                                    $counter++;

                                                }
                                                $reg = count($year);

                                                for ($r = 0; $r < $reg; $r++) {
                                                    $data = $data . '<tr><td>' . $seid[$r] . '</td>' .
                                                        '<td style="font-size:14px">' . $year[$r] . '</td>';
                                                }
                                                $close = "
                </tbody>
        </table>
      </div>
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
                            <script>
                                // Access the array elements
                                function expert(bot) {
                                    // var cols = document.getElementsByClassName('hid');
                                    // for (i = 0; i < cols.length; i++) {
                                    //  cols[i].style.display = 'none';
                                    // }
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
                                            // Display the array elements
                                            $.each(ids, function(index, value) {
                                                var value2 =
                                                    '<h2 style="text-align:center;color:black;padding-top:90px;">Student enrolled in course ' +
                                                    value.substring(3, 11) + '</h2>';
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


                        </div>
            </div>
            </div>
        </div>
    </div>
</div>