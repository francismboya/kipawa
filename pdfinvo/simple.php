<?php
require __DIR__.'/vendor/autoload.php';

use Spipu\Html2Pdf\Html2Pdf;

$html2pdf = new Html2Pdf();
$html2pdf->writeHTML('<h1>HelloWorld</h1>This is my first test');
$html2pdf->Output('/opt/lampp/htdocs/php/kipawa/pdfinvo/m.pdf', 'F');
//$html2pdf->output('example_006.pdf', 'I');
?>
