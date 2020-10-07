<?php

session_start();
unset($_SESSION['ID']);
unset($_SESSION['fname']);
unset($_SESSION['mname']);
unset($_SESSION['lname']);
unset($_SESSION['depertmentID']);
unset($_SESSION['email']);
unset($_SESSION['phoneno']);
unset($_SESSION['statusName']);
unset($_SESSION['gender']);
unset($_SESSION['file']);
session_destroy();
?>
<script type="text/javascript">
window.location = "login.php";
</script>