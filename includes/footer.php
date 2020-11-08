<head>
    <meta name="viewport" content="width=device-width, initial-scale=0.6 user-scalable=no">
</head>
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<!-- Footer -->
<footer class="sticky-footer bg-white">
    <div class="container my-auto">
        <div class="copyright text-center my-auto">
            <span>Copyright © VETA Kipawa SRM <?php echo " " . date("Y"); ?>
            </span>
        </div>
    </div>
</footer>
<!-- End of Footer -->

</div>
<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body"><?php echo $_SESSION['fname']; ?> are you sure do you want to logout?</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="logout.php">Logout</a>
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
<script src='../alertcss/alert.js'></script>
<script src='../alertcss/notify.min.js'></script>
<script src="../js/jx.js"></script>
<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/core.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/md5.js"></script>-->
<script src="../crypto-js/core.js"></script>
<script src="../crypto-js/md5.js"></script>
<script src="../vendor/tbasset/newa/Buttons-1.6.5/js/dataTables.buttons.min.js"></script>
<script src="../vendor/tbasset/newa/Buttons-1.6.5/js/buttons.print.min.js"></script>
<script src="../vendor/tbasset/newa/Buttons-1.6.5/js/buttons.flash.min.js"></script>
<script src="../vendor/tbasset/newa/JSZip-2.5.0/jszip.min.js"></script>
<script src="../vendor/tbasset/newa/pdfmake-0.1.36/pdfmake.min.js"></script>
<script src="../vendor/tbasset/newa/pdfmake-0.1.36/vfs_fonts.js"></script>
<script src="../vendor/tbasset/newa/Buttons-1.6.5/js/buttons.html5.min.js"></script>
<script src="../vendor/tbasset/newa/Buttons-1.6.5/js/buttons.print.min.js"></script>
<script src="../vendor/tbasset/newa/Buttons-1.6.5/js/buttons.colVis.min.js"></script>





<!-- PROFILE OVERLAY NA MODAL -->
<div id="overlay" onclick="off()">
    <div id="text">I'm <?php echo $_SESSION['fname'] . ' ' . $_SESSION['lname']; ?><BR>
        From <?php echo $_SESSION['depertmentID'] . ' ' . $_SESSION['email']; ?></div>
</div>
<script>
function on() {
    document.getElementById("overlay").style.display = "block";
}

function off() {
    document.getElementById("overlay").style.display = "none";
}

//used in pos sa number only na textfields
function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode != 46 && charCode > 31 &&
        (charCode < 48 || charCode > 57))
        return false;
    return true;
}
//end of used in pos sa number only na textfields
</script>

</body>

</html>

<?php
include 'modal.php';
// JOB SELECT OPTION TAB /////////////////
//$sql = "SELECT DISTINCT statusName, email FROM status";
//$result = mysqli_query($db, $sql) or die ("Bad SQL: $sql");

//$opt = "<select class='form-control' name='type'>";
// while ($row = mysqli_fetch_assoc($result)) {
//   $opt .= "<option value='".$row['email']."'>".$row['statusName']."</option>";
//}
////////////////////////////////////

///$opt .= "</select>";

///$query = "SELECT ID, e.FIRST_NAME, e.LAST_NAME, e.GENDER, USERNAME, PASSWORD, e.EMAIL, PHONE_NUMBER, j.JOB_TITLE, e.HIRED_DATE, t.TYPE, l.PROVINCE, l.CITY
//FROM users u
//join employee e on u.EMPLOYEE_ID = e.EMPLOYEE_ID
//join job j on e.JOB_ID=j.JOB_ID
//join location l on e.LOCATION_ID=l.LOCATION_ID
//join type t on u.TYPE_ID=t.TYPE_ID
// WHERE ID =".$_SESSION['MEMBER_ID'];
// $result = mysqli_query($db, $query) or die(mysqli_error($db));
//   while($row = mysqli_fetch_array($result))
// {
//     $zz= $row['ID'];
//  $a= $row['FIRST_NAME'];
//   $b=$row['LAST_NAME'];
//  $c=$row['GENDER'];
//  $d=$row['USERNAME'];
//  $e=$row['PASSWORD'];
//  $f=$row['EMAIL'];
//  $g=$row['PHONE_NUMBER'];
// $h=$row['JOB_TITLE'];
//    $i=$row['HIRED_DATE'];
// $j=$row['PROVINCE'];
// $k=$row['CITY'];
//$l=$row['TYPE'];
// }
?>

<!-- User Edit Info Modal-->
<div class="modal fade" id="settingsModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Edit User Info</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" method="post" action="settings_edit.php">
                    <input type="hidden" name="id" value="<?php echo $zz; ?>" />

                    <div class="form-group row text-left text-primary">
                        <div class="col-sm-3" style="padding-top: 5px;">
                            First Name:
                        </div>
                        <div class="col-sm-9">
                            <input class="form-control" placeholder="First Name" name="firstname"
                                value="<?php echo $a; ?>" required>
                        </div>
                    </div>
                    <div class="form-group row text-left text-primary">
                        <div class="col-sm-3" style="padding-top: 5px;">
                            Last Name:
                        </div>
                        <div class="col-sm-9">
                            <input class="form-control" placeholder="Last Name" name="lastname"
                                value="<?php echo $b; ?>" required>
                        </div>
                    </div>
                    <div class="form-group row text-left text-primary">
                        <div class="col-sm-3" style="padding-top: 5px;">
                            Gender:
                        </div>
                        <div class="col-sm-9">
                            <select class='form-control' name='gender' required>
                                <option value="" disabled selected hidden>Select Gender</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row text-left text-primary">
                        <div class="col-sm-3" style="padding-top: 5px;">
                            Username:
                        </div>
                        <div class="col-sm-9">
                            <input class="form-control" placeholder="Username" name="username" value="<?php echo $d; ?>"
                                required>
                        </div>
                    </div>
                    <div class="form-group row text-left text-primary">
                        <div class="col-sm-3" style="padding-top: 5px;">
                            Password:
                        </div>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" placeholder="Password" name="password" value=""
                                required>
                        </div>
                    </div>
                    <div class="form-group row text-left text-primary">
                        <div class="col-sm-3" style="padding-top: 5px;">
                            Email:
                        </div>
                        <div class="col-sm-9">
                            <input class="form-control" placeholder="Email" name="email" value="<?php echo $f; ?>"
                                required>
                        </div>
                    </div>
                    <div class="form-group row text-left text-primary">
                        <div class="col-sm-3" style="padding-top: 5px;">
                            Contact #:
                        </div>
                        <div class="col-sm-9">
                            <input class="form-control" placeholder="Contact #" name="phone" value="<?php echo $g; ?>"
                                required>
                        </div>
                    </div>
                    <div class="form-group row text-left text-primary">
                        <div class="col-sm-3" style="padding-top: 5px;">
                            Role:
                        </div>
                        <div class="col-sm-9">
                            <input class="form-control" placeholder="Role" name="role" value="<?php echo $h; ?>"
                                readonly>
                        </div>
                    </div>
                    <div class="form-group row text-left text-primary">
                        <div class="col-sm-3" style="padding-top: 5px;">
                            Hired Date:
                        </div>
                        <div class="col-sm-9">
                            <input class="form-control" placeholder="Hired Date" name="hireddate"
                                value="<?php echo $i; ?>" required>
                        </div>
                    </div>
                    <div class="form-group row text-left text-primary">
                        <div class="col-sm-3" style="padding-top: 5px;">
                            Province:
                        </div>
                        <div class="col-sm-9">
                            <input class="form-control" placeholder="Province" name="province" value="<?php echo $j; ?>"
                                required>
                        </div>
                    </div>
                    <div class="form-group row text-left text-primary">
                        <div class="col-sm-3" style="padding-top: 5px;">
                            City / Municipality:
                        </div>
                        <div class="col-sm-9">
                            <input class="form-control" placeholder="City / Municipality" name="city"
                                value="<?php echo $k; ?>" required>
                        </div>
                    </div>
                    <div class="form-group row text-left text-primary">
                        <div class="col-sm-3" style="padding-top: 5px;">
                            Account Type:
                        </div>
                        <div class="col-sm-9">
                            <input class="form-control" placeholder="Account Type" name="type" value="<?php echo $l; ?>"
                                readonly>
                        </div>
                    </div>
                    <hr>
                    <button type="submit" class="btn btn-success"><i class="fa fa-check fa-fw"></i>Save</button>
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
document.getElementById("clim2").onclick = function(e) {
    //e = e || window.event;
    e.preventDefault();
    var loc = window.location.href + "<?php echo $_SESSION['fname'] ?>"
    var passhash = CryptoJS.MD5(loc).toString();
    location.href = "index.php?" + passhash;
}

document.getElementById("clim3").onclick = function(e) {
    // e = e || window.event;
    e.preventDefault();
    var loc = window.location.href + "<?php echo $_SESSION['fname'] ?>"
    var passhash = CryptoJS.MD5(loc).toString();
    location.href = "management.php?" + passhash;
}

document.getElementById("clim4").onclick = function(e) {
    // e = e || window.event;
    e.preventDefault();
    var loc = window.location.href + "<?php echo $_SESSION['fname'] ?>"
    var passhash = CryptoJS.MD5(loc).toString();
    location.href = "teacher.php?" + passhash;
}
document.getElementById("clim5").onclick = function(e) {
    //e = e || window.event;
    e.preventDefault();
    var loc = window.location.href + "<?php echo $_SESSION['fname'] ?>"
    var passhash = CryptoJS.MD5(loc).toString();
    location.href = "student.php?" + passhash;
}
document.getElementById("clim6").onclick = function(e) {
    // e = e || window.event;
    e.preventDefault();
    var loc = window.location.href + "<?php echo $_SESSION['fname'] ?>"
    var passhash = CryptoJS.MD5(loc).toString();
    location.href = "department.php?" + passhash;
}
document.getElementById("clim7").onclick = function(e) {
    // e = e || window.event;
    e.preventDefault();
    var loc = window.location.href + "<?php echo $_SESSION['fname'] ?>"
    var passhash = CryptoJS.MD5(loc).toString();
    location.href = "course.php?" + passhash;
}

document.getElementById("clim8").onclick = function(e) {
    //  e = e || window.event;
    e.preventDefault();
    var loc = window.location.href + "<?php echo $_SESSION['fname'] ?>"
    var passhash = CryptoJS.MD5(loc).toString();
    location.href = "saccount.php?" + passhash;
}

document.getElementById("clim9").onclick = function(e) {
    // e = e || window.event;
    e.preventDefault();
    var loc = window.location.href + "<?php echo $_SESSION['fname'] ?>"
    var passhash = CryptoJS.MD5(loc).toString();
    location.href = "adresult.php?" + passhash;
}
</script>