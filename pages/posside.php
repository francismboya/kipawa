<?php

# Grab the data from the database
$query = "SELECT `year`, `sales`, `expenses` FROM `my_awesome_table`";
$mysqli_result = $mysqli->query($query);
$data = array();

while (($row = $mysqli_result->fetch_assoc()) !== null) {
    $data[] = $row;
}

# our converstion function given above.
function convertDataToChartForm($data)
{
    $newData = array();
    $firstLine = true;

    foreach ($data as $dataRow) {
        if ($firstLine) {
            $newData[] = array_keys($dataRow);
            $firstLine = false;
        }

        $newData[] = array_values($dataRow);
    }

    return $newData;
}

?>


<html>

<head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    google.charts.load('current', {
        'packages': ['corechart']
    });
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
        var data = google.visualization.arrayToDataTable((<?=json_encode(convertDataToChartForm($data));?>));

        var options = {
            title: 'Company Performance',
            curveType: 'function',
            legend: {
                position: 'bottom'
            }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
    }
    </script>
</head>

<body>
    <div id="curve_chart" style="width: 900px; height: 500px"></div>
</body>

</html>
</code></pre>

</body>

</html>



<?php

function time_ago_in_php($timestamp)
{

    date_default_timezone_set("Asia/Kolkata");
    $time_ago = strtotime($timestamp);
    $current_time = time();
    $time_difference = $current_time - $time_ago;
    $seconds = $time_difference;

    $minutes = round($seconds / 60); // value 60 is seconds
    $hours = round($seconds / 3600); //value 3600 is 60 minutes * 60 sec
    $days = round($seconds / 86400); //86400 = 24 * 60 * 60;
    $weeks = round($seconds / 604800); // 7*24*60*60;
    $months = round($seconds / 2629440); //((365+365+365+365+366)/5/12)*24*60*60
    $years = round($seconds / 31553280); //(365+365+365+365+366)/5 * 24 * 60 * 60

    if ($seconds <= 60) {return "Just Now";} else if ($minutes <= 60) {if ($minutes == 1) {return "one minute ago";} else {return "$minutes minutes ago";}} else if ($hours <= 24) {if ($hours == 1) {return "an hour ago";} else {
        return "$hours hrs ago";}} else if ($days <= 7) {if ($days == 1) {return "yesterday";} else {
        return "$days days ago";}} else if ($weeks <= 4.3) {if ($weeks == 1) {return "a week ago";} else {
        return "$weeks weeks ago";}} else if ($months <= 12) {if ($months == 1) {return "a month ago";} else {
        return "$months months ago";}} else {if ($years == 1) {return "one year ago";} else {return "$years years ago"
        ;}}}
?>
echo time_ago_in_php(‘2017-06-16 10:57:03’);