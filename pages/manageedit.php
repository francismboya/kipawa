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
$query = "SELECT employeeID, fname, lname, mname, phoneno, employee.depertmentID, file, department.dName, gender FROM employee
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
    $gender = $row["gender"];
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

<div class="card shadow mb-4 col-xs-12 col-md-12 border-bottom-primary">
    <div class="card-header py-0">
        <h4 class="m-0 font-weight-bold text-primary">UPDATE <?php echo $i . " " . $b . " " . $a ?> DETAIL</h4>
    </div><a type="button" class="btn btn-primary bg-gradient-primary btn-block" href="management.php?"> <i
            class="fas fa-flip-horizontal fa-fw fa-share"></i> Back </a>
    <div class="card-body">




        <form role="form" method="post" action="manageedit1.php" enctype="multipart/form-data>
                <div class=" container">
            <div class="row justify-content-center">
                <div class="col-xs-3 imgUp">
                    <div class="imagePreview" <?php $image1 = $image;
$pathimg = "../stfimg/" . $image1;
if (file_exists($pathimg) && is_file($pathimg)) {

    $pathimg2 = 'style="background-image:url(' . $pathimg . '); ' . 'background-size: cover;"';
    echo $pathimg2;

} else {
    if ($gender == 'male') {
        $pathimg2 = 'style="background-image:url(../img/empty.png); background-size: cover;"';
        echo $pathimg2;

    } else {
        $pathimg2 = 'style="background-image:url(../img/emptyf.png); background-size: cover;"';
        echo $pathimg2;
    }
}
?>> </div>
                    <label class="btn btn-primary col-sm-12">
                        Update profile photo<input type="file" class="uploadFile img" name="image"
                            style="width:0px; height: 0px; overflow: hidden;">
                    </label>
                </div>
            </div>
    </div>
    <script src="../js/script.js"></script>
    <!--image-->
    <input type="hidden" name="id" value="<?php echo $zz; ?>" />
    <div class="row">
        <div class="form-group row text-warning">
            <div class="col-sm-4" style="padding-top: 5px;">
                First Name:
            </div>
            <div class="col-sm-8">
                <input class="form-control" placeholder="First Name" name="firstname" value="<?php echo $i; ?>"
                    required>
            </div>
        </div>
        <div class="form-group row  text-warning">
            <div class="col-sm-4" style="padding-top: 5px; padding-right: 5px;">
                Middle Name:
            </div>
            <div class="col-sm-8">
                <input class="form-control" placeholder="Middle Name" name="middlename" value="<?php echo $b; ?>">
            </div>
        </div>
        <div class="form-group row  text-warning">
            <div class="col-sm-4" style="padding-top: 5px; padding-right: 5px;">
                Last Name:
            </div>
            <div class="col-sm-8">
                <input class="form-control" placeholder="Last Name" name="lastname" value="<?php echo $a; ?>" required>
            </div>
        </div>
        <!--row-->
        <div class="form-group row text-left text-warning">
            <div class="col-sm-4" style="padding-top: 5px; padding-right: 5px;">
                contact#:
            </div>
            <div class="col-sm-8">
                <input class="form-control" placeholder="Phone number" name="phonenumber" value="<?php echo $c; ?>"
                    required>
            </div>
        </div>
        <div class="form-group row  text-warning">
            <div class="col-sm-4" style="padding-top: 5px; padding-right: 5px;">
                Department #:
            </div>
            <?php echo $job2; ?>
        </div>
    </div>
    <hr>

    <button type="submit" name="save" class="btn btn-warning btn-block"><i class="fa fa-edit fa-fw"></i>Update</button>
    </form>
</div>

<?php
include '../includes/footer.php';
?>