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
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Total Employee</div>
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

    <!-- RECENT PRODUCTS -->
    <div class="col-lg-3">
        <div class="card shadow h-100">
            <div class="card-body">
                <div class="row no-gutters align-items-center">

                    <div class="col-auto">
                        <i class="fa fa-th-list fa-fw"></i>
                    </div>

                    <div class="panel-heading"> Recent online user
                    </div>
                    <div class="row no-gutters align-items-center mt-1">
                        <div class="col-auto">
                            <div class="h6 mb-0 mr-0 text-gray-800">
                                <!-- /.panel-heading -->

                                <div class="panel-body">
                                    <div class="list-group">
                                        <?php
$query = "SELECT email, ostate FROM loginST  where ostate='online' order by OID DESC LIMIT 10";
$result = mysqli_query($db, $query) or die(mysqli_error($db));
while ($row = mysqli_fetch_array($result)) {

    echo "<a href='#' class='list-group-item text-gray-800'>
                                          <i class='fa fa-tasks fa-fw'></i> $row[0]
                                          </a>";
}
?>
                                    </div>
                                    <!-- /.list-group -->
                                    <a href="product.php" class="btn btn-default btn-block">View All user</a>
                                </div>
                                <!-- /.panel-body -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--
          <div class="col-md-3">
           <div class="col-md-12 mb-2">
              <div class="card border-left-danger shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-danger text-uppercase mb-1"><i class="fas fa-list text-danger">&nbsp;&nbsp;&nbsp;</i>Recent Products</div>
                      <div class="h6 mb-0 font-weight-bold text-gray-800">
                        <?php
$query = "SELECT email, ostate FROM loginST  where ostate='online' order by OID DESC LIMIT 10";
$result = mysqli_query($db, $query) or die(mysqli_error($db));
while ($row = mysqli_fetch_array($result)) {
    echo "<ul style='list-style-position: outside'>";
    echo "<li>$row[0]</li>";
    echo "</ul>";
}
?>
                      </div>
                    </div>
                    <div class="col-auto">

                    </div>
                  </div>
                </div>
              </div>
            </div>
            </div> -->


    </div>

    <?php
include '../includes/footer.php';
?>