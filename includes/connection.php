<?php
 $db = mysqli_connect('localhost', 'remote', '123456') or
        die ('Unable to connect. Check your connection parameters.');
        mysqli_select_db($db, 'kipawa' ) or die(mysqli_error($db));
        global $users;
        global $typid;
        global $ID;
?>
