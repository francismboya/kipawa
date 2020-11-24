<?php
// Import PHPMailer classes into the global namespace
// These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\Exception;
use PHPMailer\PHPMailer\PHPMailer;

// Load Composer's autoloader
require '../mailer/vendor/autoload.php';

// Instantiation and passing `true` enables exceptions
$mail = new PHPMailer(true);

try {
    //Server settings
    // @$mail->SMTPDebug = SMTP::DEBUG_SERVER; // Enable verbose debug output
    $mail->SMTPDebug = 0;

    @$mail->isSMTP(); // Send using SMTP
    @$mail->Host = 'smtp.gmail.com'; // Set the SMTP server to send through
    @$mail->SMTPAuth = true; // Enable SMTP authentication
    @$mail->Username = 'francismboya3@gmail.com'; // SMTP username
    @$mail->Password = '*****'; // SMTP password
    @$mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS; // Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` encouraged
    @$mail->Port = 587; // TCP port to connect to, use 465 for `PHPMailer::ENCRYPTION_SMTPS` above

    //Recipients
    @$mail->setFrom('francismboya3@gmail.com', 'Francis Mboya');
    @$mail->addAddress('francismboya3@gmail.com', 'Emmanuel Kweka'); // Add a recipient
    @$mail->addAddress('francismboya3@gmail.com'); // Name is optional
    @$mail->addReplyTo('francismboya3@gmail.com', ' for more Information');
    @$mail->addCC('francismboya3@gmail.com');
    @$mail->addBCC('francismboya3@gmail.com');

    // Attachments
    @$mail->addAttachment('backup.sql'); // Add attachments
    @$mail->addAttachment('backup.sql', 'new.jpg'); // Optional name

    // Content
    @$mail->isHTML(true); // Set email format to HTML
    @$mail->Subject = 'INVOICE';
    @$mail->Body = '<table>  <tr><th>ammount</th>
    <th>cost</th>
    </tr>
    <tr><td>45</td>
    <th>10000</th>
    </tr>
    </table>';
    $mail->msgHTML(file_get_contents('loginpc.php'), __DIR__);
    @$mail->AltBody = 'you cant read';

    @$mail->send();
    echo 'Message has been sent';
} catch (Exception $e) {
    echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
}