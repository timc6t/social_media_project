<?php
// Database configuration, fill up with my own db host user
define('DB_SERVER','localhost');
define('DB_USERNAME','timc6t');
define('DB_PASSWORD','jM6(S)HYwaFWbXb[');
define('DB_NAME','social_network');

// Mail server configuration
$link = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

if ($link === false) {
    die("ERROR: Could not connect". mysqli_connect_error());
}
?>
