<head>
    <meta name="viewport" content="width=device-width, initial-scale=0.6 user-scalable=no">
</head>
<?php
include '../includes/connection.php';
include '../includes/sidebar.php';
?><?php

$users = $_SESSION['users'];
$typid = $_SESSION['typid'];
$ID = $_SESSION['id'];
$name1 = $_SESSION['fname'];
$name2 = $_SESSION['lname'];
$emp = $_SESSION['ID'];
$errorfile = "../error/" . $emp . ".txt";

?>
<?php
$fp = fopen($errorfile, "r");
while (!feof($fp)) {
    $zeile = fgets($fp);
    echo $zeile;
}
?>


<?php
include '../includes/footer.php';