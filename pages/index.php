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
window.location = "principal.php";
</script>

<?php }
elseif ($Aa == 'student') {

        ?> <script type="text/javascript">
//then it will be redirected
alert("Restricted Page! You will be redirected");
window.location = "#";
</script>

<?php }

}
?>

<div class="row show-grid">
    <!-- Customer ROW -->
    <div class="col-md-3">
        <!-- Customer record -->
        <div class="col-md-12 mb-3">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-0">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Total Employee
                            </div>
                            <div class="h6 mb-0 font-weight-bold text-gray-800">
                                <?php
$query = "SELECT COUNT(*) FROM employee";
$result = mysqli_query($db, $query) or die(mysqli_error($db));
while ($row = mysqli_fetch_array($result)) {
    echo "$row[0]";
}
?> Record(s)

                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-users fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Supplier record -->
        <div class="col-md-12 mb-3">
            <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-0">
                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Student</div>
                            <div class="h6 mb-0 font-weight-bold text-gray-800">
                                <?php
$query = "SELECT COUNT(*) FROM student e join status s on e.email=s.email where s.statusName='student'";
$result = mysqli_query($db, $query) or die(mysqli_error($db));
while ($row = mysqli_fetch_array($result)) {
    echo "$row[0]";
}
?> Record(s)

                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-users fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- Employee ROW -->
    <div class="col-md-3">
        <!-- Employee record -->
        <div class="col-md-12 mb-3">
            <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-0">
                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Registrar</div>
                            <div class="h6 mb-0 font-weight-bold text-gray-800">
                                <?php
$query = "SELECT COUNT(*) FROM employee e
                        join status s on e.email=s.email where s.statusName='registrar'";
$result = mysqli_query($db, $query) or die(mysqli_error($db));
while ($row = mysqli_fetch_array($result)) {
    echo "$row[0]";
}
?> Record(s)

                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-users fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- User record -->
        <div class="col-md-12 mb-3">
            <div class="card border-left-danger shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-0">
                            <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">Head of Department
                            </div>
                            <div class="h6 mb-0 font-weight-bold text-gray-800">
                                <?php
$query = "SELECT COUNT(*) FROM employee e
                        join status s on e.email=s.email where s.statusName='hod'";
$result = mysqli_query($db, $query) or die(mysqli_error($db));
while ($row = mysqli_fetch_array($result)) {
    echo "$row[0]";
}
?> Record(s)
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-user fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- PRODUCTS ROW -->
    <div class="col-md-3">
        <!-- Product record -->
        <div class="col-md-12 mb-3">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">

                        <div class="col mr-0">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Teacher</div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div class="h6 mb-0 mr-3 font-weight-bold text-gray-800">
                                        <?php
$query = "SELECT COUNT(*) FROM employee e
                          join status s on e.email=s.email where s.statusName='teacher'";
$result = mysqli_query($db, $query) or die(mysqli_error($db));
while ($row = mysqli_fetch_array($result)) {
    echo "$row[0]";
}
?> Record(s)
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-auto">
                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
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