<?php
// connection of database
$con = mysqli_connect('localhost', 'remote', '123456', 'kipawa');

$msg = '';

if (isset($_POST['import'])) {

    $filename = $_FILES["file"]["tmp_name"];

    if ($_FILES["file"]["size"] > 0) {

        $file = fopen($filename, "r");
        $row = 0;

        $regno = array();
        $fname = array();
        $mname = array();
        $lname = array();
        $depertmentID = array();
        $programID = array();
        $year = array();
        $level = array();
        $email = array();
        $file2 = array();
        $gender = array();
        $state = array();
        $regDate = array();
        $phoneno = array();
        $validity = 0;

        $i = 0;

        while (($col = fgetcsv($file, 10000, ",")) !== false) {
            $row++;
            if ($row == 1) {
                continue;
            }

            // echo'<pre>'; print_r($col);

            echo @$insert = "INSERT INTO student (regno,fname,mname,lname,
            depertmentID,programID,year,level,email,file,gender,state,regDate,phoneno)values('" . $col[0] . "','" . $col[1] . "','" . $col[2] .
                "','" . $col[3] . "','" . $col[4] . "','" . $col[5] . "','" . $col[6] . "','" . $col[7] .
                "','" . $col[8] . "','" . $col[9] . "','" . $col[10] . "','" . $col[11] . "','" . $col[12] .
                "','" . $col[13] . "')";

            mysqli_autocommit($con, false);
            if (!mysqli_query($con, $insert)) {
                @$validity = 1;
                @$regno[$i] = $col[0];
                @$fname[$i] = $col[1];
                @$mname[$i] = $col[2];
                @$lname[$i] = $col[3];
                @$depertmentID[$i] = $col[4];
                @$programID[$i] = $col[5];
                @$year[$i] = $col[6];
                @$level[$i] = $col[7];
                @$email[$i] = $col[8];
                @$file2[$i] = $col[9];
                @$gender[$i] = $col[10];
                @$state[$i] = $col[11];
                @$regDate[$i] = $col[12];
                @$phoneno[$i] = $col[13];
                $i++;
            }

        }
        if ($validity == 1) {
            $con->rollback();
            $ln = count($regno);
            for ($i = 0; $i < $ln; $i++) {
                echo " <br> error on " . $regno[$i] . " " . $fname[$i] . "<br>";

            }
            echo "insert error";
        } else {
            $con->commit();

        }

//if (!$con-> commit()) {
        // echo "Commit transaction failed";
        //exit();
        //}
        $msg = '<p style="color: green;"> CSV Data inserted successfully</p>';

    }

}