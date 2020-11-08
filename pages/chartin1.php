<?php
if (!$sock = @fsockopen('www.google.com', 80)) {
    echo 'Not Connected';
} else {
    echo 'Connected';
}
?>
<div id='result'>

</div>
<script src="../vendor/jquery/jquery.min.js"></script>
<script>
setInterval(function() {
    $.get("course.php", function(data) {
        //Write data to div
        $("#result").html(data);
    });
}, 5000);
</script>