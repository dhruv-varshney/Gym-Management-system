<?php
require '../../include/db_conn.php';
page_protect();
    
    
   $id=$_POST['wid'];
   $logid=$_POST['logid'];
   $memid=$_POST['memid'];
   $date=$_POST['date'];
   $s_time=$_POST['s_time'];
   $e_time=$_POST['e_time'];
   $remark=$_POST['remark'];
   
    
    $query1="update workoutlog set logid='".$logid."',memid='".$memid."',date='".$date."',s_time='".$s_time."',e_time='".$e_time."',remark='".$remark."' where wid=".$id."";

   if(mysqli_query($con,$query1)){
     
            echo "<html><head><script>alert('workoutlog Updated Successfully');</script></head></html>";
            echo "<meta http-equiv='refresh' content='0; url=viewworkoutlog.php'>";  
   }
   else{
    echo "<html><head><script>alert('ERROR! Update Opertaion Unsucessfull');</script></head></html>";
    echo "error".mysqli_error($con);
   }
    

?>
