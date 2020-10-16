<head>
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <link rel="stylesheet" href="../css/style.css">
    <link rel='stylesheet' href='../vendor/bootstrap/css/bootstrap.min.css'>
</head>
<?php
include '../includes/connection.php';
include '../includes/hsidebar.php';
//include 'studentfile.php';
$users = $_SESSION['users'];
$typid = $_SESSION['typid'];
$ID = $_SESSION['id'];
$deparment = $_SESSION['depertmentID'];

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
$sql = "SELECT regno, fname, mname, lname, depertmentid,
year, level, email, gender, state, regdate, programID, phoneno FROM student";
$result = mysqli_query($db, $sql) or die("Bad SQL: $sql");

//$aaa = "<select class='form-control' name='category' required>
//        <option disabled selected hidden>Select Category</option>";
// while ($row = mysqli_fetch_assoc($result)) {
//   $aaa .= "<option value='".$row['CATEGORY_ID']."'>".$row['CNAME']."</option>";
//}

//$aaa .= "</select>";

//$sql2 = "SELECT DISTINCT SUPPLIER_ID, COMPANY_NAME FROM supplier order by COMPANY_NAME asc";
//$result2 = mysqli_query($db, $sql2) or die ("Bad SQL: $sql2");

//$sup = "<select class='form-control' name='supplier' required>
//  <option disabled selected hidden>Select Supplier</option>";
//while ($row = mysqli_fetch_assoc($result2)) {
// $sup .= "<option value='".$row['SUPPLIER_ID']."'>".$row['COMPANY_NAME']."</option>";
// }

//$sup .= "</select>";

?>

<?php
$sqldip = "SELECT DISTINCT depertmentID, dName FROM department order by depertmentID asc";
$result = mysqli_query($db, $sqldip) or die("Bad SQL: $sqldip");

$dip = "<select class='form-control' name='deparment' required>
        <option value='' disabled selected hidden>Select Department</option>";
while ($row = mysqli_fetch_assoc($result)) {
    $dip .= "<option value='" . $row['depertmentID'] . "'>" . $row['dName'] . "</option>";
}
$dip .= "</select>";

$sqlpro = "SELECT DISTINCT programID, pName
FROM program order by programID asc";
$result = mysqli_query($db, $sqlpro) or die("Bad SQL: $sqlpro");

$pro = "<select class='form-control col-sm-12' name='program' required>
        <option value='' disabled selected hidden>Select Program</option>";
while ($row = mysqli_fetch_assoc($result)) {
    $pro .= "<option value='" . $row['programID'] . "'>" . $row['pName'] . "</option>";
}

$pro .= "</select>";
?>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <div class="row col-sm-12">
            <h4 class="m-2 col-sm-12 font-weight-bold text-primary">List of student under <?php echo $deparment; ?>
                Depertment</h4>
        </div>

    </div>
    <div class="card-body">
        <div class="table-responsive" style="font-size:14px">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th style="font-size:14px">Reg no</th>
                        <th style="font-size:14px">Name</th>
                        <th style="font-size:14px">Department</th>
                        <th style="font-size:14px">contact</th>
                        <th style="font-size:14px">Program</th>
                        <th style="font-size:14px">gender</th>

                        <th style="font-size:14px">Action</th>
                    </tr>
                </thead>
                <tbody>

                    <?php $query = "SELECT student.regno, student.fname, mname, lname, student.depertmentid,
student.year, student.level, student.email, student.gender, student.programID,program.programID, program.pName, phoneno FROM student
join program on program.programID=student.programID where student.depertmentID='" . $deparment . "'
";
$result = mysqli_query($db, $query) or die(mysqli_error($db));

while ($row = mysqli_fetch_assoc($result)) {

    echo '<tr>';
    echo '<td style="font-size:14px">' . $row['regno'] . '</td>';
    echo '<td style="font-size:14px">' . $row['fname'] . ' ' . $row['mname'] . ' ' . $row['lname'] . '</td>';
    echo '<td style="font-size:14px">' . $row['depertmentid'] . '</td>';
    echo '<td style="font-size:14px">' . " 0" . '' . $row['phoneno'] . '<br>' . $row['email'] . '</td>';
    echo '<td style="font-size:14px">' . '(' . $row['programID'] . ') ' . $row['pName'] . '</td>';
    echo '<td style="font-size:14px">' . $row['gender'] . '</td>';
    echo '<td align="right" style="font-size:14px"> <div class="btn-group">
                              <a type="button" class="btn btn-primary bg-gradient-primary" href="pro_searchfrm.php?action=edit & id=' . $row['regno'] . '"><i class="fas fa-fw fa-list-alt"></i> Details</a>
                            <div class="btn-group">
                              <a type="button" class="btn btn-primary bg-gradient-primary dropdown no-arrow" data-toggle="dropdown" style="color:white;">
                              ... <span class="caret"></span></a>
                            <ul class="dropdown-menu text-center" role="menu">
                                <li>
                                  <a type="button" class="btn btn-warning bg-gradient-warning btn-block" style="border-radius: 0px;" href="pro_edit.php?action=edit & id=' . $row['regno'] . '">
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

<?php
include '../includes/footer.php';
?>


<!-- Customer Modal-->

</div>
</div>
</div>
</div>
</div>
<script src="../js/student.js"></script>