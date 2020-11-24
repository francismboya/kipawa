<?php
require __DIR__.'/vendor/autoload.php';
use Spipu\Html2Pdf\Html2Pdf;
$url="html.php";
$html = file_get_contents($url);
$html1pdf = new Html2Pdf();
$html1pdf->writeHTML($html);
$html1pdf->output();
//$html2pdf->writeHTML($html, isset($_GET['vuehtml']));
?>


