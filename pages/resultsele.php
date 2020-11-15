<script src="../vendor/bootstrap4/js/bootstrap.min.js"></script>
<?php
$depid = array();
$ij = 0;
$sqldep = "SELECT DISTINCT depertmentID
FROM department where depertmentID !='MNG'order by depertmentID asc";
$resultdep = mysqli_query($db, $sqldep) or die("Bad SQL: $sqldep");

while ($row = mysqli_fetch_assoc($resultdep)) {
    $depid[$ij] = $row['depertmentID'];
    $ij++;
}

?>








<!-- Tab panes -->
<div class="tab-content">
    <!-- 1ST TAB -->
    <?php
foreach ($depid as $depd) {

    echo $ada = '<div class="tab-pane fade in mt-2" id="' . $depd . '">
         <div class="row">';
    $query = 'SELECT * FROM course WHERE depertmentID="' . $depd . '" GROUP BY cName ORDER by depertmentID';
    $result = mysqli_query($db, $query);
    if ($result) {
        if (mysqli_num_rows($result) > 0) {
            while ($course = mysqli_fetch_assoc($result)) {
                ?>
    <div class="col-sm-4 col-md-4">
        <form method="post" action="adresult.php?">
            <div class="card" style="width:100%">
                <?PHP
$cid = $course['courseID'] . date("Y");
                $resultcheck = 0;
                $sql4 = "SELECT courseID, score as scr, result.grade, regno, coID
                        FROM result
                         WHERE courseID='" . $course['courseID'] . "' AND coID='" . $cid . "'";
                $result42 = mysqli_query($db, $sql4) or die(mysqli_error($db));

                if (mysqli_num_rows($result42) > 0) {
                    $resultcheck = 1;

                }

                ?>

                <div class="card-body">
                    <h2 class="card-title btn btn-primary rounded-pill" style="background-color:white; color:black;">
                        <?php echo $course['courseID']; ?>
                    </h2>
                    <p class="card-text"><?php echo $course['cName']; ?>
                    </p>
                    <div class="row">
                        <?php
if ($resultcheck == 1) {
                    ?>
                        <input type="hidden" name="coID" value="<?php echo $cid; ?>" />
                        <input type="hidden" name="courseID" value="<?php echo $course['courseID']; ?>" />
                        <button type="submit" name="viewee" class="btn btn-primary m-2">view Result</button>
                        <button type="submit" name="analytical" class="btn btn-primary m-2"> Analytical info</button>
                        <?php } else {
                    ?>
                        <a href="#" class="btn btn-secondary m-2">view Result</a>
                        <a href="#" class="btn btn-secondary m-2">Analytical info</a>
                        <?php }
                ?>

                    </div>
                </div>
            </div>
        </form>
    </div>
    <?php
}

            ?>
</div>
</div>
<?php
} else {
            echo "</div></div>";
        }
    }
}
?>




<!-- wala na di nadala sa tab pane, dalom nana di na part -->
</div>
</div>
<!-- /.panel-body -->
</div>
</div>
</div>