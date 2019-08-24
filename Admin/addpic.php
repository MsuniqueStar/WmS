

<?php


//CONNECTING TO THE DATABASE
include "dbh.php";

//Taking the values from the page Updating Stocks...

$StockID    = $_POST['StockID'];
$pic    = $_POST['pic'];



echo $pic;

//ALL THESE VALUES NEED TO BE INSERTED INTO THE DATABASE
//THE ABOVE QUESTION MARKS MEAN PREPARED STATMENTS...
//THE ABOVE IS THE SQL QUERY
$sql = "INSERT INTO picture	VALUES('$StockID','$pic')";
//Running the sql Query
$result = mysqli_query($conn,$sql);


header("Location:Update_Stocks.php");
/*
$stmt = $conn_prepare($sql);

//BIND VARIABLES
$stmt_bind_param("sssss",$customerID,$name,$Address,$loginID,$password);

//EXECUTING THE STATMENT VARIABLE
$stmt_execute();
*/

?>
