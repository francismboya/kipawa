<!-- Employee select and script -->

<head>
    <!--  <meta name="viewport" content="width=device-width, initial-scale=0.6 user-scalable=no">-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <link rel="stylesheet" href="../css/style.css">
    <link rel='stylesheet' href='../vendor/bootstrap/css/bootstrap.min.css'>
</head>
<?php

$sqlforjob = "SELECT DISTINCT statusName, statusID FROM status order by statusID asc";
$result = mysqli_query($db, $sqlforjob) or die("Bad SQL: $sqlforjob");

$job = "<select class='form-control' name='jobs' required>
        <option value='' disabled selected hidden>Select Job</option>";
while ($row = mysqli_fetch_assoc($result)) {
    $job .= "<option value='" . $row['statusID'] . "'>" . $row['statusName'] . "</option>";
}
$job .= "</select>";

$sqlforjob = "SELECT DISTINCT depertmentID, dName
FROM department order by depertmentID asc";
$result = mysqli_query($db, $sqlforjob) or die("Bad SQL: $sqlforjob");

$job2 = "<select class='form-control col-sm-12' name='jobs' required>
        <option value='' disabled selected hidden>Select Department</option>";
while ($row = mysqli_fetch_assoc($result)) {
    $job2 .= "<option value='" . $row['depertmentID'] . "'>" . $row['dName'] . "</option>";
}

$job2 .= "</select>";

$sqldipc = "SELECT DISTINCT dName, depertmentID FROM department order by depertmentID asc";
$result = mysqli_query($db, $sqldipc) or die("Bad SQL: $sqldipc");

$dipc = "<select class='form-control' name='coursedip' required>
        <option value='' disabled selected hidden>Select department</option>";
while ($row = mysqli_fetch_assoc($result)) {
    $dipc .= "<option value='" . $row['depertmentID'] . "'>" . $row['dName'] . "</option>";
}
$dipc .= "</select>";

$sqlprc = "SELECT DISTINCT pName, programID FROM program order by programID asc";
$result = mysqli_query($db, $sqlprc) or die("Bad SQL: $sqldprc");

$prc = "<select class='form-control' name='coursepr' required>
        <option value='' disabled selected hidden>Select department</option>";
while ($row = mysqli_fetch_assoc($result)) {
    $prc .= "<option value='" . $row['programID'] . "'>" . $row['pName'] . "</option>";
}
$prc .= "</select>";

$sqlemp = "SELECT DISTINCT fname, mname, lname, employeeID FROM employee order by employeeID asc";
$result = mysqli_query($db, $sqlemp) or die("Bad SQL: $sqlemp");

$emp = "<select class='form-control col-sm-8' name='coursepr' required>
        <option value='' disabled selected hidden>Select instructor</option>";
while ($row = mysqli_fetch_assoc($result)) {
    $emp .= "<option value='" . $row['employeeID'] . "'>" . $row['fname'] . " " . $row['lname'] . "" . "</option>";

}

$emp .= "</select>";

?>
<script>
window.onload = function() {

    // ---------------
    // basic usage
    // ---------------
    var $ = new City();
    $.showProvinces("#province");
    $.showCities("#city");

    // ------------------
    // additional methods
    // -------------------

    // will return all provinces
    console.log($.getProvinces());

    // will return all cities
    console.log($.getAllCities());

    // will return all cities under specific province (e.g Batangas)
    console.log($.getCities("Batangas"));

}
</script>
<!-- end of Employee select and script -->

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
<!-- Customer Modal-->
<div class="modal fade" id="customerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add New Management Personel</h5>

                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>

            </div>
            <div class="modal-body">


                <form role="form" method="post" action="cust_transac.php?action=add" class="form-horizontal">
                    <!--image-->
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-sm-6 imgUp">
                                <div class="imagePreview"></div>
                                <label class="btn btn-primary col-sm-12">
                                    Upload profile photo<input type="file" class="uploadFile img" value="Upload Photo"
                                        style="width:0px;height: 0px;overflow: hidden;">
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
                            <input class="form-control" placeholder="Middle Name" name="firstname">

                        </div>

                        <div class="form-group col-sm-4">
                            <input class="form-control " placeholder="Last Name" name="lastname" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-sm-4">
                            <input class="form-control" placeholder="Email" name="email" required>
                        </div>
                        <div class="form-group col-sm-4">
                            <input class="form-control" placeholder="Employee ID" name="employeeid" required>
                        </div>
                        <div class="form-group col-sm-4">
                            <input class="form-control" placeholder="Phone Number" name="phonenumber" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <select class='form-control' name='position' required>
                                <option value="" disabled selected hidden>Select Position</option>
                                <option value="Male">Registrar</option>
                                <option value="Female">Principal</option>
                                <option value="Female">Admin</option>

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
                            <div class="form-group col-sm-12">
                                <?php echo $job2; ?>
                            </div>
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
<!-- Customer Modal-->
<div class="modal fade" id="poscustomerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add Customer</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" method="post" action="cust_pos_trans.php?action=add">
                    <div class="form-group">
                        <input class="form-control" placeholder="First Name" name="firstname" required>
                    </div>
                    <div class="form-group">
                        <input class="form-control" placeholder="Last Name" name="lastname" required>
                    </div>
                    <div class="form-group">
                        <input class="form-control" placeholder="Phone Number" name="phonenumber" required>
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


<!-- teacher Modal-->
<div class="modal fade" id="employeeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add New Teacher</h5>

                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>

            </div>
            <div class="modal-body">


                <form role="form" method="post" action="cust_transac.php?action=add" class="form-horizontal">
                    <!--image-->
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-sm-6 imgUp">
                                <div class="imagePreview"></div>
                                <label class="btn btn-primary col-sm-12">
                                    Upload profile photo<input type="file" class="uploadFile img" value="Upload Photo"
                                        style="width:0px;height: 0px;overflow: hidden;">
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
                            <input class="form-control" placeholder="Middle Name" name="firstname">

                        </div>

                        <div class="form-group col-sm-4">
                            <input class="form-control " placeholder="Last Name" name="lastname" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-sm-4">
                            <input class="form-control" placeholder="Email" name="email" required>
                        </div>
                        <div class="form-group col-sm-4">
                            <input class="form-control" placeholder="Employee ID" name="employeeid" required>
                        </div>
                        <div class="form-group col-sm-4">
                            <input class="form-control" placeholder="Phone Number" name="phonenumber" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <select class='form-control' name='position' required>
                                <option value="" disabled selected hidden>Select Position</option>
                                <option value="Male">Registrar</option>
                                <option value="Female">Principal</option>
                                <option value="Female">Admin</option>

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
                            <div class="form-group col-sm-12">
                                <?php echo $job2; ?>
                            </div>
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

<!-- teacher Modal-->




<!-- Delete Modal-->
<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="DeleteModal"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Confirm Delete</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Are you sure do you want to delete?</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-danger btn-ok">Delete</a>
            </div>
        </div>
    </div>
</div>
<script>
$('#confirm-delete').on('show.bs.modal', function(e) {
    $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));

    $('.debug-url').html('Delete URL: <strong>' + $(this).find('.btn-ok').attr('href') + '</strong>');
});
</script>


<!-- Employee Modal-->
<div class="modal fade" id="course" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add course</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" method="post" action="emp_transac.php?action=add">
                    <div class="row">
                        <div class="form-group col-sm-5">
                            <input class="form-control " placeholder="Course code" name="courseID" required>
                        </div>
                        <div class="form-group col-sm-6">
                            <input class="form-control" placeholder="Course Name" name="cName" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-sm-5">
                            <?php echo $dipc; ?>
                        </div>
                        <div class="form-group col-sm-6">
                            <?php echo $prc; ?>

                        </div>

                    </div>
                    <div class="row">
                        <div class="form-group col-sm-12">
                            <?php echo $emp; ?>
                        </div>
                    </div>
                    <div class="row">

                        <div class="form-group col-sm-5">
                            <select class='form-control' name='level' required>
                                <option value="" disabled selected hidden>Select level</option>
                                <option value="NTA LEVEL 4">NTA LEVEL 4</option>
                                <option value="NTA LEVEL 5">NTA LEVEL 5</option>
                                <option value="NTA LEVEL 5">NTA LEVEL 5</option>
                            </select>
                        </div>

                    </div>
                    <div class="row">
                        <div class="form-group col-sm-5">
                            <select name="level" class="form-control">
                                <option value="" disabled selected hidden>Select credit</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                            </select>
                        </div>
                        <div class="form-group col-sm-5">
                            <select name="level" class="form-control">
                                <option value="" disabled selected hidden>Classification</option>
                                <option value="c">core</option>
                                <option value="f">fundamental</option>

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