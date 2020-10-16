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
        <h4 class="m-2 font-weight-bold text-primary">Course&nbsp;
            <a href="#" data-toggle="modal" data-target="#course" type="button"
                class="btn btn-primary bg-gradient-primary" style="border-radius: 0px;"><i
                    class="fas fa-fw fa-plus"></i></a>
        </h4>
    </div>
    <div class="card-body">
        <div class="table-responsive" style="font-size:14px">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th style="font-size:14px">course code</th>
                        <th style="font-size:14px">Course name</th>
                        <th style="font-size:14px">Department</th>
                        <th style="font-size:14px">Level</th>
                        <th style="font-size:14px">Credit</th>
                        <th style="font-size:14px ">classfication</th>

                        <th style="font-size:12px">Action</th>
                    </tr>
                </thead>
                <tbody>

                    <?php
$query = 'SELECT courseID, cName, depertmentID, level, credit, classfication FROM course
              ORDER BY courseID ASC';
$result = mysqli_query($db, $query) or die(mysqli_error($db));

while ($row = mysqli_fetch_assoc($result)) {

    echo '<tr style="font-size:14px">';
    echo '<td style="font-size:14px">' . $row['courseID'] . '</td>';
    echo '<td style="font-size:14px">' . $row['cName'] . '</td>';
    echo '<td style="font-size:14px">' . $row['depertmentID'] . '</td>';
    echo '<td style="font-size:14px">' . $row['level'] . '</td>';
    echo '<td style="font-size:14px">' . $row['credit'] . '</td>';
    echo '<td style="font-size:14px">' . $row['classfication'] . '</td>';

    echo '<td align="right" style="font-size:14px">
                              <a type="button" class="btn btn-primary bg-gradient-primary" href="trans_view.php?action=edit & id=' . $row['courseID'] . '"><i class="fas fa-fw fa-th-list"></i> View</a>
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