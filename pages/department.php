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
?>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h4 class="m-2 font-weight-bold text-primary">Department&nbsp;<a href="#" data-toggle="modal"
                data-target="#aModal" type="button" class="btn btn-primary bg-gradient-primary"
                style="border-radius: 0px;"><i class="fas fa-fw fa-plus"></i></a></h4>

    </div>
    <div class="card-body">
        <div class="table-responsive" style="font-size:14px">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th style="font-size:14px">Department ID</th>
                        <th style="font-size:14px">Department Name</th>
                        <th style="font-size:14px">Action</th>
                    </tr>
                </thead>
                <tbody>

                    <?php
$query = 'select * from department';
$result = mysqli_query($db, $query) or die(mysqli_error($db));

while ($row = mysqli_fetch_assoc($result)) {

    echo '<tr>';
    echo '<td style="font-size:14px">' . $row['depertmentID'] . '</td>';
    echo '<td style="font-size:14px">' . $row['dName'] . '</td>';

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

<div class="modal fade" id="aModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add Department</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" method="post" action="pro_transac.php?action=add">

                    <div class="form-group">
                        <input class="form-control" placeholder="Department  ID" name="partmentid" required>
                    </div>
                    <div class="form-group">
                        <input class="form-control" placeholder="Department Name" name="department name" required>
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