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
$mda = "";
?>
<?Php

if (!empty($_POST["id"])) {
    $id = $_POST["id"];
    $mda = 1;

}
if (!empty($_POST['grant'])) {

}
?>

<div class="card-body">
    <div class="table-responsive" style="font-size:14px">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead>
                <p>Dear,<?php echo "$name1 $name2  the following  are coursework information  to your courses: "; ?>
                </p>
                <tr>
                    <th style="font-size:14px">COURSE ID</th>
                    <th style="font-size:14px">Course Name</th>
                    <th style="font-size:14px">View Course Result</th>
                    <th style="font-size:14px">Result</th>
                    <th style="font-size:14px">status</th>
                    <th style="font-size:14px">action</th>
                </tr>
            </thead>
            <tbody>
                <?php
$uemail = $_SESSION['email'];
$a = "";
$b = "";
$query = "SELECT distinct course.courseID, employee.employeeID, course.cName, courseprogram.programID, course.level, course.credit, course.classfication from employee left join course on course.employeeID=employee.employeeID join courseprogram on courseprogram.courseID= course.courseID and courseprogram.level=course.level where employee.employeeID='" . $emp . "' ORDER BY course.courseID";
$result = mysqli_query($db, $query) or die(mysqli_error($db));
while ($row = mysqli_fetch_assoc($result)) {
    echo '<tr>';
    echo '<td style="font-size:14px">' . $row['courseID'] . '</td>';
    echo '<td style="font-size:14px">' . $row['cName'] . '</td>';
    $coquery = "SELECT * FROM result where courseID='" . $row['courseID'] . "'";
    $resul = mysqli_query($db, $coquery) or die(mysqli_error($db));
    if (mysqli_num_rows($resul) > 0) {
        echo '<td align="center" style="font-size:14px">
         <a type="button" class="btn btn-success bg-gradient-success" href="manageedit.php?action=edit & id='
            . $row['courseID'] . '"><i class="far fa-eye" style="margin-right:5px;"></i>view</a></td>';
        $a = 1;
    } else {
        echo '<td align="center" style="font-size:14px">
         <a type="button" class="btn btn-warning bg-gradient-warning" href="#"><i class="fas fa-eye-slash" style="margin-right:5px;"></i>not uploaded</a></td>';
        $a = 2;
    }
    if ($a == 1) {
        echo '<td align="center" style="font-size:14px">
         <form action="result1.php" method="post">
         <input type="text" name="grant" value="' . $row['courseID'] . '" style="display:none;">
         <button type="submit" class="btn btn-info bg-gradient-info" style="color:white"><i class="fas fa-broadcast-tower" style="margin-right:5px;"></i>grant student</button>

              </form></td>';

    } else {
        echo '<td align="center" style="font-size:14px">
         <form action="result1.php" method="post">
         <input type="text" name="id" value="' . $row['courseID'] . '" style="display:none;">
         <button type="submit" class="btn btn-info bg-gradient-info" style="color:white"><i class="fas fa-upload" style="margin-right:5px;"></i>upload result</button>

              </form></td>';

    }
    if ($a == 1) {
        $co2query = " SELECT u.coaccess, u.costatus
                          FROM courseworkstate u
                          JOIN coursework t ON t.coID=u.coID
                           WHERE t.courseID = '" . $row['courseID'] . "'";

        $resul2 = mysqli_query($db, $co2query) or die(mysqli_error($db));
        if (mysqli_num_rows($resul2) > 0) {
            while ($row2 = mysqli_fetch_assoc($resul2)) {
                if ($row2['costatus'] == "hod") {

                    echo '<td align="center" style="font-size:14px">
         <a type="button" class="btn btn-info bg-gradient-info" href="#"><i class="fas fa-spinner" style="margin-right:5px;"></i>pending to HOD</a></td>';

                    $b = 3;

                } else if ($row2['costatus'] == "principal") {
                    echo '<td align="center" style="font-size:14px">
         <a type="button" class="btn btn-info bg-gradient-info" href="#"><i class="fas fa-spinner" style="margin-right:5px;"></i>progress</a></td>';

                    $b = 4;
                } else if ($row2['costatus'] == "admin") {
                    echo '<td align="center" style="font-size:14px">
         <a type="button" class="btn btn-info bg-gradient-info" href="#"><i class="fas fa-spinner" style="margin-right:5px;"></i>progress</a></td>';

                    $b = 4;

                } else if ($row2['costatus'] == "approved") {
                    echo '<td align="center" style="font-size:14px">
         <a type="button" class="btn btn-info bg-gradient-info" href="#"><i class="far fa-check-circle" style="margin-right:5px;"></i>approved</a></td>';

                    $b = 5;

                }
            }

        } else {
            echo '<td align="center" style="font-size:14px">
         <a type="button" class="btn btn-info bg-gradient-info" href="#"><i class="fas fa-times" style="margin-right:5px;"></i>no pending</a></td>';
            $b = 2;

        }
    } else {
        echo '<td align="center" style="font-size:14px">
         <a type="button" class="btn btn-info bg-gradient-info" href="#"><i class="fas fa-times" style="margin-right:5px;"></i>no pending</a></td>';
        $b = 6;

    }

    if ($b == 2) {
        echo '<td align="center" style="font-size:14px">
          <div class="btn-group mr-2 btn-group-sm" role="group" aria-label="First group">
    <a type="button" class="btn btn-info bg-gradient-info" href="#"><i class="fas fa-paper-plane" style="margin-right:5px;"></i>submit</a>
  </div>';

    } else if ($b == 3) {
        echo '<td align="center" style="font-size:14px">
          <div class="btn-group mr-2 btn-group-sm" role="group" aria-label="First group">
    <a type="button" class="btn btn-warning bg-gradient-warning" href="#"><i class="fas fa-trash-alt" style="margin-right:5px;"></i>delete</a>
    <a type="button" class="btn btn-warning bg-gradient-warning" href="#"><i class="fas fa-pen" style="margin-right:5px;"></i>edit</a>
      </div>';
    } else if ($b == 4) {

        echo '<td align="center" style="font-size:14px">
          <div class="btn-group mr-2 btn-group-sm" role="group" aria-label="First group">
    <a type="button" class="btn btn-secondary bg-gradient-secondary" href="#"><i class="fas fa-ban" style="margin-right:5px;"></i>unsubmit</a>
  </div>';

    } else if ($b == 5) {echo '<td align="center" style="font-size:14px">
          <div class="btn-group mr-2 btn-group-sm" role="group" aria-label="First group">
      <a type="button" class="btn btn-secondary bg-gradient-secondary" href="#"><i class="fas fa-ban" style="margin-right:5px;"></i>unsubmit</a>
  </div>';
    } else if ($b == 6) {
        echo '<td align="center" style="font-size:14px">
          <div class="btn-group mr-2 btn-group-sm" role="group" aria-label="First group">
    <a type="button" class="btn btn-secondary bg-gradient-secondary" href="#"><i class="fas fa-paper-plane" style="margin-right:5px;"></i>submit</a>
  </div>';

    }

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

<script>
$(document).ready(function() {
    var table = $("#dataTable").DataTable({
        "bDestroy": true,
        "searching": false,
        "paging": false,
        "autoWidth": true,
        info: false



    });


});
</script>

<div class="modal fade" id="customerModal23" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">

                <h5 class="modal-title" id="exampleModalLabel">UPLOAD RESULT</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <div id='ajaxorg'>

                    <form role="form" method="post" action="resultfile.php" enctype='multipart/form-data' id='csvsub'>
                        <div class="row">
                            <div class="file-loading col-sm-6" style="margin-top:5px">
                                <label class="btn btn-primary "><i class="fas fa-info-circle"
                                        style="margin-right:5px"></i>upload result
                                    for</label>
                                <div class="row" style="margin-left:2%">
                                    <input type='text' name="courseID" value="<?php echo $id ?>" readonly>

                                </div>
                            </div>

                            <div class="file-loading col-sm-6" style="margin-top:10px">
                                <label for="csvfl" class="btn btn-primary "><i class="fas fa-upload"
                                        style="margin-right:5px"></i>Attach CSV
                                    File</label>
                                <div class="row" style="margin-left:10%">
                                    <label class="text-danger" id='csvfl2'> NO File
                                        Chosen</label>
                                </div>
                                <input type='file' id='csvfl' name='file' accept=".csv" style="visibility:hidden"
                                    required>


                            </div>

                        </div>


                        <hr>
                        <div class="row">
                            <button type="submit" name="import" class="btn btn-success" style="margin-left:3px"><i
                                    class="fa fa-check fa-fw"></i>Save</button>
                            <button class="btn btn-secondary" type="button" data-dismiss="modal"
                                style="margin-left:3px">Cancel</button>
                    </form>
                    <button class="btn btn-danger" onclick="cleare();" style="margin-left:3px"><i
                            class="fa fa-times fa-fw"></i>Reset</button>
                </div>
            </div>

        </div>
    </div>
</div>
<script src="../js/student2.js"></script>
<?php
if ($mda == 1) {?>
<script>
function caller() {
    $('#customerModal23').modal('show');
    //$('#customerModal2').modal('toggle');
    //$('#customerModalq').modal();
}
caller();
</script>
<?php }?>