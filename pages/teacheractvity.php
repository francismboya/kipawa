<head>
    <meta name="viewport" content="width=device-width, initial-scale=0.6 user-scalable=no">
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/Animated-Type-Heading.js"></script>
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
include '../includes/tsidebar.php';
?><?php
$users = $_SESSION['users'];
$typid = $_SESSION['typid'];
$ID = $_SESSION['id'];
$name1 = $_SESSION['fname'];
$name2 = $_SESSION['lname'];
$query = "SELECT u." . $ID . ", t.statusName
                          FROM " . $users . " u
                          JOIN status t ON t.email=u.email WHERE u.email = '" . $_SESSION['email'] . "'";
$result = mysqli_query($db, $query) or die(mysqli_error($db));

while ($row = mysqli_fetch_assoc($result)) {
    $Aa = $row['statusName'];

    if ($Aa == 'User') {

        ?> <script type="text/javascript">
//then it will be redirected
alert("Restricted Page! You will be redirected to POS");
window.location = "pos.php";
</script>
<?php }

}
?>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <link rel="stylesheet" href="../assets/assetsani/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/assetsani/css/Animated-Type-Heading.css">
    <link rel="stylesheet" href="../assets/assetsani/css/styles.css">

    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <link rel="stylesheet" href="../css/style.css">
    <link rel='stylesheet' href='../vendor/bootstrap/css/bootstrap.min.css'>
</head>


<div class="caption v-middle text-center">
    <h1 class="cd-headline clip">
        <span class="blc">Welcome| </span>
        <span class="cd-words-wrapper">
            <b class="is-visible"><?php echo $name1 . " " . $name2 ?></b>
            <b>Teacher Dashboard </b>
            <!--<b>Teacher</b>-->
        </span>
    </h1>
</div>
<!--code zangu-->

<div class="main-page">
    <div class="container-fluid">
        <div class="row page-title-div">
            <div class="col-sm-6">
            </div>
            <!-- /.col-sm-6 -->
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container-fluid -->

    <section class="section">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12" style="margin-top:10px">
                    <a class="dashboard-stat bg-primary card border-left-danger shadow h-100 py-2"
                        href="manage-students.php">


                        <span class="text-center" style="font-size:20px;color:white">1</span>
                        <span class="text-xs font-weight-bold text-white text-uppercase mb-1 text-center">ENROLLED
                            STUDENT</span>
                        <span class="bg-icon"><i class="fa fa-users"></i></span>
                    </a>
                    <!-- /.dashboard-stat -->
                </div>
                <!-- /.col-lg-3 col-md-3 col-sm-6 col-xs-12 -->

                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 " style="margin-top:20px">
                    <a class="dashboard-stat bg-info card border-left-warning shadow h-100 py-2"
                        href="manage-subjects.php">

                        <span class="text-center" style="font-size:20px; color:white">1</span>
                        <span class="text-xs font-weight-bold text-white text-uppercase mb-1 text-center">COURSE
                            LIST</span>
                        <span class="bg-icon"><i class="fa fa-ticket"></i></span>
                    </a>
                    <!-- /.dashboard-stat -->
                </div>
                <!-- /.col-lg-3 col-md-3 col-sm-6 col-xs-12 -->

                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12" style="margin-top:20px">
                    <a class="dashboard-stat bg-light card border-left-warning shadow h-100 py-2"
                        href="manage-classes.php">

                        <span class="text-center" style="font-size:20px; color:black">1</span>
                        <span class="text-xs font-weight-bold text-dark text-uppercase mb-1 text-center">Total
                            classes</span>
                        <span class="bg-icon"><i class="fa fa-bank"></i></span>
                    </a>
                    <!-- /.dashboard-stat -->
                </div>
                <!-- /.col-lg-3 col-md-3 col-sm-6 col-xs-12 -->

                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12" style="margin-top:20px">
                    <a class="dashboard-stat bg-success card border-left-warning shadow h-100 py-2"
                        href="manage-results.php">
                        <span class="text-center" style="font-size:20px; color:orange">1</span>
                        <span class="text-xs font-weight-bold text-warning text-uppercase mb-1 text-center">Results
                            Declared</span>
                        <span class="bg-icon"><i class="fa fa-file-text"></i></span>
                    </a>
                    <!-- /.dashboard-stat -->
                </div>
                <!-- /.col-lg-3 col-md-3 col-sm-6 col-xs-12 -->

            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.section -->

</div>
<!-- /.main-page -->


<!---code zangu-->

</html>


<?php
include '../includes/footer.php';
?>