<div id="rel2">

    <style>
    #rel2 {
        display: none;
    }
    </style>
    <?php
$name1 = $_SESSION['fname'];
$name2 = $_SESSION['lname'];

?>
    <div class="card  mb-4 col-md-12" style="display:block" id="poor">
        <div class="card-header py-3 bg-white">
            <h4 class="m-0 font-weight-bold text-primary">
                <span>
                    <?php
$cit = $_POST['courseID'];
echo "<span class='text-danger'>$cit</span>  Exam Result"?>

                </span>
                <span class='background-warning' style="height:60px">

                    <button class="btn btn-rounded btn-sm btn-warning m-0" style="height:35px">ADVANCED
                        VIEW
                        <input type="button" class="btn btn-danger btn-sm m-0" name="bot" id="viewer" value="OFF"
                            style="background-color:#9e9e9e; height:25px; padding:2px" onclick="expert(this)">

                        <a type="submit" class="btn btn-info btn-sm m-0" name="analysis"
                            style="height:25px; padding:2px; width:50px; color:white" href="coursework1.php?


<?php

//data to encrypt
$courseid = $_POST['courseID'];
// Store the cipher method
$ciphering = "AES-128-CTR";
// Use OpenSSl Encryption method
$iv_length = openssl_cipher_iv_length($ciphering);
$options = 0;
// Non-NULL Initialization Vector for encryption
$encryption_iv = '1234567891011121';
// Store the encryption key
$encryption_key = $_SESSION['key'];
// Use openssl_encrypt() function to encrypt the data
$encryption = openssl_encrypt($courseid, $ciphering,
    $encryption_key, $options, $encryption_iv);

//data to encrypt
$coursecoid = $_POST['coID'];
// Store the cipher method
$ciphering = "AES-128-CTR";
// Use OpenSSl Encryption method
$iv_length = openssl_cipher_iv_length($ciphering);
$options = 0;
// Non-NULL Initialization Vector for encryption
$encryption_iv = '1234567891011121';
// Store the encryption key
$encryption_key = $_SESSION['key'];
// Use openssl_encrypt() function to encrypt the data
$encryption2 = openssl_encrypt($coursecoid, $ciphering,
    $encryption_key, $options, $encryption_iv);
echo "courseID=$encryption&coID=$encryption2";
?>

                            ">
                            <span><i class='fas fa-chart-line'></i></span>
                        </a>
                    </button>




                </span>

            </h4>
        </div>

        <div class="row" id='hdtable'>
            <div class="card-body col-md-12">
                <div class="table-responsive" style="font-size:14px">
                    <table class="table table-bordered" id="dataTable2" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Student name</th>
                                <th>registration number</th>
                                <th>coursework</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <?php
$crdo = 0;
$on = 0;
if (isset($_POST['courseID']) && !empty($_POST['coID'])) {
    $on = 1;
    $query = "SELECT * from (SELECT courseID, score as scr,
result.grade, regno, coID FROM result WHERE courseID='" . $_POST['courseID'] . "'
AND coID='" . $_POST['coID'] . "') a
 JOIN (SELECT * FROM coursework WHERE courseID='" . $_POST['courseID'] . "'
AND coID='" . $_POST['coID'] . "') b
 JOIN (SELECT fname, mname, lname, courseprogram.courseID, student.regno FROM student join courseprogram
 on courseprogram.programID=student.programID AND courseprogram.level=student.level where
 courseprogram.courseID='" . $_POST['courseID'] . "')c
 ON a.regno = b.regno and a.coID = b.coID and b.courseID=c.courseID and b.regno=c.regno";
    $result = mysqli_query($db, $query) or die(mysqli_error($db));
    $crd = "select * from course where courseID='" . $_POST['courseID'] . "' ";
    $rel = mysqli_query($db, $crd) or die(mysqli_error($db));
    if (mysqli_num_rows($rel) > 0) {
        while ($row2 = mysqli_fetch_assoc($rel)) {
            $crdo = $row2['credit'];

        }
    }
    ?>
                        <tbody>
                            <?php
if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            ?>

                            <tr>
                                <td>
                                    <?php echo $row['fname'] . " " . $row['mname'] . " " . $row['lname']
            ?>
                                </td>

                                <td>
                                    <?php echo $row['regno']; ?>

                                </td>

                                <td>
                                    <?php echo $row['score']; ?>

                                </td>




                                <td>

                                    <?php echo $row['remarks']; ?>


                                </td>

                                <?php
echo '<td align="center" style="font-size:14px">
        <form method="post" action="result1.php?">
        <input type="text" name="courseID" value="' . $row['courseID'] . '" style="display:none;">
        <input type="text" name="coID" value="' . $_POST['coID'] . '" style="display:none;">
<div class="btn-group mr-2 btn-group-sm" role="group" aria-label="First group">
<button type="submit" name="addn" class="btn btn-success bg-gradient-info"><i class="fa fa-plus" style="margin-right:5px;"></i>add</button>
         <button type="submit" name="edit" class="btn btn-success bg-gradient-warning"><i class="far fa-edit" style="margin-right:5px;"></i>edit</button>
         <button type="submit" name="delete" class="btn btn-success bg-gradient-danger"><i class="far fa-trash-alt" style="margin-right:5px;"></i>delete</button>
        </div>
         </form></td>';

            ?>


                            </tr>
                            <?php }
        ?>

                            <?php

    }
    ?>


                            <?php
}

?>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>


    </div>
</div>
<script>
function expert(bot) {
    if (bot.value == "OFF") {
        bot.className = "btn btn-primary";
        $(document).ready(function() {
            var a =
                '<h2 style="text-align:center;color:black;padding-top:90px;">Registered Student Kipawa ICT<h2>';
            var b = '<div class="hero-image"';
            var c = "style ='background-image: url";
            var d =
                '("https: //1.bp.blogspot.com/-vTxIJk9Q82I/X5lOz-6fAzI/AAAAAAAAN94/ECwlZ55kYHUhcaHRh0fPIvo4s9v2tVITACLcBGAsYHQ/s517/logo3.png");';
            var f =
                "padding-top:5%; padding-bottom:5%; background-repeat: no-repeat; background-size: cover;'>";
            var g = '</div>';
            var ids = <?php echo json_encode($hrefid); ?>;
            var vl = "<?php echo $_POST['courseID']; ?>";

            $.each(ids, function(index, value) {
                var value2 =
                    '<h2 style="text-align:center;color:black;padding-top:90px;">Course Result ' +
                    vl + '</h2>';
                var ad = b + c + d + f + value2 + g;
                var table = $(eval(value)).DataTable({
                    "bDestroy": true,
                    "dom": '<"dt-buttons"Bf><"clear">lirtp',
                    "searching": true,
                    "paging": true,
                    "autoWidth": true,
                    lengthMenu: [
                        [10, 25, 50, 100, 200, -1],
                        [10, 25, 50, 100, 200, "All"]
                    ],


                    buttons: [{
                            extend: 'print',
                            title: '',
                            text: 'print',
                            messageTop: ad,
                            className: 'btn btn-primary',
                            exportOptions: {
                                columns: ':visible',
                                stripHtml: false
                            },

                            customize: function(win) {

                                $(win.document.body)
                                    .css('font-size', '10pt')
                                    .prepend(
                                        '<img src="https://1.bp.blogspot.com/-vTxIJk9Q82I/X5lOz-6fAzI/AAAAAAAAN94/ECwlZ55kYHUhcaHRh0fPIvo4s9v2tVITACLcBGAsYHQ/s517/logo3.png"  style="pointer-events: none; cursor: default; height: 180px; left: 50%; margin-top: -90px; margin-left: -90px; padding-bottom:5%; position: absolute; top: 7%;  opacity: 1; width: 180px;" />',
                                    );

                                $(win.document.body).find('table')
                                    .addClass('compact')
                                    .css('font-size', 'inherit');



                            }

                        },

                        {
                            extend: 'colvis',
                            text: 'Column visibility',
                            className: 'btn btn-primary',
                            collectionLayout: 'fixed two-column'


                        }
                    ]
                });
            });

        });
        bot.value = "ON";
        bot.style.background = "#007bff";
    } else if (bot.value = "ON") {
        bot.value = "OFF";
        bot.style.background = "#9e9e9e";
        var ids = <?php echo json_encode($hrefid); ?>;
        // Display the array elements
        $.each(ids, function(index, value) {

            var table = $("#dataTable2").DataTable({
                "bDestroy": true,
                "searching": false,
                "paging": false,
                "autoWidth": true,

            });
        });
    }
}
</script>