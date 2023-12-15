<?php
require 'config.php';
session_start();
session_destroy();
header("Location: index.php"); // Redirect to your home page or any other page after logout
exit();
?>