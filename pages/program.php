<head>
    <meta name="viewport" content="width=device-width, initial-scale=0.6 user-scalable=no">
</head>
<?php
include '../includes/connection.php';
include '../includes/sidebar.php';
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
$sqlforjob = "SELECT DISTINCT depertmentID, dName
FROM department where depertmentID !='MNG'order by depertmentID asc";
$result = mysqli_query($db, $sqlforjob) or die("Bad SQL: $sqlforjob");

$job3 = "<select class='form-control' name='depertmentID' required>
<option value='' disabled selected hidden>Select Department</option>";
while ($row = mysqli_fetch_assoc($result)) {
    $job3 .= "<option value ='" . $row['depertmentID'] . "'>" . $row['dName'] . "</option>";
}

$job3 .= "</select>";

?>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h4 class="m-2 font-weight-bold text-primary">Program&nbsp;<a href="#" data-toggle="modal"
                data-target="#asModal" type="button" class="btn btn-primary bg-gradient-primary"
                style="border-radius: 0px;"><i class="fas fa-fw fa-plus"></i></a></h4>

    </div>
    <div class="card-body">
        <div class="table-responsive" style="font-size:14px">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th style="font-size:14px">Program ID</th>
                        <th style="font-size:14px">Program Name</th>
                        <th style="font-size:14px">Duration</th>
                        <th style="font-size:14px">Department</th>
                        <th style="font-size:14px">Level</th>
                        <th style="font-size:14px">Action</th>
                    </tr>
                </thead>
                <tbody>

                    <?php
$query = 'select programID, pName, durationINYear, depertmentID, level
 from program';
$result = mysqli_query($db, $query) or die(mysqli_error($db));

while ($row = mysqli_fetch_assoc($result)) {

    echo '<tr>';
    echo '<td style="font-size:14px">' . $row['programID'] . '</td>';
    echo '<td style="font-size:14px">' . $row['pName'] . '</td>';
    echo '<td style="font-size:14px">' . $row['durationINYear'] . ' Year </td>';
    echo '<td style="font-size:14px">' . $row['depertmentID'] . '</td>';
    echo '<td style="font-size:14px">' . $row['level'] . '</td>';

    echo '<td align="right" style="font-size:14px">
                              <a type="button" class="btn btn-primary bg-gradient-primary" href="inv_searchfrm.php?action=edit & id=' . $row['depertmentID'] . '"><i class="fas fa-fw fa-th-list"></i> View</a>
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

<div class="modal fade" id="asModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add Program</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" method="post" action="programadd.php?action=add" enctype="multipart/form-data">

                    <div class="form-group">
                        <input class="form-control" placeholder="Program ID" name="programID" required>
                    </div>
                    <div class="form-group">
                        <input class="form-control" placeholder="Program Name" name="pName" required>
                    </div>

                    <div class="form-group">
                        <select class='form-control' name='durationINYear' required>
                            <option value="" disabled selected hidden>Program Duration</option>
                            <option value="1">1 Year</option>
                            <option value="2">2 Year</option>
                            <option value="3">3 year</option>

                        </select>
                    </div>
                    <div class='form-group'>
                        <?php
echo $job3;
?>
                    </div>


                    <div class="form-group">
                        <select class='form-control' name='level' required>
                            <option value="" disabled selected hidden>Level</option>
                            <option value="4">NTA level 4</option>
                            <option value="5"> NTA level 5</option>
                            <option value="6">NTA level 6</option>

                        </select>
                    </div>
                    <hr>
                    <button type="submit" class="btn btn-success" name="save"><i
                            class="fa fa-check fa-fw"></i>Save</button>
                    <button type="reset" class="btn btn-danger"><i class="fa fa-times fa-fw"></i>Reset</button>
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                </form>
            </div>
        </div>
    </div>
</div>
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