<?php
$host="localhost";
$user="remote";
$pwd="123456";
$db="kipawa";
$conn = mysqli_connect($host,$user,$pwd,$db);
$sql = "SELECT programID, COUNT(programID) as total1 FROM student GROUP by programID";
$result = mysqli_query($conn,$sql);
$found_user = mysqli_fetch_array($result);
$data = array();
$total=array();
foreach ($result as $row) {
    # code...
    echo $data[]=$found_user['programID'];
    echo $total[]= $found_user['total1'];
}
  
 
$dataPoints = array(
	array("label"=> "ITT", "y"=> 590),
	array("label"=> "ELEC", "y"=> 261),
	array("label"=> "ELECT", "y"=> 158),
	array("label"=> "MTA", "y"=> 72),
	
);
	
?>
<!DOCTYPE HTML>
<html>
<head>  
<link rel="stylesheet" href="css/main.css">
<script>
window.onload = function () {
 
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	exportEnabled: true,
	title:{
		text: "Depertments At Veta Kipawa ICT Centre"
	},
	data: [{
		type: "bar",
		showInLegend: "false",
		legendText: "{label}",
		indexLabelFontSize: 16,
		indexLabel: "{label}",
		yValueFormatString: "NO.#,##0",
		dataPoints: <?php echo json_encode($dataPoints, JSON_NUMERIC_CHECK); ?>
	}]
});
chart.render();
 
}
</script>
</head>
<body>
<div class="chart1">
<div id="chartContainer"  style="height: 370px; width: 100%;"></div>
<script src="js/canvasjs.min.js"></script>
</div>
</body>
</html> 