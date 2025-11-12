<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: text/plain');

$lat = $_POST['lat'] ?? '';
$lon = $_POST['lon'] ?? '';
$acc = $_POST['acc'] ?? '';
$ip = $_POST['ip'] ?? 'unknown';
$time = date('Y-m-d H:i:s');

if ($lat && $lon) {
    $data = "[$time] IP: $ip | Lat: $lat, Lon: $lon | Acc: ±$acc m\n";
    file_put_contents('locations.txt', $data, FILE_APPEND | LOCK_EX);
    echo $data;
} else {
    http_response_code(400);
    echo "ERROR";
}
?>
