<?php
 
 ini_set('display_errors', 1);
 ini_set('display_startup_errors', 1);
 error_reporting(E_ALL);
 
 $userName = "system";
 $userPW = "Dev.2017";
 $hostAddr = "172.17.0.1";
 $portNum = "11521";
 $serviceName = "bec2";
 
 $db="(DESCRIPTION=
  (ADDRESS_LIST=
  (ADDRESS=(PROTOCOL=TCP)
  (HOST=" . $hostAddr . ")(PORT=".$portNum.") ) )
  (CONNECT_DATA=(SERVICE_NAME=".$serviceName.") ) )";
 
 $dbLogon = ocilogon($userName, $userPW,$db);
 
 $query = "SELECT sysdate FROM dual";
 $stmt = ociparse($dbLogon,$query);
 
 if (!OCIExecute($stmt))
 {
  $oerr = OCIError($stmt); echo "Execute Code:" . $oerr["code"];
  if ($oerr["code"]) $log = "Unable to execute Usage query.&lt;br&gt; Error:" . $oerr["message"];
 }
 
 if (ocifetchinto($stmt,$row,OCI_NUM))
 {
  print_r($row);
 }
?>