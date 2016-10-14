<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body class="background"
id="image">

<?php

$username = "";
$password = "";

if (empty($_POST["username"]) != true || empty($_POST["password"]) != true)
{

	$username = $_POST["username"];
	$password = $_POST["password"];

	$data = array("username"=>$username, "password"=>$password);
	$string = http_build_query($data);

	//$ch = curl_init("http://localhost/test.php");
	$ch = curl_init("https://web.njit.edu/~pk327/CS490/curlLogin.php");
	//$ch = curl_init("https://afsaccess1.njit.edu/~pk327/CS490/curlLogin.php");
	curl_setopt($ch, CURLOPT_POST, true);
	curl_setopt($ch, CURLOPT_POSTFIELDS, $string);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

	$output = curl_exec($ch);
	curl_close($ch);

	$jsonarray = json_decode($output, true);
	//echo $output;
	//echo "<br>";
	//var_dump($jsonarray);
	//echo "<br>";
	if ($username == "false") {
		$jsonarray["Server"] = true;
	}
	if ($jsonarray["Server"] == true)
	{
		echo "Sorry, an account with this username already exists.";
	}
	elseif ($jsonarray["Server"] == false)
	{
		echo "Welcome new user.";
		header("Location: home.html");
	}
}
?>

<script type="text/javascript">
window.addEventListener("load", reRatioLoad);
window.addEventListener("resize", reRatio);

function reRatioLoad() {
var image = new Image();
image.src = 'loginscreen_waterfall.jpg';
var imgHeightRatio = image.height/image.width;
var imgWidthRatio = image.width/image.height;
document.body.style.height = screen.width*imgHeightRatio + "px";
	
document.querySelector('.center').style.width = window.outerWidth*.2 + "px";
document.getElementsByClassName('textfields')[0].style.fontSize = window.outerWidth*.1 + "%";
document.getElementsByClassName('textfields')[1].style.fontSize = window.outerWidth*.1 + "%";
document.getElementsByClassName('buttons')[0].style.fontSize = window.outerWidth*.08 + "%";
document.getElementsByClassName('buttons')[1].style.fontSize = window.outerWidth*.08 + "%";
}

function reRatio() {
var image = new Image();
image.src = 'loginscreen_waterfall.jpg';
var imgHeightRatio = image.height/image.width;
var imgWidthRatio = image.width/image.height;
if ((imgHeightRatio >= (window.outerHeight/window.outerWidth)) && (window.outerWidth == screen.width)) {
	document.body.style.height = document.body.clientWidth*imgHeightRatio + "px";
	
	document.querySelector('.center').style.width = window.outerWidth*.2 + "px";
	document.getElementsByClassName('textfields')[0].style.fontSize = window.outerWidth*.1 + "%";
	document.getElementsByClassName('textfields')[1].style.fontSize = window.outerWidth*.1 + "%";
	document.getElementsByClassName('buttons')[0].style.fontSize = window.outerWidth*.08 + "%";
	document.getElementsByClassName('buttons')[1].style.fontSize = window.outerWidth*.08 + "%";
}
window.scroll(0, window.innerHeight * 2);

console.log(document.querySelector('.background'))
console.log(document.querySelector('.center').style.width)
console.log(document.body.style.height)
console.log(window.innerHeight)}
</script>

<style type="text/css">
.background {
	background-image: url(loginscreen_waterfall.jpg);
	background-repeat: no-repeat;
    background-position: center top;
	background-size: cover;
	display: block;
	overflow: auto;
	background-attachment: scroll;
	width: auto;
	height: auto;
	padding: 0;
	margin: 0;
	border: 0;
}
.center {
    position: relative;
	display: block;
	top: 50%;
	margin: auto;
	text-align: center;
	height: 20%;
	width: 20%;
}
.textfields {
	height: auto;
	width: 80%;
	margin: 5% 10% 5% 10%;
	font-size: 100%;
	padding: 0px;
	text-align: left;
	text-indent: 0px;
}
.buttons {
	position: absolute;
	height: auto;
	width: 35%;
	padding: 0;
}
</style>

<div class="center">
	<form method="post">
		<input type="text" name="username" placeholder="Username" class="textfields"><br>
		<input type="password" name="password" placeholder="Password" class="textfields"><br>
		<button type="submit" class="buttons" style="left: 10%">Login</button>
		<button type="submit" formaction="newuser.php" method="post" class="buttons" style="right: 10%">Sign up</button>
	</form>
</div>

</body>
</html>
