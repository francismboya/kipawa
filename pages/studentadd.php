<?php
include '../includes/connection.php';
$users = $_SESSION['users'];
$typid = $_SESSION['typid'];
$ID = $_SESSION['id'];
$name1 = $_SESSION['fname'];
$name2 = $_SESSION['lname'];
$emp = $_SESSION['ID'];

if (isset($_POST['save'])) {
    //$name = $_POST['name'];
    $name = "eeee";
    $email = $_POST['email'];
    $image1 = $_FILES['image']['name'];
    $image_tmp = $_FILES['image']['tmp_name'];
    $address = $_POST['address'];
    $image = pathinfo($_FILES["image"]["name"], PATHINFO_EXTENSION);
    echo $name = $_POST["name"];
    echo $image1;
    move_uploaded_file($image_tmp, "images/" . $name . "." . $image);

    for ($i = 0; $i < $countfiles; $i++) {
        $filename = $_FILES['filer']['name'][$i];
        $fileinfo = @getimagesize($_FILES["filer"]["tmp_name"][$i]);
        $width = $fileinfo[0];
        $height = $fileinfo[1];
        if (($_FILES["filer"]["size"][$i] > 1000000)) {
            $response[$bc] = $filename;
            $bc++;

        } else if ($width != "225" || $height != "225") {
            $response[$bc] = $filename;
            $bc++;

        } else {

            move_uploaded_file($_FILES['filer']['tmp_name'][$i], '../stdimg/' . $filename);

        }

    }

}