<?php

    $conn = mysqli_connect("localhost","root","","newark-it");
    $config = mysqli_select_db($conn,"newark-it");

    if($config)
    {
        // echo "Database Connected...";
    }

?>