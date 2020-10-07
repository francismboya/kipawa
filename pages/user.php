<head>
    <meta name="viewport" content="width=device-width, initial-scale=0.6 user-scalable=no">
</head>
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

    if ($Aa == 'student' or $Aa == 'teacher' or $Aa == 'management' or $Aa == 'principal' or $Aa == "registrar"
        or $Aa == 'hod') {
        ?>
<script type="text/javascript">
//then it will be redirected
alert("Restricted Page! You will be redirected to POS");
window.location = "pos.php";
</script>
<?php
}
}
?>
<!-- ADMIN TABLE -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h4 class="m-2 font-weight-bold text-primary">Admin Account(s)</h4>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>lname</th>
                        <th>Type</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
$query = "SELECT employeeID, fname, mname, lname, t.statusName
              FROM employee e
              JOIN login l ON e.email=l.email
              JOIN status t ON t.email=e.email
              WHERE t.statusName='admin'";
$result = mysqli_query($db, $query) or die(mysqli_error($db));

while ($row = mysqli_fetch_assoc($result)) {

    echo '<tr>';
    echo '<td>' . $row['fname'] . ' ' . $row['lname'] . '</td>';
    echo '<td>' . $row['mname'] . '</td>';
    echo '<td>' . $row['statusName'] . '</td>';
    echo '<td align="right"> <div class="btn-group">
                              <a type="button" class="btn btn-primary bg-gradient-primary" href="us_searchfrm.php?action=edit & id=' . $row['employeeID'] . '"><i class="fas fa-fw fa-list-alt"></i> Details</a>
                            <div class="btn-group">
                              <a type="button" class="btn btn-primary bg-gradient-primary dropdown no-arrow" data-toggle="dropdown" style="color:white;">
                              ... <span class="caret"></span></a>
                            <ul class="dropdown-menu text-center" role="menu">
                                <li>
                                  <a type="button" class="btn btn-warning bg-gradient-warning btn-block" style="border-radius: 0px;" href="us_edit.php?action=edit & id=' . $row['employeeID'] . '">
                                    <i class="fas fa-fw fa-edit"></i> Edit
                                  </a>
                                </li>

                                </li>
                            </ul>
                            </div>
                          </div></td>';
    echo '</tr> ';
}
?>
                </tbody>
            </table>
        </div>
    </div>
</div>





<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h4 class="m-2 font-weight-bold text-primary">User Accounts&nbsp;<a href="#" data-toggle="modal"
                data-target="#supplierModal" type="button" class="btn btn-primary bg-gradient-primary"
                style="border-radius: 0px;"><i class="fas fa-fw fa-plus"></i></a></h4>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Username</th>
                        <th>Type</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
$query = "SELECT u.employeeID, fname, mname, lname, t.statusName
              FROM employee u
              JOIN status t ON t.email=u.email
              WHERE t.statusName !='admin'";
$result = mysqli_query($db, $query) or die(mysqli_error($db));

while ($row = mysqli_fetch_assoc($result)) {

    echo '<tr>';
    echo '<td>' . $row['fname'] . ' ' . $row['lname'] . '</td>';
    echo '<td>' . $row['mname'] . '</td>';
    echo '<td>' . $row['statusName'] . '</td>';
    echo '<td align="right"> <div class="btn-group">
                              <a type="button" class="btn btn-primary bg-gradient-primary" href="us_searchfrm.php?action=edit & id=' . $row['employeeID'] . '"><i class="fas fa-fw fa-list-alt"></i> Details</a>
                            <div class="btn-group">
                              <a type="button" class="btn btn-primary bg-gradient-primary dropdown no-arrow" data-toggle="dropdown" style="color:white;">
                              ... <span class="caret"></span></a>
                            <ul class="dropdown-menu text-center" role="menu">
                                <li>
                                  <a type="button" class="btn btn-warning bg-gradient-warning btn-block" style="border-radius: 0px;" href="us_edit.php?action=edit & id=' . $row['employeeID'] . '">
                                    <i class="fas fa-fw fa-edit"></i> Edit
                                  </a>
                                </li>
                            </ul>
                            </div>
                          </div></td>';
    echo '</tr> ';
}
?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<?php
include '../includes/footer.php';

$sql = "SELECT employeeID, fname, lname, d.depertmentID
        FROM employee e
        JOIN department d ON d.depertmentID=e.depertmentID
        order by e.fname asc";
$res = mysqli_query($db, $sql) or die("Bad SQL: $sql");

$opt = "<select class='form-control' name='empid' required>
        //<option value='' disabled selected hidden>Select Employee</option>";
while ($row = mysqli_fetch_assoc($res)) {
    $opt .= "<option value='" . $row['employeeID'] . "'>" . $row['lname'] . ', ' . $row['fname'] . ' - ' . $row['depertmentID'] . "</option>";
}
$opt .= "</select>";
?>

<!-- User Account Modal-->
<div class="modal fade" id="supplierModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add User Account</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" method="post" action="us_transac.php?action=add">

                    <div class="form-group">
                        <?php
echo $opt;
?>
                    </div>
                    <div class="form-group">
                        <input class="form-control" placeholder="Username" name="username" required>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="Password" name="password" required>
                    </div>
                    <hr>
                    <button type="submit" class="btn btn-success"><i class="fa fa-check fa-fw"></i>Save</button>
                    <button type="reset" class="btn btn-danger"><i class="fa fa-times fa-fw"></i>Reset</button>
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                </form>
            </div>
        </div>
    </div>
</div>