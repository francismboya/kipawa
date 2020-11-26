<?php
include '../includes/connection.php';
include '../includes/sidebar.php';
?><?php
$users = $_SESSION['users'];
$typid = $_SESSION['typid'];
$ID = $_SESSION['id'];

$query = "SELECT u." . $ID . ", t.statusName
                          FROM " . $users . " u
                          JOIN status t ON t.email=u.email WHERE u.email = '" . $_SESSION['email'] . "'";
$result = mysqli_query($db, $query) or die(mysqli_error($db));

while ($row = mysqli_fetch_assoc($result)) {
    $Aa = $row['statusName'];

    if ($Aa == 'teacher') {

        ?> <script type="text/javascript">
//then it will be redirected
alert("Restricted Page! You will be redirected");
window.location = "teacheractvity.php";
</script>

<?php } elseif ($Aa == 'hod') {

        ?> <script type="text/javascript">
//then it will be redirected
alert("Restricted Page! You will be redirected ");
window.location = "hodactivity.php";
</script>

<?php } elseif ($Aa == 'registrar') {

        ?> <script type="text/javascript">
//then it will be redirected
alert("Restricted Page! You will be redirected");
window.location = "#";
</script>

<?php } elseif ($Aa == 'principal') {

        ?> <script type="text/javascript">
//then it will be redirected
alert("Restricted Page! You will be redirected");
window.location = "pdash.php";
</script>

<?php } elseif ($Aa == 'student') {

        ?> <script type="text/javascript">
//then it will be redirected
alert("Restricted Page! You will be redirected");
window.location = "stddashboard.php";
</script>

<?php }

}
?>


<div class="d-flex flex-column" id="content-wrapper">
    <div id="content">

        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-xl-12 col-sm-12">
                    <div class="card shadow mb-4">
                        <div class="btn-danger card-header d-flex justify-content-between align-items-center"
                            style="background: url('../img/gold.jpeg');background-size: cover ">
                            <h6 class="text-white font-weight-bold m-0">Registrar Panel</h6>

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
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <ul>
                                                    <li>Edit your Info</li>
                                                    <li>View Department</li>
                                                    <li>Manage Academic Session</li>
                                                    <li>View Result Summary</li>
                                                    <li>Issue Public Announcement</li>

                                                </ul>
                                                </br>
                                                Please select appropriate action to continue...!
                                                </br>
                                            </div>

                                            <div class="col-sm-4" style="background-color:#ffffff;">
                                                <?php
if ($_SESSION['gender'] == 'male') {

    ?>
                                                <img src='../img/gold24.gif'
                                                    style=" pointer-events: none; cursor: default; height:100%; width:100%;">
                                                <?php
} else {
    ?>
                                                <img src='../img/gold25.gif'
                                                    style=" pointer-events: none; cursor: default; height:100%; width:100%;">


                                                <?php
}
?>

                                            </div>
                                            <div class="col-sm-4" style="background-color:#e4f5f2

;">
                                                <img src='../img/gold235.gif'
                                                    style=" pointer-events: none; cursor: default; height:100%; width:100%;">


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

    </div>
</div>
<?php
include '../includes/footer.php';
?>
<script>
$.notify("<?php echo "Welcome! " . $_SESSION['fname'] . " " . $_SESSION['lname'] . ", "; ?>" + "admin account verified",
    "success")
//$('#ajaxorg').load('index.php');
</script>

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