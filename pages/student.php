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
include '../includes/sidebar.php';
//include 'studentfile.php';
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
            <h4 class="m-2 col-sm-4 font-weight-bold text-primary">Add Student&nbsp;<a href="#" data-toggle="modal"
                    data-target="#aModal" type="button" class="btn btn-primary bg-gradient-primary"
                    style="border-radius: 0px;"><i class="fas fa-fw fa-plus"></i></a></h4>
            <h4 class="m-2 col-sm-6 font-weight-bold text-primary">Import Student Detail from csv file &nbsp;<a href="#"
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
                <h5 class="modal-title" id="exampleModalLabel">Add New student</h5>

                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>

            </div>
            <div class="modal-body">


                <form role="form" method="post" action="studentadd.php?action=add" class="form-horizontal">
                    <!--image-->
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-sm-6 imgUp">
                                <div class="imagePreview"></div>
                                <label class="btn btn-primary col-sm-12">
                                    Upload profile photo<input type="file" class="uploadFile img" value="Upload Photo"
                                        name="image" style="width:0px;height: 0px;overflow: hidden;">
                                </label>
                            </div><!-- col-2 -->
                        </div><!-- row -->
                    </div><!-- container -->
                    <!--image-->
                    <!--image-->
                    <script src="../js/script.js"></script>
                    <!--image-->
                    <div class="row">
                        <div class="form-group col-sm-4">
                            <input class="form-control " placeholder="First Name" name="firstname" required>

                        </div>
                        <div class="form-group col-sm-4">
                            <input class="form-control" placeholder="Middle Name" name="middlename">

                        </div>

                        <div class="form-group col-sm-4">
                            <input class="form-control " placeholder="Last Name" name="lastname" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <input class="form-control" placeholder="Email" name="email" required>
                        </div>

                        <div class="form-group col-sm-6">
                            <input class="form-control" placeholder="Phone Number" name="phonenumber" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <select class='form-control' name='level' required>
                                <option value="" disabled selected hidden>Select Level</option>
                                <option value="NTA4">NTA4</option>
                                <option value="NTA5">NTA5</option>
                                <option value="NTA6">NTA6</option>

                            </select>
                        </div>
                        <div class="form-group col-sm-6">
                            <select class='form-control' name='gender' required>
                                <option value="" disabled selected hidden>Select Gender</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                        </div>

                        <div class="row">
                            <div class="form-group col-sm-6">
                                <?php echo $dip; ?>
                            </div>
                            <div class="form-group col-sm-6">
                                <?php echo $pro; ?>
                            </div>

                        </div>

                        <div class="row">
                            <div class="form-group col-sm-6">
                                <input class="form-control " placeholder="Registration number" name="regno" required>

                            </div>
                            <div class="form-group col-sm-6">
                                <input placeholder="Registration Date" type="text" onfocus="(this.type='date')"
                                    onblur="(this.type='text')" id="FromDate" name="regddate" class="form-control" />
                            </div>


                        </div>
                    </div>

                    <hr>
                    <button type="submit" class="btn btn-success" name="save"><i
                            class="fa fa-check fa-fw"></i>Save</button>
                    <button type="reset" class="btn btn-danger" onclick="clear()"><i
                            class="fa fa-times fa-fw"></i>Reset</button>
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                </form>
            </div>
        </div>
    </div>
</div>








<div class="modal fade" id="abModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add CSV File</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <div id='ajaxorg'>

                    <form role="form" method="post" action="studentfile.php" enctype='multipart/form-data' id='csvsub'>
                        <div class="row">
                            <div class="file-loading col-sm-4">
                                <label for="csvfl" class="btn btn-primary "><i class="fas fa-upload"></i>Attach CSV
                                    File</label>
                                <input type='file' id='csvfl' name='file' accept=".csv" style="visibility:hidden"
                                    required>
                                <label class="text-danger" id='csvfl2'> NO File
                                    Chosen</label>

                            </div>
                            <div class="file-loading col-sm-4">
                                <label for="impng" class="btn btn-primary "><i class="fas fa-upload"></i>Upload Multiple
                                    Image
                                    File</label>
                                <input type='file' id='impng' name='filer[]' accept="image/png"
                                    style="visibility:hidden" required multiple>

                                <label class="text-danger d2" id='impng2'> NO Image
                                    Chosen</label>
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
<script src="../js/student.js"></script>

<script>
if (history.pushState) {
    var loc = window.location.href + "<?php echo $_SESSION['fname'] ?>"
    var passhash = CryptoJS.MD5(loc).toString();
    var id = "?encry#" + passhash;
    var pth = "/php/kipawa/pages/index.php"
    var newurl = window.location.protocol + "//" + window.location.host + pth + id;
    window.history.pushState("object or string", "Title", newurl);
} else {
    document.location.href = window.location.href;
}
</script>