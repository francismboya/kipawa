<head>
    <link rel='stylesheet' href='../vendor/datatables/dataTables.bootstrap4.mina.css'>
    <link rel='stylesheet' href='../css/animate.css'>
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
<div id='stdld'>
    <div class="card shadow mb-4">
        <div class="card-header py-3 ">

            <form action='' method='post'>
                <div class='row'>
                    <div class="form-group col-sm-3">
                        <h4 class="m-2 font-weight-bold text-primary"> Employee Account
                        </h4>
                    </div>
                    <div class="form-group col-sm-3">
                        <div class='animate'>
                            <img src='../img/click.gif' class='disabl' id="diva">
                            <img src='../img/moving.png' class='disabl' id="diva2">
                            <img src='../img/click2.gif' class='disabl' id="smallsmall">

                        </div>
                    </div>
                    <div class="form-group col-sm-5">

                        <input type='button' id='std' class="btn btn-primary bg-gradient-primary"
                            value='View student Account'>
                    </div>

                </div>
            </form>

        </div>
        <div class="card-body">
            <div class="table-responsive" style="font-size:14px">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Email</th>
                            <th>Name</th>
                            <th>Position</th>
                            <th>Option</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
$query = 'SELECT employeeID, e.email, fname, lname, s.statusName, s.lstate FROM employee e join status s on s.email=e.email';
$result = mysqli_query($db, $query) or die(mysqli_error($db));

while ($row = mysqli_fetch_assoc($result)) {
    echo '<tr>';
    echo '<td style="font-size:14px">' . $row['email'] . '</td>';
    echo '<td style="font-size:14px">' . $row['fname'] . ' ' . $row['lname'] . '</td>';
    echo '<td style="font-size:14px">' . $row['statusName'] . '</td>';
    if ($row['lstate'] == 'enabled') {echo '<td align="right"> <div class="btn-group">
                              <a type="button" class="btn btn-primary bg-gradient-primary" href="sup_searchfrm.php?action=edit & id=' . $row['email'] . '"><i class="fas fa-fw fa-list-alt"></i>Disable</a>
                            </td>';
    } else {
        echo '<td align="right" style="font-size:14px"> <div class="btn-group">
                              <a type="button" class="btn btn-primary bg-gradient-primary" href="sup_searchfrm.php?action=edit & id=' . $row['email'] . '"><i class="fas fa-fw fa-list-alt"></i>enable</a>

                           </td>';

    }

    echo '</tr> ';
}
?>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- end of mydiv-->
</div>

<!-- Customer Modal-->
<div class="modal fade" id="supplierModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add Supplier</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" method="post" action="sup_transac.php?action=add">

                    <div class="form-group">
                        <input class="form-control" placeholder="Company Name" name="companyname" required>
                    </div>
                    <div class="form-group">
                        <select class="form-control" id="province" placeholder="Province" name="province"
                            required></select>
                    </div>
                    <div class="form-group">
                        <select class="form-control" id="city" placeholder="City" name="city" required></select>
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

<?php
include '../includes/footer.php';
?>

<body>
    <script src='../js/index2.js'></script>
    <script src='../js/alert.js'></script>
    <!-- <script src='../js/index.js'></script>-->
    <script src='../vendor/bootstrap/js/bootstrapfull.js'></script>
    <script src='../vendor/bootstrap/js/bootstrapbundle.js'></script>


</body>