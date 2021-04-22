<?php
require '../../include/db_conn.php';
page_protect();
    
    
   $uid=$_POST['uid'];
   $uname=$_POST['uname'];
   $gender=$_POST['gender'];
   $mobile=$_POST['phone'];
   $email=$_POST['email'];
   $dob=$_POST['dob'];
   $jdate=$_POST['jdate'];
   $stname=$_POST['stname'];
   $state=$_POST['state'];
   $city=$_POST['city'];
   $zipcode=$_POST['zipcode'];
   $Group_name=$_POST['Group_name'];
   $trainer_id=$_POST['trainer_id'];
   $trainer_name=$_POST['trainer_name'];
   $contact=$_POST['contact'];
   $remarks=$_POST['remarks'];
    
    $query1="update users set username='".$uname."',gender='".$gender."',mobile='".$mobile."',email='".$email."',dob='".$dob."',joining_date='".$jdate."' where userid='".$uid."'";

   if(mysqli_query($con,$query1)){
     $query2="update address set streetName='".$stname."',state='".$state."',city='".$city."',zipcode='".$zipcode."' where id='".$uid."'";
     if(mysqli_query($con,$query2)){
        $query3="update trainer_allocated set Group_name='".$Group_name."',trainer_id='".$trainer_id."',trainer_name='".$trainer_name."',contact='".$contact."',remarks='".$remarks."' where uid='".$uid."'";
        if(mysqli_query($con,$query3)){
            echo "<html><head><script>alert('Member Update Successfully');</script></head></html>";
            echo "<meta http-equiv='refresh' content='0; url=view_mem.php'>";
        }else{
             echo "<html><head><script>alert('ERROR! Update Opertaion Unsucessfull');</script></head></html>";
             echo "error".mysqli_error($con);
        }
     }else{
        echo "<html><head><script>alert('ERROR! Update Opertaion Unsucessfull');</script></head></html>";
         echo "error".mysqli_error($con);
     }
   }else{
    echo "<html><head><script>alert('ERROR! Update Opertaion Unsucessfull');</script></head></html>";
    echo "error".mysqli_error($con);
   }
    

?>
