<head>
    <link rel='stylesheet' href='../vendor/datatables/dataTables.bootstrap4.mina.css'>
    <link rel='stylesheet' href='../css/animate.css'>
    <meta name="viewport" content="width=device-width, initial-scale=0.6 user-scalable=no">
</head>
<?php
include '../includes/connection.php';
require 'session.php';
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
<div id='stdld'>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <form action='' method='post'>
                <div class='row'>
                    <div class="form-group col-sm-3">
                        <h4 class="m-2 font-weight-bold text-primary">Teacher&nbsp;<a href="#" data-toggle="modal"
                                data-target="#employeeModal" type="button" class="btn btn-primary bg-gradient-primary"
                                style="border-radius: 0px;"><i class="fas fa-fw fa-plus"></i></a></h4>
                    </div>
                    <div class="form-group col-sm-3">
                        <div class='animate'>
                            <img src='../img/click.gif' class='disabl' id="diva">
                            <img src='../img/moving.png' class='disabl' id="diva2">

                        </div>
                    </div>
                    <div class="form-group col-sm-5">

                        <input type='button' id='std2' class="btn btn-primary bg-gradient-primary"
                            value='TCH >>> WITH DIP'>
                    </div>

                </div>
            </form>

        </div>

        <div class="card-body">
            <div class="table-responsive" style="font-size:14px">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Department</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
$query = "SELECT employeeID, fname, lname, phoneno, s.statusName, employee.depertmentID FROM employee
                        join status s on s.email= employee.email
                        where s.statusName ='teacher' and employee.depertmentID is null";
$result = mysqli_query($db, $query) or die(mysqli_error($db));
while ($row = mysqli_fetch_assoc($result)) {
    echo '<tr>';
    echo '<td style="font-size:14px">' . $row['fname'] . '</td>';
    echo '<td style="font-size:14px">' . $row['lname'] . '</td>';
    echo '<td style="font-size:14px">' . $row['depertmentID'] . '</td>';

    echo '<td align="right" style="font-size:14px"> <div class="btn-group">
                              <a type="button" class="btn btn-primary bg-gradient-primary" href="emp_searchfrm.php?action=edit & id=' . $row['employeeID'] . '"><i class="fas fa-fw fa-list-alt"></i> Details</a>
                            <div class="btn-group">
                              <a type="button" class="btn btn-primary bg-gradient-primary dropdown no-arrow" data-toggle="dropdown" style="color:white;">
                              ... <span class="caret"></span></a>
                            <ul class="dropdown-menu text-center" role="menu">
                                <li>
                                  <a type="button" class="btn btn-warning bg-gradient-warning btn-block" style="border-radius: 0px;" href="emp_edit.php?action=edit & id=' . $row['employeeID'] . '">
                                    <i class="fas fa-fw fa-edit"></i> Edit
                                  </a>
                                </li>
                            </ul>
                            </div>
                          </div> </td>';
    echo '</tr> ';
}
?>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- Bootstrap core JavaScript-->
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="../js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="../vendor/datatables/jquery.dataTables.min.js"></script>
<script src="../vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="../js/demo/datatables-demo.js"></script>
<script src="../js/city.js"></script>
<?php
#include '../includes/footer.php';
?>

<body>
    <script src='../js/index2.js'></script>
    <script src='../js/alert.js'></script>
    <!-- <script src='../js/index.js'></script>-->
    <script src='../vendor/bootstrap/js/bootstrapfull.js'></script>
    <script src='../vendor/bootstrap/js/bootstrapbundle.js'></script>


</body>