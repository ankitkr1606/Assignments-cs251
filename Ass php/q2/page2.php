<html>
<head></head>
<body>

<?php
$user = $password = "";
$db = new SQLite3('mysqlitedb.db');
if ($_SERVER["REQUEST_METHOD"] == "POST") {
$user = test_input($_POST["username"]);
$password = test_input($_POST["password"]);}

function test_input($data) {
 $data = trim($data);
 $data = stripslashes($data);
 $data = htmlspecialchars($data);
  return $data;
}
if($user=="ankrit" && $password=="qwertyui")
{
	$query="SELECT * FROM records";
	$result=$db->query($query);
	echo "<table border='1'>";
	echo "<tr><td>" . "name" . "</td><td>" . "email" . "</td><td>" . "address" . "</td><td>" . "mobile" . "</td><td>" . "account number" . "</td></tr>";
	
	while($row = $result->fetchArray()){   
		echo "<tr><td>" . $row['name'] . "</td><td>" . $row['email'] . "</td><td>" . $row['address'] . "</td><td>" . $row['mobile'] . "</td><td>" . $row['acc'] . "</td></tr>";
	}
	
	echo "</table>";
}
?>
<h2> Admin Login </h2>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" onsubmit="return Validate()" name="vform" class="bg-light">
Admin Username: <input type="text" id="user" name="username" autocomplete="off">
<span id="name" class="text-danger font-weight-bold"></span>
<br><br>
Admin Password: <input type="password" id="pass" name="password" autocomplete="off">
<span id="pas" class="text-danger font-weight-bold"></span>
<br><br>
<input type="submit" name="submit"  value="Login">
<span id="btn" class="text-danger font-weight-bold"></span>
</form>
<a href="index.php">Another registration</a>


<script type="text/javascript">
function Validate(){

	var user= document.getElementById('user').value;
	var pass= document.getElementById('pass').value;
	var re = /^[A-Z' 'a-z]+$/;
	var letterNumber = /^[0-9a-zA-Z]+$/;
	if (user==""){
		document.getElementById('name').innerHTML="** Please fill name";
		return false;
		}
		
	if (pass==""){
		document.getElementById('pas').innerHTML="** Please fill password";
		return false;
		}	
	
}

</script>
</body>
</html>	
