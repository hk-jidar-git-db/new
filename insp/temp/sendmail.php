<?php

rep('email');
 
require sc_url_library('sys', 'php_mailer', 'src/PHPMailer.php');
require sc_url_library('sys', 'php_mailer', 'src/Exception.php');
require sc_url_library('sys', 'php_mailer', 'src/SMTP.php');
require sc_url_library('sys', 'php_mailer', 'src/POP3.php');

// Declare variables
/**
 * variable changable 
 */
// from name
$from_nm    = $_SESSION['s']['company'];
// to email
$to         = {email_to} ;
// to name
$to_nm      = {insp_name};
// replay to email
$reply_to   = $_SESSION['s']['dep_mail'];
// replay to name
$reply_nm   = $_SESSION['s']['company'] ;
// file attached path //// if = "" it mean no attached
$pdf_path   = $_SERVER['DOCUMENT_ROOT'] . "arrival.pdf" ;
// body text
$body       = "Dear sir <br> Please find attached a PDF file. <br><br> Best regards" ;
// the email send by 
$from       = $_SESSION['s']['from_email'];


/**
 * variable rarley changing
 */
$host       = $_SESSION['s']['mail_smtp_server'];  
$usr        = $_SESSION['s']['from_email'];
$pwd        = $_SESSION['s']['email_password'];	
$con_t      = $_SESSION['s']['mail_tp_connection'];
$port       = $_SESSION['s']['mail_port'];


/*  */
$mail = new PHPMailer\PHPMailer\PHPMailer;
//$mail->SMTPDebug  = 2; 
$mail->isSMTP(); 
$mail->CharSet = 'utf-8'; 
// Set mailer to use SMTP
$mail->Host 	= $host ;
$mail->SMTPAuth = true;
$mail->Username = $usr ; 		  // User
$mail->Password = $pwd;				// Paßwort

						// Sicherheits-Einstellung
if ($con_t == 'T')
	{
		$mail->SMTPSecure = 'tls';
	}
elseif ($con_t == 'S')
	{
		$mail->SMTPSecure = 'ssl';
	}
else
	{
		$mail->SMTPSecure = '';
	}
$mail->Port = $port; 			// Port
$mail->Timeout  =   60;                  
$mail->From 	= $from;
$mail->FromName = $from_nm ;
$mail->addAddress($to,$to_nm);
$mail->AddReplyTo($reply_to, $reply_nm);               
if(!empty($pdf_path))
{
    $mail->AddAttachment($pdf_path  );      
}
// attach pdf that was saved in a folder
$mail->Subject = {subject};                  
$mail->Body = $body;
if(!$mail->Send())
{
   echo "Message could not be sent. <p>";
   echo "Mailer Error: " . $mail->ErrorInfo;
}
else
{
   echo "Message sent";
} //`the end`

 

