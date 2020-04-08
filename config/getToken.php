<?php

echo $_SERVER['REMOTE_ADDR'];
echo "\n";

if (!isset($_GET["study"])) exit;
// Example: http://192.168.1.121:8080/getToken.php?study=1.113654.3.13.1026

// Example: curl -X POST -H "Content-Type: application/json" -d @./test.json http://172.18.0.2:8088/v1/generate
$url = 'http://meddream-token-service:8088/v1/generate';

function getToken($url, $studyUID)
{
  // validating studyUID
  if ((strlen($studyUID) > 64) || (!preg_match("/^[0-9.]+$/", $studyUID)))
    return "";

  //Initiate cURL.
  $ch = curl_init($url);

  $jsonDataEncoded='{
   "items": [{
     "studies": {
       "study": "'.$studyUID.'",
       "storage": "Orthanc"
     }
   }]
  }';

  //print_r($jsonDataEncoded);

  //Tell cURL that we want to send a POST request.
  curl_setopt($ch, CURLOPT_POST, 1);

  //Attach our encoded JSON string to the POST fields.
  curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonDataEncoded);

  //Set the content type to application/json
  curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));

  //Execute the request
  return curl_exec($ch);
}

  $studyUID = $_GET["study"];
  $result = getToken($url, $studyUID);
  $result = substr($result, 0, strlen($result)-1);
  echo $result;
?>

