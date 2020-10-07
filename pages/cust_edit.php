<?php
include '../includes/connection.php';
include '../includes/sidebar.php';

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
        ?>
<script type="text/javascript">
//then it will be redirected
alert("Restricted Page! You will be redirected to POS");
window.location = "pos.php";
</script>
<?php
}
}
$query = "SELECT employeeID, fname, lname, mname, phoneno, employee.depertmentID, file, department.dName FROM employee
join department on employee.depertmentID=department.depertmentID WHERE employeeID='" . $_GET['id'] . "'";
$result = mysqli_query($db, $query) or die(mysqli_error($db));
while ($row = mysqli_fetch_array($result)) {
    $zz = $row['employeeID'];
    $i = $row['fname'];
    $a = $row['lname'];
    $b = $row['mname'];
    $c = $row['phoneno'];

    $d = $row['depertmentID'];
    $image = $row['file'];
    $dn = $row['dName'];
}
$id = $_GET['id'];
$sqlforjob = "SELECT DISTINCT depertmentID, dName
FROM department order by depertmentID asc";
$result = mysqli_query($db, $sqlforjob) or die("Bad SQL: $sqlforjob");

$job2 = "<select class='form-control col-sm-4' name='jobs' required>
        <option value='" . $d . "' disabled selected hidden>" . $dn . "</option>";
while ($row = mysqli_fetch_assoc($result)) {
    $job2 .= "<option value='" . $row['depertmentID'] . "'>" . $row['dName'] . "</option>";
}

$job2 .= "</select>";

?>

<center>
    <div class="card shadow mb-4 col-xs-12 col-md-7 border-bottom-primary">
        <div class="card-header py-3">
            <h4 class="m-2 font-weight-bold text-primary">UPDATE <?php echo $i . " " . $b . " " . $a ?> DETAIL</h4>
        </div><a type="button" class="btn btn-primary bg-gradient-primary btn-block" href="management.php?"> <i
                class="fas fa-flip-horizontal fa-fw fa-share"></i> Back </a>
        <div class="card-body">
            <div class="container">



                <form role="form" method="post" action="cust_edit1.php">
                    <div class="row justify-content-center">
                        <div class="col-sm-6 imgUp">
                            <div class="imagePreview"
                                style="background-image:url(../img/empty.png); background-size: cover;"></div>
                            <label class="btn btn-primary col-sm-12">
                                Update profile photo<input type="file" class="uploadFile img" value="Upload Photo"
                                    style="width:0px; height: 0px; overflow: hidden;">
                            </label>
                        </div><!-- col-2 -->
                    </div><!-- row -->
            </div><!-- container -->
            <!--image-->
            <!--image-->
            <script src="../js/script.js"></script>
            <!--image-->
            <input type="hidden" name="id" value="<?php echo $zz; ?>" />
            <div class="form-group row text-left text-warning">
                <div class="col-sm-3" style="padding-top: 5px;">
                    First Name:
                </div>
                <div class="col-sm-9">
                    <input class="form-control" placeholder="First Name" name="firstname" value="<?php echo $i; ?>"
                        required>
                </div>
            </div>
            <div class="form-group row text-left text-warning">
                <div class="col-sm-3" style="padding-top: 5px;">
                    Middle Name:
                </div>
                <div class="col-sm-9">
                    <input class="form-control" placeholder="Middle Name" name="middlename" value="<?php echo $b; ?>"
                        required>
                </div>
            </div>
            <div class="form-group row text-left text-warning">
                <div class="col-sm-3" style="padding-top: 5px;">
                    Last Name:
                </div>
                <div class="col-sm-9">
                    <input class="form-control" placeholder="Last Name" name="lastname" value="<?php echo $a; ?>"
                        required>
                </div>
            </div>
            <div class="form-group row text-left text-warning">
                <div class="col-sm-2" style="padding-top: 5px;">
                    contact#:
                </div>
                <div class="col-sm-4">
                    <input class="form-control" placeholder="Phone number" name="lastname" value="<?php echo $c; ?>"
                        required>
                </div>
                <div class="col-sm-2" style="padding-top: 5px;">
                    Department #:
                </div>
                <?php echo $job2; ?>
            </div>
            <hr>

            <button type="submit" class="btn btn-warning btn-block"><i class="fa fa-edit fa-fw"></i>Update</button>
            </form>
        </div>
    </div>

    <?php
include '../includes/footer.php';
?>