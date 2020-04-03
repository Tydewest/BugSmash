<?php

$hostname = "localhost";
$username = "BugSmash";
$password = "<YOUR_PASSWORD_GOES_HERE>";
$database = "BugReporter";

$connection = mysqli_connect($hostname, $username, $password, $database);

$FirstName = $_POST['FirstName'];
$Email = $_POST['Email'];
$Subject = $_POST['Subject'];
$Details = $_POST['Details'];
$Device = $_POST['Device'];
$OSVersion = $_POST['OSVersion'];
$AppName = $_POST['AppName'];
$AppVersion = $_POST['AppVersion'];
$BuildNumber = $_POST['BuildNumber'];
$IP = $_POST['IP'];


$sql = "INSERT INTO BugReporter (Firstname, Email, Subject, Details, Device, OSVersion, AppName, AppVersion, BuildNumber, IP)
VALUES ('$FirstName', '$Email', '$Subject', '$Details', '$Device', '$OSVersion','$AppName', '$AppVersion', '$BuildNumber', '$IP')";

if ($connection->query($sql) === TRUE) {
    echo "Success";
  }else {
    echo "Unsuccessful";
  }

mysqli_close($connection);
?>
