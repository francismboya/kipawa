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
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th width="19%">course code</th>
                        <th>Course name</th>
                        <th width="13%">Department</th>
                        <th width="13%">Level</th>
                        <th width="13%">Credit</th>
                        <th width="13%">classfication</th>

                        <th width="11%">Action</th>
                    </tr>
                </thead>
                <tbody>

                    <?php
$query = 'SELECT courseID, cName, depertmentID, level, credit, classfication FROM course
              ORDER BY courseID ASC';
$result = mysqli_query($db, $query) or die(mysqli_error($db));

while ($row = mysqli_fetch_assoc($result)) {

    echo '<tr>';
    echo '<td>' . $row['courseID'] . '</td>';
    echo '<td>' . $row['cName'] . '</td>';
    echo '<td>' . $row['depertmentID'] . '</td>';
    echo '<td>' . $row['level'] . '</td>';
    echo '<td>' . $row['credit'] . '</td>';
    echo '<td>' . $row['classfication'] . '</td>';

    echo '<td align="right">
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