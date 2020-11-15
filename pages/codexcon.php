<?php
// Database configuration
$dbHost = "localhost";
$dbUsername = "remote";
$dbPassword = "123456";
$dbName = "codexworld";

// Create database connection
$db = new mysqli($dbHost, $dbUsername, $dbPassword, $dbName);

// Check connection
if ($db->connect_error) {
    die("Connection failed: " . $db->connect_error);
}?>

<form action="codexcon.php" method="post" enctype="multipart/form-data">
    <label>Select Image File:</label>
    <input type="file" name="image">
    <input type="submit" name="submit" value="Upload">
</form>


<?php
// Include the database configuration file

// If file upload form is submitted
$status = $statusMsg = '';
if (isset($_POST["submit"])) {
    $status = 'error';
    if (!empty($_FILES["image"]["name"])) {
        // Get file info
        $fileName = basename($_FILES["image"]["name"]);
        $fileType = pathinfo($fileName, PATHINFO_EXTENSION);

        // Allow certain file formats
        $allowTypes = array('jpg', 'png', 'jpeg', 'gif');
        if (in_array($fileType, $allowTypes)) {
            $image = $_FILES['image']['tmp_name'];
            $imgContent = addslashes(file_get_contents($image));

            // Insert image content into database
            $insert = $db->query("INSERT into images (image, uploaded) VALUES ('$imgContent', NOW())");

            if ($insert) {
                $status = 'success';
                $statusMsg = "File uploaded successfully.";
            } else {
                $statusMsg = "File upload failed, please try again.";
            }
        } else {
            $statusMsg = 'Sorry, only JPG, JPEG, PNG, & GIF files are allowed to upload.';
        }
    } else {
        $statusMsg = 'Please select an image file to upload.';
    }
}

// Display status message
echo $statusMsg;
?>

<?php

// Get image data from database
$result = $db->query("SELECT image FROM images ORDER BY uploaded DESC");
?>

<?php if ($result->num_rows > 0) {?>
<div class="gallery">
    <?php while ($row = $result->fetch_assoc()) {?>
    <img src="data:image/jpg;charset=utf8;base64,<?php echo base64_encode($row['image']); ?>" />
    <?php }?>
</div>
<?php } else {?>
<p class="status error">Image(s) not found...</p>
<?php }?>