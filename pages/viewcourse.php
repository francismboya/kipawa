<head>
    <meta name="viewport" content="width=device-width, initial-scale=0.6 user-scalable=no">
</head>
<?php
include '../includes/connection.php';
include '../includes/tsidebar.php';
?><?php

$users = $_SESSION['users'];
$typid = $_SESSION['typid'];
$ID = $_SESSION['id'];
$name1 = $_SESSION['fname'];
$name2 = $_SESSION['lname'];
$emp = $_SESSION['ID'];
?>
<div class="card-body">
    <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead>
                <p>Dear,<?php echo "$name1 $name2  the following course are assigned to you : "; ?></p>
                <tr>
                <tr>
                    <th>COURSE ID</th>
                    <th>COURSE NAME</th>
                    <th>PROGRAM</th>
                    <th>LEVEL</th>
                    <th>CLASSFICATION</th>
                    <th>CREDIT</th>
                </tr>
            </thead>
            <tbody>
                <?php
$uemail = $_SESSION['email'];

$query = "SELECT distinct course.courseID, employee.employeeID, course.cName, courseprogram.programID, course.level, course.credit, course.classfication from employee left join course on course.employeeID=employee.employeeID join courseprogram on courseprogram.courseID= course.courseID and courseprogram.level=course.level where employee.employeeID='" . $emp . "' ORDER BY course.level";
$result = mysqli_query($db, $query) or die(mysqli_error($db));

while ($row = mysqli_fetch_assoc($result)) {
    echo '<tr>';
    echo '<td>' . $row['courseID'] . '</td>';
    echo '<td>' . $row['cName'] . '</td>';
    echo '<td>' . $row['programID'] . '</td>';
    echo '<td>' . $row['level'] . '</td>';
    echo '<td>' . $row['classfication'] . '</td>';
    echo '<td>' . $row['credit'] . '</td>';

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