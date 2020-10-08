<head>
    <meta name="viewport" content="width=device-width, initial-scale=0.6 user-scalable=no">
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/Animated-Type-Heading.js"></script>

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


</html>


<?php
include '../includes/footer.php';
?>