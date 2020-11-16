<?php
$db = mysqli_connect('127.0.0.1', 'remote', '123456') or
die('Unable to connect. Check your connection parameters.');
mysqli_select_db($db, 'kipawa') or die(mysqli_error($db));
$runner = "SET GLOBAL max_allowed_packet=1024*1024*1024";
mysqli_query($db, $runner);
global $users;
global $typid;
global $ID;