<head>
    <meta name="viewport" content="width=device-width, initial-scale=0.6 user-scalable=no">
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <link rel="stylesheet" href="../css/style.css">
    <link rel='stylesheet' href='../vendor/bootstrap/css/bootstrap.min.css'>
</head>
<?php
include '../includes/connection.php';
include '../includes/tsidebar.php';

?>
<?php

$users = $_SESSION['users'];
$typid = $_SESSION['typid'];
$ID = $_SESSION['id'];
$name1 = $_SESSION['fname'];
$name2 = $_SESSION['lname'];
?>

<div class="card-body">
    <div class="table-responsive">
        <table class="table table-bordered" id="dataTable2" width="100%" cellspacing="0">
            <thead>
                <p>Dear <?php echo "$name1 $name2  your Department Infromation is : "; ?></p>
                <tr>
                    <th>DEPARTMENT ID</th>
                    <th>DEPARTMENT NAME</th>

                </tr>
            </thead>
            <tbody>
                <?php
$uemail = $_SESSION['email'];

$query = "SELECT employee.employeeID, employee.depertmentID, employee.email ,department.depertmentID,department.dName from employee left join department on department.depertmentID=employee.depertmentID WHERE employee.email='$uemail'";
$result = mysqli_query($db, $query) or die(mysqli_error($db));

while ($row = mysqli_fetch_assoc($result)) {
    echo '<tr>';
    echo '<td style="font-size:14px">' . $row['depertmentID'] . '</td>';
    echo '<td style="font-size:14px">' . $row['dName'] . '</td>';

    echo '</tr> ';
}
?>
            </tbody>
        </table>
    </div>
</div>
<?php
include '../includes/footer.php';

?>