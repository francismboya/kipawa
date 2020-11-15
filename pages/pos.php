  <?php
$path = '../docfile/std.pdf';
$path2 = file_get_contents($path);

?>


  <object name="name" data="data:application/pdf;base64,<?php echo base64_encode($path2) ?>" type="application/pdf"
      style="height:100%; width:50%; margin-right:25%;  margin-left:25%;" standby="loading"></object>