<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<meta charset="utf-8">
	<title>ShortURL安装</title>
</head>
<body class="container">
	<div class="row">
		<center><h2 class="text-muted">ShortURL安装</h2></center>
	</div>
	<div class="row bg-info" style="margin: 10px;padding: 10px;border-radius: 8px;">
		<h3><small>安装环境：<small> PHP >=5.4 </h3>
		<ul>请将文件解压于网站根目录并赋予777权限于以下几个文件夹：
		<li>/conf</li> 
		<li>/runtime </li>
		</ul>
		<p style="margin: 10px;"> ShortUrl默认用户名为admin，密码为123456</p>
	</div>
	<div class="row">
		<div class="col-md-4 col-md-offset-3">
			<form action="" method="post">
				<div class="input-group" style="margin: 10px;">
					<div class="input-group-addon">数据库名</div>
					<input type="text" name="dbname" class="form-control">
				</div>
				<div class="input-group" style="margin: 10px;">
					<div class="input-group-addon">数据库用户名</div>
					<input type="text" name="dbuser" class="form-control">
				</div>
				<div class="input-group" style="margin: 10px;">
					<div class="input-group-addon">数据库密码</div>
					<input type="text" name="dbpass" class="form-control">
				</div>
				<button type="submit" class="btn btn-success" style="margin: 10px; ">安装</button>
			</form>
		</div>
	</div>

</body>
</html>



<?php
	if(isset($_POST['dbname'])){




		// Name of the file
$filename = 'url.sql';
// MySQL host
$mysql_host = 'localhost';
// MySQL username
$mysql_username = $_POST['dbuser'];
// MySQL password
$mysql_password = $_POST['dbpass'];
// Database name
$mysql_database = $_POST['dbname'];

// Connect to MySQL server
mysql_connect($mysql_host, $mysql_username, $mysql_password) or die('Error connecting to MySQL server: ' . mysql_error());
// Select database
mysql_select_db($mysql_database) or die('Error selecting MySQL database: ' . mysql_error());

// Temporary variable, used to store current query
$templine = '';
// Read in entire file
$lines = file($filename);
// Loop through each line
foreach ($lines as $line)
{
// Skip it if it's a comment
if (substr($line, 0, 2) == '--' || $line == '')
    continue;

// Add this line to the current segment
$templine .= $line;
// If it has a semicolon at the end, it's the end of the query
if (substr(trim($line), -1, 1) == ';')
{
    // Perform the query
    mysql_query($templine) or print('Error performing query \'<strong>' . $templine . '\': ' . mysql_error() . '<br /><br />');
    // Reset temp variable to empty
    $templine = '';
}
}
 echo "Tables imported successfully";

 $m="<?php \n define('DBNAME',".$mysql_database.");\ndefine('DBUSER',".$mysql_username.");\ndefine('DBPASS',".$mysql_password.");";
 echo $m;
file_put_contents('./conf/config.php', $m);
echo "<h3 class=\"text-success\">安装成功</h3><hr/><h2><b>请删除install.php文件</b></h2><br><h2><a href=\"/index.php/index/Admin/login\">管理员登入</a></h2>";









































	}
	


