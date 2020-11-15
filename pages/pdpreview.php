<?php
$path = '../docfile/std.pdf';
$path2 = file_get_contents($path);

?>


<object name="name" data="data:application/pdf;base64,<?php echo base64_encode($path2) ?>" type="application/pdf"
    style="height:100%;width:100%" standby="loading"></object>

<?php
$image = '../stfimg/KICTC-STA-0005-2020.png';
$type = pathinfo($image, PATHINFO_EXTENSION);

$imgContent = (file_get_contents($image));
$base64 = 'data:image/' . $type . ';base64,' . base64_encode($imgContent);
?>

<img src='<?php echo $base64 ?>'>
<?php
?>