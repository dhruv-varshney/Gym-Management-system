<?php
require '../../include/db_conn.php';
page_protect();

$msgid = $_POST['name'];
if (strlen($msgid) > 0) {
    mysqli_query($con, "DELETE FROM workoutlog WHERE wid='$msgid'");
    echo "<html><head><script>alert('workoutlog Deleted');</script></head></html>";
    echo "<meta http-equiv='refresh' content='0; url=editworkoutlog.php'>";
} else {
    echo "<html><head><script>alert('ERROR! Delete Opertaion Unsucessfull');</script></head></html>";
   echo "error".mysqli_error($con);
}

?>