<head>
    <meta name="viewport" content="width=device-width, initial-scale=0.6 user-scalable=no">
</head>
<?php
include '../includes/connection.php';
include '../includes/hsidebar.php';
?><?php

$users = $_SESSION['users'];
$typid = $_SESSION['typid'];
$ID = $_SESSION['id'];
$name1 = $_SESSION['fname'];
$name2 = $_SESSION['lname'];
$emp = $_SESSION['ID'];
$depertment = $_SESSION['depertmentID'];
?>
<div class="card-body">
    <div class="table-responsive" style="font-size:14px">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead>
                <p>Dear,<?php echo "$name1 $name2  the following course are assigned to you : "; ?></p>
                <tr>
                <tr>
                    <th style="font-size:14px">NAME</th>
                    <th style="font-size:14px">EMAIL</th>
                    <th style="font-size:14px">GENDER</th>
                    <th style="font-size:14px">PHONE NUMBER</th>
                </tr>
            </thead>
            <tbody>
                <?php
$uemail = $_SESSION['email'];

$query = "SELECT * FROM employee join status on status.email=employee.email where status.statusName='teacher'  and employee.depertmentID='".$depertment."'";
$result = mysqli_query($db, $query) or die(mysqli_error($db));

while ($row = mysqli_fetch_assoc($result)) {
    echo '<tr>';
    echo '<td style="font-size:14px">' . $row['fname'] . ' '. $row['lname'] .  '</td>';
    echo '<td style="font-size:14px">' . $row['email'] . '</td>';
    echo '<td style="font-size:14px">' . $row['gender'] . '</td>';
    echo '<td style="font-size:14px">' . $row['phoneno'] . '</td>';
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