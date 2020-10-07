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
include '../includes/tsidebar.php';
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
$sql = "SELECT regno, fname, mname, lname, depertmentid,
year, level, email, gender, state, regdate, programID, phoneno FROM student";
$result = mysqli_query($db, $sql) or die("Bad SQL: $sql");
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
            <h4 class="m-2 col-sm-6 font-weight-bold text-primary">Import Student results from excel file &nbsp;<a href="#"
                    data-toggle="modal" data-target="#abModal" type="button" class="btn btn-primary bg-gradient-primary"
                    style="border-radius: 0px;"><i class="fas fa-paperclip" aria-hidden="true"></i></a></h4>
        </div>

    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Reg no</th>
                        <th>Name</th>
                        <th>Depertment</th>
                        <th>Course ID</th>
                        <th>Course Name</th>
                        <th>Marks</th>
                        <th>Average</th>
                    </tr>
                </thead>
                <tbody>

                    <?php $query = "SELECT regno, fname, mname, lname, student.depertmentid,
year, student.level, email, gender, state, regdate, program.programID, program.pName, phoneno FROM student
join program on program.programID=student.programID
";
$result = mysqli_query($db, $query) or die(mysqli_error($db));

while ($row = mysqli_fetch_assoc($result)) {

    echo '<tr>';
    echo '<td>' . $row['regno'] . '</td>';
    echo '<td>' . $row['fname'] . ' ' . $row['mname'] . ' ' . $row['lname'] . '</td>';
    echo '<td>' . $row['depertmentid'] . '</td>';
    echo '<td>';
    echo '<td> </td>';
    echo '<td>';
    echo '<td>';                                                     
    echo '</tr>';
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
<div class="modal fade" id="abModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" method="post" action="pro_transac.php?action=add">

                    <div class="file-loading">
                        <input id="input-ficons-1" name="input-ficons-1[]" multiple type="file">
                    </div>
                    <script>
                    $("#input-ficons-1").fileinput({
                        uploadUrl: "/file-upload-batch/2",
                        uploadAsync: true,
                        previewFileIcon: '<i class="fas fa-file"></i>',
                        allowedPreviewTypes: null, // set to empty, null or false to disable preview for all types
                        previewFileIconSettings: {
                            'docx': '<i class="fas fa-file-word text-primary"></i>',
                            'xlsx': '<i class="fas fa-file-excel text-success"></i>',
                            'pptx': '<i class="fas fa-file-powerpoint text-danger"></i>',
                            'jpg': '<i class="fas fa-file-image text-warning"></i>',
                            'pdf': '<i class="fas fa-file-pdf text-danger"></i>',
                            'zip': '<i class="fas fa-file-archive text-muted"></i>',
                        }
                    });
                    </script>
                    <hr>
                    <button type="submit" class="btn btn-success"><i class="fa fa-check fa-fw"></i>Save</button>
                    <button type="reset" class="btn btn-danger"><i class="fa fa-times fa-fw"></i>Reset</button>
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                </form>
            </div>
        </div>
    </div>
</div>