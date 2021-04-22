<?php
require '../../include/db_conn.php';
page_protect();
$etid=$_GET['etid'];
$pid=$_GET['pid'];
$uid=$_GET['id'];



					$sql = "Select * from users u INNER JOIN enrolls_to e ON u.userid=e.uid INNER JOIN plan p where p.pid=e.pid and userid='".$uid."' and e.et_id='".$etid."'";
					$res=mysqli_query($con, $sql);
					 if($res){
						      	$row=mysqli_fetch_array($res,MYSQLI_ASSOC);
				
						      }
				
					

?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Star Gym</title>
<style>


 #space
{
line-height:0.5cm;
}
</style>
        <script>function myFunction()
	{
		var prt=document.getElementById("print");
		var WinPrint=window.open('','','left=0,top=0,width=800,height=900,tollbar=0,scrollbars=0,status=0');
		WinPrint.document.write(prt.innerHTML);
		WinPrint.document.close();
		WinPrint.focus();
		WinPrint.print();
		WinPrint.close();
		setPageHeight("297mm");
		setPageWidth("210mm");
		setHtmlZoom(100);
		//window.location.replace("index.php?query=");
	}
		</script>
</head>

<body>
<br><input type="button" class="a1-btn a1-green" value="PRINT INVOICE" onclick="myFunction()">
 <div id=print>
					
	
<h1 align = "center">PAYMENT INVOICE</h1>							
<table id =space width="760" height="397" border="0" align="center">
  <tr>
    <td width="222" height="198"><img src="logo1.png" width="114" height="115"  alt=""/></td>
    <td width="317"><p><strong>Star Gym</strong></p>
      <p>DHRUV VARSHNEY,</p>
      <p>AKHIL SINGHAL</p></td>
    <td height="198"><p>Serial No : <?php echo $row['et_id'] ?></p>
      <p>&nbsp;</p>
      <p>Date : <?php echo $row['paid_date']?></p></td>
    </tr>
   
  <tr>
    <td height="118" colspan="3"><p>Received with thanks from : <?php echo $row['username']?></p>
      <p>A sum of Rupees : <?php echo $row['amount']?></p>
      <p>On account of Membership plan: <?php echo $row['planName']?></p></td>
    </tr>
  
  <tr>
    <td height="73" colspan="2"><p>&nbsp;</p></td>
    <td width="207"><p>&nbsp;</p>
      <p>Signature</p></td>
  </tr>
</table>
<p align = "center">For more information visit our website www.stargym.com . For any queries and complaints contact at 8768890990 or drop a mail at admin@stargym.com</p>
<p align = "center">Thank You for Being a part of Star gym Family </p>
<h4 align = "Center"> For Contact:</h4>
<p align  = "Center">0129-224092 : Star Gym office </p>

</div>
</body>
</html>