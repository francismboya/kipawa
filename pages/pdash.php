<!DOCType html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>KICTC| Principal</title>
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
?>
<div class="row">
    <div class="col-lg-12 col-xl-12 col-sm-12">
        <div class="card shadow mb-4">

            <div class="card-body">

                <div class="d-flex flex-column" id="content-wrapper">
                    <div id="content">

                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-7 col-xl-6">
                                    <div class="card shadow mb-4">
                                        <div class="card-header d-flex justify-content-between align-items-center">
                                            <h6 class="text-primary font-weight-bold m-0">Student in Each department</h6>

                                        </div>
                                        <div class="card-body">
                                            <?php
                                            $counter=0;
                                            $dipid=array();
                                            $i=0;
                                            $db = mysqli_connect("localhost", "remote", "123456", "kipawa");
                                            $bulan = mysqli_query($db, "SELECT *  FROM department where depertmentID!='MNG'  order by depertmentID asc");
                                            $bulan1 = mysqli_query($db, "SELECT *  FROM department  where depertmentID!='MNG' order by depertmentID asc");

                                            ?>
                                            <div class="container">
                                                <canvas id="myChart1" width="100" height="100"></canvas>
                                            </div>
                                            <script>
                                                var ctx = document.getElementById("myChart1");
                                                var myChart = new Chart(ctx, {
                                                    type: 'bar',
                                                    data: {
                                                        labels: [<?php
                                                            while ($row = mysqli_fetch_assoc($bulan)) {
                                                                echo  '"'.$row['depertmentID'].'", ';}?>
                                                        ],
                                                        datasets: [{
                                                            label: '# of Students',
                                                            data: [<?php
                                                                $array=array();
                                                                $f="Select count(depertmentID) as total3 from department";
                                                                $dipid=array();
                                                                while ($row = mysqli_fetch_assoc($bulan1)) {
                                                                    $dipid[$counter]=$row['depertmentID'];
                                                                    $counter++;
                                                                }
                                                                $len=$counter;
                                                                for ($i=0; $i<$len; $i++) {
                                                                    $ans="select count(*) as total  from student group by depertmentID";
                                                                    $std= mysqli_query($db, $ans);
                                                                    while ($row = mysqli_fetch_assoc($std)) {
                                                                        echo $row["total"].', ';
                                                                    }// end of whle
                                                                }// end of for
                                                                ?>],
                                                            backgroundColor: [
                                                                'rgba(255, 99, 132, 0.2)',
                                                                'rgba(54, 162, 235, 0.2)',
                                                                'rgba(255, 206, 86, 0.2)',
                                                                'rgba(75, 192, 192, 0.2)',
                                                                'rgba(153, 102, 255, 0.2)',
                                                                'rgba(255, 159, 64, 0.2)',
                                                                'rgba(255, 99, 132, 0.2)',
                                                                'rgba(54, 162, 235, 0.2)',
                                                                'rgba(255, 206, 86, 0.2)',
                                                                'rgba(75, 192, 192, 0.2)',
                                                                'rgba(153, 102, 255, 0.2)',
                                                                'rgba(255, 159, 64, 0.2)'
                                                            ],
                                                            borderColor: [
                                                                'rgba(255,99,132,1)',
                                                                'rgba(54, 162, 235, 1)',
                                                                'rgba(255, 206, 86, 1)',
                                                                'rgba(75, 192, 192, 1)',
                                                                'rgba(153, 102, 255, 1)',
                                                                'rgba(255, 159, 64, 1)',
                                                                'rgba(255, 99, 132, 0.2)',
                                                                'rgba(54, 162, 235, 0.2)',
                                                                'rgba(255, 206, 86, 0.2)',
                                                                'rgba(75, 192, 192, 0.2)',
                                                                'rgba(153, 102, 255, 0.2)',
                                                                'rgba(255, 159, 64, 0.2)'
                                                            ],
                                                            borderWidth: 1
                                                        }]
                                                    },
                                                    options: {
                                                        scales: {
                                                            yAxes: [{
                                                                ticks: {
                                                                    beginAtZero: true
                                                                }
                                                            }]
                                                        }
                                                    }
                                                } );
                                            </script>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-5 col-xl-6" style="height: 1%">
                                    <div class="card shadow mb-4">
                                        <div class="card-header d-flex justify-content-between align-items-center">
                                            <h6 class="text-primary font-weight-bold m-0">Employee in Each Department</h6>

                                        </div>
                                        <div class="card-body">
                                            <div class="chart-area" style="height: 10%">
                                                <?php
                                                $counter=0;
                                                $dipid=array();
                                                $i=0;
                                                $db = mysqli_connect("localhost", "remote", "123456", "kipawa");
                                                $bulan = mysqli_query($db, "SELECT *  FROM department where depertmentID!='MNG'  order by depertmentID asc");
                                                $bulan1 = mysqli_query($db, "SELECT *  FROM department  where depertmentID!='MNG' order by depertmentID asc");

                                                ?>

                                                <div class="container">
                                                    <canvas id="myChart" width="100" height="100"></canvas>
                                                </div>
                                                <script>
                                                    var ctx = document.getElementById("myChart");
                                                    var myChart = new Chart(ctx, {
                                                        type: 'bar',
                                                        data: {
                                                            labels: [<?php
                                                                while ($row = mysqli_fetch_assoc($bulan)) {
                                                                    echo  '"'.$row['depertmentID'].'", ';}?>
                                                            ],
                                                            datasets: [{
                                                                label: '# of Employee',
                                                                data: [<?php
                                                                    $array=array();
                                                                    $f="Select count(depertmentID) as total3 from department";
                                                                    $dipid=array();
                                                                    while ($row = mysqli_fetch_assoc($bulan1)) {
                                                                        $dipid[$counter]=$row['depertmentID'];
                                                                        $counter++;
                                                                    }
                                                                    $len=$counter;
                                                                    for ($i=0; $i<$len; $i++) {
                                                                        $ans="select count(*) as total  from employee join status on status.email=employee.email where status.statusName='teacher' or status.statusName='hod' group by depertmentID";
                                                                        $std= mysqli_query($db, $ans);
                                                                        while ($row = mysqli_fetch_assoc($std)) {
                                                                            echo $row["total"].', ';
                                                                        }// end of whle
                                                                    }// end of for
                                                                    ?>],
                                                                backgroundColor: [
                                                                    'rgba(255, 99, 132, 0.2)',
                                                                    'rgba(54, 162, 235, 0.2)',
                                                                    'rgba(255, 206, 86, 0.2)',
                                                                    'rgba(75, 192, 192, 0.2)',
                                                                    'rgba(153, 102, 255, 0.2)',
                                                                    'rgba(255, 159, 64, 0.2)',
                                                                    'rgba(255, 99, 132, 0.2)',
                                                                    'rgba(54, 162, 235, 0.2)',
                                                                    'rgba(255, 206, 86, 0.2)',
                                                                    'rgba(75, 192, 192, 0.2)',
                                                                    'rgba(153, 102, 255, 0.2)',
                                                                    'rgba(255, 159, 64, 0.2)'
                                                                ],
                                                                borderColor: [
                                                                    'rgba(255,99,132,1)',
                                                                    'rgba(54, 162, 235, 1)',
                                                                    'rgba(255, 206, 86, 1)',
                                                                    'rgba(75, 192, 192, 1)',
                                                                    'rgba(153, 102, 255, 1)',
                                                                    'rgba(255, 159, 64, 1)',
                                                                    'rgba(255, 99, 132, 0.2)',
                                                                    'rgba(54, 162, 235, 0.2)',
                                                                    'rgba(255, 206, 86, 0.2)',
                                                                    'rgba(75, 192, 192, 0.2)',
                                                                    'rgba(153, 102, 255, 0.2)',
                                                                    'rgba(255, 159, 64, 0.2)'
                                                                ],
                                                                borderWidth: 1
                                                            }]
                                                        },
                                                        options: {
                                                            scales: {
                                                                yAxes: [{
                                                                    ticks: {
                                                                        beginAtZero: true
                                                                    }
                                                                }]
                                                            }
                                                        }
                                                    } );
                                                </script>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>


</div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a></div>
<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/bootstrap/js/bootstrap.min.js"></script>
<script src="../assets/js/chart.min.js"></script>
<script src="../assets/js/bs-init.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
<script src="../assets/js/theme.js"></script>
</body>
<?php include ('../includes/footer.php');?>
</html>