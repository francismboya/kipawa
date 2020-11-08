<head>
    <meta name="viewport" content="width=device-width, initial-scale=0.6 user-scalable=no">
    <meta http-equiv="refresh" content="900;url=logout.php" />
</head>
<?php
if (isset($_SESSION['last_acted_on']) && (time() - $_SESSION['last_acted_on'] > 60 * 15)) {

    ?>
<script type="text/javascript">
//then it will be redirected
window.location = "logout.php";
</script>
<?php
} else {
    //session_regenerate_id(true);
    $_SESSION['last_acted_on'] = time();
}
?>


<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

            <!-- Sidebar Toggle (Topbar) -->
            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                <i class="fa fa-bars"></i>
            </button>

            <!-- Topbar Navbar -->
            <ul class="navbar-nav ml-auto">

                <li class="nav-item dropdown no-arrow">
                    <a class="nav-link" href="pos.php" role="button">
                        <span class="mr-2 d-non255e d-lg-inline text-gray-600 small">POS</span>
                    </a>
                </li>

                <div class="topbar-divider d-non255e d-sm-block"></div>

                <!-- Nav Item - User Information -->
                <li class="nav-item dropdown no-arrow">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">
                        <span
                            class="mr-2 d-non255e d-lg-inline text-gray-600 large"><?php echo $_SESSION['fname'] . ' ' . $_SESSION['lname']; ?></span>
                        <img class="img-profile rounded-circle" style="height:100%; width:120px" <?php
$image1 = $_SESSION['file'];
if (strcmp($_SESSION['users'], "student") == 0) {
    $pathimg = "../stdimg/" . $image1;
} else {
    $pathimg = "../stfimg/" . $image1;

}
if (file_exists($pathimg) && is_file($pathimg)) {
    $pathimg2 = ' src=' . $pathimg;
    echo $pathimg2;

} else {
    if ($_SESSION['gender'] == 'male') {
        echo ' src="../img/male.png"';
    } else {
        echo ' src="../img/female.png"';
    }
}
?>>

                    </a>

                    <?php
$users = $_SESSION['users'];
$typid = $_SESSION['typid'];
$ID = $_SESSION['id'];

$query = "SELECT u." . $ID . ", fname, lname, u.email, l.password
                          FROM " . $users . " u
                          JOIN login l ON u.email=l.email";
$result = mysqli_query($db, $query) or die(mysqli_error($db));

while ($row = mysqli_fetch_assoc($result)) {
    $a = $_SESSION['ID'];
}

?>

                    <!-- Dropdown - User Information -->
                    <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                        aria-labelledby="userDropdown">
                        <button class="dropdown-item" onclick="on()">
                            <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                            Profile
                        </button>
                        <a class="dropdown-item" href="settings.php?action=edit & id='<?php echo $a; ?>'">
                            <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                            Settings
                        </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                            <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                            Logout
                        </a>
                    </div>
                </li>

            </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">