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



<!--code zangu-->

<div class="container-fluid">
    <div class="d-sm-flex justify-content-between align-items-center mb-4">
        <h3 class="text-dark mb-0">Dashboard</h3>
    </div>

    <div class="row">
        <div class="col-lg-12 col-xl-12 col-sm-12">
            <div class="card shadow mb-4">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <div class="caption v-middle text-center ">
                        <h5 class="cd-headline clip text-primary font-weight-bold m-0">
                            <span class="blc accordion text-info font-weight-bold m-0 text-primary "
                                style="font-size:20px;">Welcome|
                            </span>
                            <span class="cd-words-wrapper" style="margin-left:5px">
                                <b class="is-visible text-danger font-weight-bold m-0"
                                    style="font-size: 16px;"><?php echo $name1 . " " . $name2 ?></b>
                                <b style="font-size: 16px;" class="text-danger font-weight-bold m-0">Teacher Dashboard
                                </b>

                            </span>
                        </h5>
                    </div>

                </div>
                <div class="card-body">
                    <?php

?>
                    <div class="container">
                        <div class="panel-body">
                            <div class="panel-group" id="accordion">
                                <p align='justify'>You have successfully logged to VETA Kipawa ICT Centre
                                    Student Records Management System (SRMS).You currently have
                                    access to the following sections</p>
                                </br>
                                <ul>
                                    <li>Edit your Info</li>
                                    <li>View course</li>
                                    <li>View department</li>
                                    <li>View student</li>
                                    <li>upload coursework</li>
                                    <li>upload result</li>
                                    <li>export data</li>
                                </ul>
                                </br></br>
                                Please select appropriate action to continue...!
                                </br></br>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>
</div>

<!-- /.main-page -->


<!---code zangu-->

</html>


<?php
include '../includes/footer.php';
?>
<script>
if (history.pushState) {
    var loc = window.location.href + "<?php echo $_SESSION['fname'] ?>"
    var passhash = CryptoJS.MD5(loc).toString();
    var id = "?encry#" + passhash;
    var pth = "/php/kipawa/pages/index.php"
    var newurl = window.location.protocol + "//" + window.location.host + pth + id;
    window.history.pushState("object or string", "Title", newurl);
} else {
    document.location.href = window.location.href;
}
</script>