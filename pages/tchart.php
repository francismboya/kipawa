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
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js">
    </script>
    <script type="text/javascript">
    google.charts.load('current', {
        packages: ['corechart']
    });
    </script>
</head>
<div id='an' style="display:block">
    <?php

//fail or pass
$cid = $decryption;

$sqln = "select * from(SELECT count(*)pass FROM `result` WHERE (grade='A' or grade='B+' or grade='B' or grade='C') and courseID='" . $decryption1 . "' and coID='" . $cid . "')a
join
(SELECT count(*)fail FROM `result` WHERE (grade='F' or grade='D'or grade='E') and courseID='" . $decryption1 . "' and coID='" . $cid . "') b";

$result = mysqli_query($db, $sqln);
$a = array();
$i = 0;
while (@$row = mysqli_fetch_assoc($result)) {
    $a[] = $row;

}

function convertDataToChartForm($data)
{
    $newData = array();

    $newData2 = array();
    $total = 0;
    $jb = 0;

    $firstLine = true;

    foreach ($data as $dataRow) {
        if ($jb == 0) {
            $newData2[] = array_values($dataRow);
            $newData[] = array("passmark", "status");

            foreach ($newData2 as $dataRow2) {
                foreach ($dataRow2 as $key2 => $value2) {
                    $total = $total + intval($value2);
                    $jb = 1;
                }

            }
        }
        foreach ($dataRow as $key => $value) {
            $value = (intval($value) / $total) * 100;

            $newData[] = array($key, $value);
        }
    }
    return $newData;
}

//A B C D
$sqlng = "select * from(SELECT count(*)A FROM `result` WHERE grade='A' and courseID='" . $decryption1 . "' and coID='" . $cid . "')a
join
(SELECT count(*)B_plus FROM `result` WHERE grade='B+' and courseID='" . $decryption1 . "' and coID='" . $cid . "') b
join
(SELECT count(*)B_plain FROM `result` WHERE grade='B' and courseID='" . $decryption1 . "' and coID='" . $cid . "') c
join
(SELECT count(*)C FROM `result` WHERE grade='C' and courseID='" . $decryption1 . "' and coID='" . $cid . "') d
join
(SELECT count(*)D FROM `result` WHERE grade='D' and courseID='" . $decryption1 . "' and coID='" . $cid . "') e
join
(SELECT count(*)F FROM `result` WHERE grade='F' and courseID='" . $decryption1 . "' and coID='" . $cid . "') f";
$resultg = mysqli_query($db, $sqlng);
$ag = array();

while (@$row = mysqli_fetch_assoc($resultg)) {
    $ag[] = $row;

}

function convertDataToChartForm2($data)
{
    $newData = array();

    $jb = 0;

    foreach ($data as $dataRow) {
        if ($jb == 0) {
            $newData[] = array("grade", "number of student");
            $jb = 1;

        }
        foreach ($dataRow as $key => $value) {
            $value = intval($value);

            $newData[] = array($key, $value);
        }
    }
    return $newData;
}

?>

    <div class="container-fluid">
        <div class="row">

            <!--start-->
            <div class="card col-sm-12 m-2">

                <div class="card-header d-flex justify-content-between align-items-center">
                    <h6 class="text-primary font-weight-bold m-0">percentage of Failed/passed student
                        <span class="text-danger font-weight-bold m-2">
                            <?php echo $decryption1 ?>
                        </span>
                    </h6>


                </div>
                <div class="card-body" id="pie"></div>

            </div>

            <!--end-->
            <!--start-->
            <div class="card col-sm-12 m-2">

                <div class="card-header d-flex justify-content-between align-items-center">
                    <h6 class="text-primary font-weight-bold m-0">GRADE DISTRIBUTION BAR GRAPH
                        <span class="text-danger font-weight-bold m-2">
                            <?php echo $decryption1 ?>
                        </span>
                    </h6>

                </div>

                <div class="card-body" id="bar"></div>

            </div>
            <!--end-->
            <!--start-->
            <div class="card col-sm-12 m-2">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h6 class="text-primary font-weight-bold m-0">RESULT DISTRIBUTION GRAPH
                        <span class="text-danger font-weight-bold m-2">
                            <?php echo $decryption1 ?>
                        </span>
                    </h6>

                </div>
                <div class="card-body" id="line"></div>

            </div>
            <!--end-->


        </div>
    </div>

    <?php
//include '../includes/footer.php';

?>


    <script language="JavaScript">
    //piechart
    function drawChart() {
        var data = google.visualization.arrayToDataTable((<?=json_encode(convertDataToChartForm($a));?>));
        var options = {
            'title': 'Ratio failed student vs passed student',
            backgroundColor: '#f1f8e9',

        };

        // Instantiate and draw the chart.
        var chart = new google.visualization.PieChart(document.getElementById('pie'));
        chart.draw(data, options);
    }
    google.charts.setOnLoadCallback(drawChart);
    window.onload = drawChart;
    window.onresize = drawChart;


    //bar chart
    function drawChart2() {
        var data = google.visualization.arrayToDataTable((<?=json_encode(convertDataToChartForm2($ag));?>));

        // Define the chart to be drawn.

        var options = {
            title: 'Bar graph showing grade',
            backgroundColor: '#f1f8e9'
        };

        // Instantiate and draw the chart.
        var chart = new google.visualization.BarChart(document.getElementById('bar'));
        chart.draw(data, options);
    }
    google.charts.setOnLoadCallback(drawChart2);
    window.onload = drawChart2;
    window.onresize = drawChart2;



    function drawChart3() {
        // Define the chart to be drawn.
        var data = google.visualization.arrayToDataTable((<?=json_encode(convertDataToChartForm2($ag));?>));

        // Set chart options
        var options = {
            'title': 'Score distribution',
            hAxis: {
                title: 'Grade'
            },
            vAxis: {

                title: 'number of student'
            },
            backgroundColor: '#f1f8e9'
        };

        // Instantiate and draw the chart.
        var chart = new google.visualization.LineChart(document.getElementById('line'));
        chart.draw(data, options);
    }
    google.charts.setOnLoadCallback(drawChart3);
    window.onload = drawChart3;
    window.onresize = drawChart3;
    </script>
</div>