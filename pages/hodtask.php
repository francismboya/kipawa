<?php
include '../includes/connection.php';
include '../includes/hsidebar.php';
?><?php
$users = $_SESSION['users'];
$typid = $_SESSION['typid'];
$ID = $_SESSION['id'];
$statas='teacher';
$department=$_SESSION['depertmentID'];

$query = "SELECT u." . $ID . ", t.statusName
                          FROM " . $users . " u
                          JOIN status t ON t.email=u.email WHERE u.email = '" . $_SESSION['email'] . "'";
$result = mysqli_query($db, $query) or die(mysqli_error($db));

while ($row = mysqli_fetch_assoc($result)) {
    $Aa = $row['statusName'];

    if ($Aa == 'User') {

        ?> <script type="text/javascript">
//then it will be redirected
alert("Restricted Page! You will be redirected to POS");
window.location = "pos.php";
</script>
<?php }

}
?>
<div class="row show-grid">
    <!-- Customer ROW -->
    <div class="col-md-3">
        <!-- Customer record -->
        <div class="col-md-12 mb-3">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-0">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Teacher in <?php echo " ".$department." " ; ?> depertment</div>
                            <div class="h6 mb-0 font-weight-bold text-gray-800">
                                <?php
$query = "SELECT COUNT(*) FROM employee join status on status.email=employee.email where status.statusName='".$statas."'";
$result = mysqli_query($db, $query) or die(mysqli_error($db));
while ($row = mysqli_fetch_array($result)) {
    echo "$row[0]". "  Teacher(s)";
}?>
<a type="button" style="border-radius: 0px; margin: auto;" href="#">
                                    <i class="fas fa-book-open"></i> View
</a> 



                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-users fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Supplier record -->
        <div class="col-md-12 mb-3">
            <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-0">
                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Student</div>
                            <div class="h6 mb-0 font-weight-bold text-gray-800">
                                <?php
$query = "SELECT COUNT(*) FROM student e join status s on e.email=s.email where s.statusName='student'";
$result = mysqli_query($db, $query) or die(mysqli_error($db));
while ($row = mysqli_fetch_array($result)) {
echo "$row[0]". "  Student(s)";
}
?> <a type="button" style="border-radius: 0px; margin: auto;" href="#">
                                    <i class="fas fa-book-open"></i> View
</a> 
 
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-users fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- Employee ROW -->
     <section class="section">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12" style="margin-top:10px">
                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Courses Under <?php echo " ".$department." " ; ?> depertment</div>
                            <div class="h6 mb-0 font-weight-bold text-gray-800">
                                <?php
                                $query = "SELECT COUNT(*) FROM employee e
                        join status s on e.email=s.email where s.statusName='registrar'";
                                $result = mysqli_query($db, $query) or die(mysqli_error($db));
                                while ($row = mysqli_fetch_array($result)) {
                                ?>
                                
                        <span class="text-center" style="font-size:20px;color:white"><?php echo "$row[0]". "  Course(s)";?></span>
                                
                            <?php}?> 
                            <a type="button" style="border-radius: 0px; margin: auto;" href="#">
                                    <i class="fas fa-book-open"></i> View
                   </a> 
 
                            </div>
                        </div>            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-users fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            </div>
        </div>

    </div>
    <!-- PRODUCTS ROW -->
    <div class="col-md-3">
        <!-- Product record -->
                </div>
            </div>
        </div>

    </div>

</div>
<?php
include '../includes/footer.php';
?>