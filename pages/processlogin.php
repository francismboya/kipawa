<?php

require '../includes/connection.php';
require 'session.php';
if (isset($_POST['btnlogin'])) {

    $users = trim($_POST['user']);
    $upass = trim($_POST['password']);
    //$h_upass = sha1($upass);
    $h_upass = $upass;
    if ($upass == '') {
        ?> <script type="text/javascript">
alert("Password is missing!");
window.location = "login.php";
</script>
<?php
} else {
//create some sql statement
        $sql = "select login.email,
        login.password, employee.employeeID,
        employee.fname as efname,
         employee.mname as emname,
         employee.lname as elname,
         employee.email as eemail,
         employee.gender as egender,
         employee.file as efile,
         employee.depertmentID as edepertmentID,
         employee.phoneno as ephoneno,
         status.statusID,
         status.lstate,
         status.statusName, status.email,
         student.regno, student.fname,
          student.mname, student.lname,
          student.depertmentID,
          student.programID, student.year,
          student.level,
          student.email,
          student.file,
          student.gender,
          student.state,
          student.regDate,
         student.phoneno FROM login
        LEFT JOIN employee ON login.email=employee.email LEFT JOIN status on login.email=status.email
        LEFT JOIN student ON login.email=student.email
         where login.password='" . $h_upass . "' AND login.email='" . $users . "'";
        $result = $db->query($sql);
        if ($result) {
            //get the number of results based n the sql statement
            //check the number of result, if equal to one
            //IF theres a result
            if ($result->num_rows > 0) {
                //store the result to a array and passed to variable found_user
                $found_user = mysqli_fetch_array($result);
                //fill the result to session variable
                if ($found_user['statusName'] == "student") {echo $_SESSION['ID'] = $found_user['regno'];
                    echo $_SESSION['fname'] = $found_user['fname'];
                    echo $_SESSION['mname'] = $found_user['mname'];
                    echo $_SESSION['lname'] = $found_user['lname'];
                    echo $_SESSION['depertmentID'] = $found_user['depertmentID'];
                    echo $_SESSION['programID'] = $found_user['programID'];
                    echo $_SESSION['year'] = $found_user['year'];
                    echo $_SESSION['level'] = $found_user['level'];
                    echo $_SESSION['email'] = $found_user['email'];
                    echo $_SESSION['file'] = $found_user['file'];
                    echo $_SESSION['state'] = $found_user['state'];
                    echo $_SESSION['regDate'] = $found_user['regDate'];
                    echo $_SESSION['phoneno'] = $found_user['phoneno'];
                    echo $_SESSION['StatusName'] = $found_user['statusName'];
                    echo $_SESSION['gender'] = $found_user['gender'];

                    $AAA = $_SESSION['ID'];
                    $_SESSION['users'] = "student";
                    $_SESSION['typid'] = "student.regno";
                    $_SESSION['id'] = "regno";
                } elseif ($found_user['statusName'] == "teacher" or $found_user['statusName'] == "admin"
                    or $found_user['statusName'] == "management" or $found_user['statusName'] == "registrar"
                    or $found_user['statusName'] == "principal") {
                    $_SESSION['ID'] = $found_user['employeeID'];
                    $_SESSION['fname'] = $found_user['efname'];
                    $_SESSION['mname'] = $found_user['emname'];
                    $_SESSION['lname'] = $found_user['elname'];
                    $_SESSION['depertmentID'] = $found_user['edepertmentID'];
                    $_SESSION['email'] = $found_user['eemail'];
                    $_SESSION['phoneno'] = $found_user['ephoneno'];
                    $_SESSION['statusName'] = $found_user['statusName'];
                    $_SESSION['gender'] = $found_user['egender'];
                    $_SESSION['file'] = $found_user['efile'];
                    $AAA = $_SESSION['ID'];

                    $_SESSION['users'] = "employee";
                    $_SESSION['typid'] = "employee.employeeID";
                    $_SESSION['id'] = "employeeID";
                }

                //this part is the verification if admin or user ka
                if ($_SESSION['statusName'] == 'admin') {

                    ?> <script type="text/javascript">
//then it will be redirected to index.php
alert("<?php echo $_SESSION['fname']; ?> Welcome!");
window.location = "index.php";
</script>
<?php

                } elseif ($_SESSION['statusName'] == 'teacher') {

                    ?> <script type="text/javascript">
//then it will be redirected to index.php
alert("<?php echo $_SESSION['fname']; ?> Welcome!");
window.location = "teacheractvity.php";
</script>
<?php

                } elseif ($_SESSION['statusName'] == 'teacher') {

                    ?> <script type="text/javascript">
//then it will be redirected to index.php
alert("<?php echo $_SESSION['fname']; ?> Welcome!");
window.location = "pos.php";
</script>
<?php

                } elseif ($_SESSION['statusName'] == 'student') {

                    ?> <script type="text/javascript">
//then it will be redirected to index.php
alert("<?php echo $_SESSION['fname']; ?> Welcome!");
window.location = "pos.php";
</script>
<?php

                } elseif ($_SESSION['statusName'] == 'principal') {

                    ?> <script type="text/javascript">
//then it will be redirected to index.php
alert("<?php echo $_SESSION['fname']; ?> Welcome!");
window.location = "pos.php";
</script>
<?php

                } elseif ($_SESSION['statusName'] == 'registrar') {

                    ?> <script type="text/javascript">
//then it will be redirected to index.php
alert("<?php echo $_SESSION['fname']; ?> Welcome!");
window.location = "pos.php";
</script>
<?php

                }
            } else {
                //IF theres no result
                ?>
<script type="text/javascript">
alert("Username or Password Not Registered! Contact Your administrator.");
window.location = "index.php";
</script>
<?php

            }

        } else {
            # code...
            echo "Error: " . $sql . "<br>" . $db->error;
        }

    }
}
$db->close();
?>