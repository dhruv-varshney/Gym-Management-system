<?php
	require '../../include/db_conn.php';
	page_protect();
	
		
		$rname=$_POST["rname"];
		$logid=$_POST["logid"];
		$memid=$_POST["memid"];
		$date=$_POST["date"];
	    $s_time=$_POST["s_time"];
		$e_time=$_POST["e_time"];
		$remark=$_POST["remark"];
		
		
		
		$sql="insert into workoutlog(wname,logid,memid,date,s_time,e_time,remark) values('$rname','$logid','$memid','$date','$s_time','$e_time','$remark')";
	
		$result=mysqli_query($con,$sql);
		if($result){	
		
			echo "<head><script>alert('workoutlog Added');</script></head></html>";
			echo "<meta http-equiv='refresh' content='0; url=addworkoutlog.php'>";
		}else{
			echo "<head><script>alert('workoutlog Added Failed');</script></head></html>";
			echo mysqli_error($con);
		}
	
	
?>