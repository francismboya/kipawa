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

    if ($Aa == 'User') {

        ?> <script type="text/javascript">
//then it will be redirected
alert("Restricted Page! You will be redirected to POS");
window.location = "pos.php";
</script>
<?php }

}
$query = 'SELECT * FROM employee WHERE employeeID =' . $_GET['id'];
$result = mysqli_query($db, $query) or die(mysqli_error($db));
while ($row = mysqli_fetch_array($result)) {
    $zz = $row['CUST_ID'];
    $i = $row['FIRST_NAME'];
    $a = $row['LAST_NAME'];
    $b = $row['PHONE_NUMBER'];
}
$id = $_GET['id'];
?>

<center>
    <div class="card shadow mb-4 col-xs-12 col-md-8 border-bottom-primary">
        <div class="card-header py-3">
            <h4 class="m-2 font-weight-bold text-primary">Customer's Detail</h4>
        </div>
        <a href="customer.php" type="button" class="btn btn-primary bg-gradient-primary btn-block"> <i
                class="fas fa-flip-horizontal fa-fw fa-share"></i> Back </a>
        <div class="card-body">


            <div class="form-group row text-left">

                <div class="col-sm-3 text-primary">
                    <h5>
                        Full Name<br>
                    </h5>
                </div>

                <div class="col-sm-9">
                    <h5>
                        : <?php echo $i; ?> <?php echo $a; ?> <br>
                    </h5>
                </div>

            </div>

            <div class="form-group row text-left">

                <div class="col-sm-3 text-primary">
                    <h5>
                        Contact #<br>
                    </h5>
                </div>

                <div class="col-sm-9">
                    <h5>
                        : <?php echo $b; ?> <br>
                    </h5>
                </div>

            </div>
        </div>
    </div>

    <?php
include '../includes/footer.php';
?>