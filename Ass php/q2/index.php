<html>
<head>
</head>
<body>

<?php

$name = $address = $email= $moblie = $acc = $password = "";
$db = new SQLite3('mysqlitedb.db');
$db1 = new SQLite3('mydata.db');
$db->query("create table records(name varchar(100),email varchar(100),address varchar(100),mobile varchar(10),acc varchar(5),password varchar(20))");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $name = test_input($_POST["name"]);
  $email = test_input($_POST["email"]);
  $address = test_input($_POST["address"]);
  $mobile = test_input($_POST["mobile"]);
  $acc = test_input($_POST["acc"]);
  $password = test_input($_POST["password"]);
  //$qstr = "insert into records values ('$name', '$email', '$address', '$mobile', '$acc' , '$password')";
  //$insres = $db->query($qstr);

//$dupemail = mysql3_query("SELECT email FROM records WHERE email = $email");
 
 $sql_e = "SELECT * FROM records WHERE email='$email'";
 $res_e = $db->query($sql_e);
 $result = $res_e->fetchArray();
 if ($result) {
  	  echo "Sorry... email already taken";
  	  	  
 }
 else
 {
 		$sql_ac ="SELECT * FROM data WHERE acc='$acc' AND pass='$password'";
 		$res_ac = $db1->query($sql_ac);
 		$result1 = $res_ac->fetchArray();
 		if(!$result1)
 		{
 			echo "Invalid Account number/Password";
 		}
 		else
 		{
 			if($result1[2]<1000)
 				echo "not enough money";
 			else
 			{
 				$newbal = $result1[2]-1000;
 				$db1->query("UPDATE data SET bal='$newbal' WHERE acc='$acc' AND pass='$password'");
 				$qstr = "insert into records values ('$name', '$email', '$address', '$mobile', '$acc' , '$password')";
        $insres = $db->query($qstr);
        echo "registered";
 			}
 		}
 		
 		
 }
 
}

function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>

<h2>Registration form</h2>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" onsubmit="return Validate()" name="vform" class="bg-light">
Name: <input type="text" id="n" name="name" autocomplete="off">
<span id="name" class="text-danger font-weight-bold"></span>
<br><br>
Address: <input type="text" id="a" name="address">
<span id="add" class="text-danger font-weight-bold"></span>
<br><br>
Email: <input type="text" id="e" name="email">
<span id="email" class="text-danger font-weight-bold"></span>
<br><br>
Mobile No.: <input type="text" id="m" name="mobile">
<span id="mobile" class="text-danger font-weight-bold"></span>
<br><br>
Account No.: <input type="text" id="ac" name="acc">
<span id="acc" class="text-danger font-weight-bold"></span>
<br><br>
Password: <input type="password" id="p" name="password">
<span id="pass" class="text-danger font-weight-bold"></span>
<br><br>
<input type="submit" name="submit"  value="Register"> 
</form>
<a href="page2.php">See All registrations</a>


<script type="text/javascript">

function Validate(){

	var user= document.getElementById('n').value;
	var address= document.getElementById('a').value;
	var email= document.getElementById('e').value;
	var mobile= document.getElementById('m').value;
	var acc= document.getElementById('ac').value;
	var pass= document.getElementById('p').value;
	var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	var re = /^[A-Z' 'a-z]+$/;
	 var letterNumber = /^[0-9a-zA-Z]+$/;
	
	  if (user==""){
		document.getElementById('name').innerHTML="** Please fill name";
		return false;
		}
		if(user.length <3 || user.length>20)
		{
			document.getElementById('name').innerHTML="** name must be between 3 and 20";
			return false;
		}	
		else
		{
			document.getElementById('name').innerHTML="";
		}
		if(user.match(re))
		{
			document.getElementById('name').innerHTML="";
		}
		else
		{
			document.getElementById('name').innerHTML="** invalid name";
			return false;
		}
		
		
		
		if (address==""){
			document.getElementById('add').innerHTML="** Please fill address";
			return false;
		}
		if(address.length>100)
		{
			document.getElementById('add').innerHTML="** addess length must be less than 100";
			return false;
		}
		else
		{
			document.getElementById('add').innerHTML="";
		}
		if (email==""){
			document.getElementById('email').innerHTML="** Please fill email";
			return false;
		}
		if(!filter.test(email))
		{
			document.getElementById('email').innerHTML="** invalid email";
			return false;
		}
		else
		{
			document.getElementById('email').innerHTML="";
		}
		if (mobile==""){
		document.getElementById('mobile').innerHTML="** Please fill mobile";
		return false;
		}
		if(isNaN(mobile))
		{
			document.getElementById('mobile').innerHTML="** mobile number should be digits only";
			return false;
		}
		else
		{
			document.getElementById('mobile').innerHTML="";
		}
		if(mobile.length!=10)
		{
			document.getElementById('mobile').innerHTML="** mobile number should be a 10 digit number";
			return false;
		}
		else
		{
			document.getElementById('mobile').innerHTML="";
		}
		if(mobile.charAt(0)==0)
		{
			document.getElementById('mobile').innerHTML="** mobile number should not start with 0";
			return false;
		}
		else
		{
			document.getElementById('mobile').innerHTML="";
		}
		if (acc==""){
		document.getElementById('acc').innerHTML="** Please fill account number";
		return false;
		}
		if (acc.length !=5 )
		{
			document.getElementById('acc').innerHTML="**  account number length should be 5";
			return false;
		}
		else
		{
			document.getElementById('acc').innerHTML="";
		}
		if (isNaN(acc))
		{
			document.getElementById('acc').innerHTML="**  account number should contain digits only";
			return false;
		}
		else
		{
			document.getElementById('acc').innerHTML="";
		}
		if (pass==""){
		document.getElementById('pass').innerHTML="** Please fill password";
		return false;
		}
		if(pass.length <6 || pass.length>20)
		{
			document.getElementById('pass').innerHTML="** password must be between 6 and 20";
			return false;
		}
		else
		{
			document.getElementById('pass').innerHTML="";
		}
		if (pass.match(letterNumber))
		{
			document.getElementById('pass').innerHTML="";
			return true
		}
		else
		{
			document.getElementById('pass').innerHTML="** password must be alphanumeric";
			return false;
		}
}

</script>



</body>
</html>

