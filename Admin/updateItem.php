<?php include("config.php");?>
<?php
$Fname=$_POST["Fname"];
$Lname=$_POST["Lname"];
$image=$_POST["profileimg"];
$briefintro=$_POST["briefintro"];
$qualification=$_POST["qualification"];

$con=mysql_connect($dbserver,$dbusername,$dbpassword);
if (!$con) { die('Could not connect: ' . mysql_error()); }
mysql_select_db($dbname, $con);
$query=("UPDATE accounts SET firstname='".$Fname."' , lastname='".$Lname."' ,  profileimg='".$image."' ,  briefintro='".$briefintro."',    qualification='".$qualification."' WHERE id=".$_SESSION['id']);
$result = mysql_query($query);
header("Location: update-profile.php?status=3");
mysql_close($con);
?>