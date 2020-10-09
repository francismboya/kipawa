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
            <h4 class="m-2 col-sm-5 font-weight-bold text-primary">Upload Coursework&nbsp;
                <a href="#" data-toggle="modal" data-target="#aModal" type="button"
                    class="btn btn-primary bg-gradient-primary" style="border-radius: 0px;"><i
                        class="fas fa-paperclip"></i></a>
            </h4>
            <h4 class="m-2 col-sm-5 font-weight-bold text-primary">Upload course Result &nbsp;<a href="#"
                    data-toggle="modal" data-target="#abModal" type="button" class="btn btn-primary bg-gradient-primary"
                    style="border-radius: 0px;"><i class="fas fa-paperclip" aria-hidden="true"></i></a></h4>
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

                    <?php $query = "SELECT regno, fname, mname, lname, student.depertmentid,
year, student.level, email, gender, state, regdate, program.programID, program.pName, phoneno FROM student
join program on program.programID=student.programID
";
$result = mysqli_query($db, $query) or die(mysqli_error($db));

while ($row = mysqli_fetch_assoc($result)) {

    echo '<tr>';
    echo '<td style="font-size:14px">' . $row['regno'] . '</td>';
    echo '<td style="font-size:14px">' . $row['fname'] . ' ' . $row['mname'] . ' ' . $row['lname'] . '</td>';
    echo '<td style="font-size:14px">' . $row['depertmentid'] . '</td>';
    echo '<td style="font-size:14px">' . '' . $row['phoneno'] . '<br>' . $row['email'] . '</td>';
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
<div class="modal fade" id="aModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Upload CourseWork</h5>

                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>

            </div>
            <div class="modal-body">


                <form role="form" method="post" action="pro_transac.php?action=add" class="form-horizontal">
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
                    <br>
                    <br>
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <select class='form-control' name='level' required>
                                <option value="" disabled selected hidden>Select Level</option>
                                <option value="NTA2">NTA2</option>
                                <option value="NTA3">NTA3</option>
                                <option value="NTA4">NTA4</option>
                                <option value="NTA5">NTA5</option>
                                <option value="NTA6">NTA6</option>
                            </select>
                        </div>
                        <?php
$emp = $_SESSION['ID'];
$query = "SELECT employee.employeeID, course.courseID,course.cName, course.programID, course.level, course.credit, course.classfication from employee left join course on course.employeeID=employee.employeeID where employee.employeeID='" . $emp . "'";
$result = mysqli_query($db, $query) or die(mysqli_error($db));
$courseID = array();
$cName = array();
$levo = array();
$len = count($courseID);
$value = array();

while ($row = mysqli_fetch_assoc($result)) {
    ?>
                        <div class="form-group col-sm-6">
                            <select class='form-control' name='gender' required>
                                <option value="" disabled selected hidden>Select Course</option>
                                <option value="NTA4">NTA4</option>
                                <option value="NTA5">NTA5</option>
                                <option value="NTA6">NTA6</option>

                            </select>
                        </div>
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
</div>
<?php }?>
<div class="modal fade" id="abModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Upload Results</h5>
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