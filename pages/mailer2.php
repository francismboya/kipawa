<?php // open IMAP connection
$dns = "{imap.gmail.com:993/imap/ssl/novalidate-cert}INBOX";
$email = "francismboya3@gmail.com";
$password = "***";

$mbox = imap_open($dns, $email, $password);
// this will select top 10 emails
$mboxCheck = imap_check($mbox);

// get the total amount of messages
$totalMessages = $mboxCheck->Nmsgs;

// select how many messages you want to see
$showMessages = 2;

// get those messages
$result = imap_fetch_overview($mbox, ($totalMessages - $showMessages + 1) . ":" . $totalMessages);
$n = 0;
$emails = array();

// loop through returned messages, collect message numbers in same format as output of imap_search
foreach ($result as $mail) {
    $emails[$n] = $mail->msgno;
    $body = imap_fetchbody($mbox, $emails[$n], 1);
    $body = quoted_printable_decode($body);
    $body = trim(utf8_encode($body));
    echo "$mail->subject ";
    // echo "$body ";
    echo "<br>";
    $n++;

}

$n = 0;
$emails2 = array();

$emails2 = imap_search($mbox, 'UNSEEN');
foreach ($emails2 as $mail) {
    $emails2[$n] = $mail;
    $body = imap_fetchbody($mbox, $emails2[$n], 1);
    $body = quoted_printable_decode($body);
    $body = trim(utf8_encode($body));
    echo "$mail->subject ";
    //echo "$body ";
    echo "<br>";
    $n++;

}

if ($emails) {
// put the newest emails on top
    rsort($emails);
}