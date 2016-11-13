<!DOCTYPE html>
<html lang="pl">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
<?php
  $userstr;
  if (isset($_SESSION['user']))
  {
    $user     = $_SESSION['user'];
    $loggedin = TRUE;
    $userstr  = " [ $user ]";
  }
  else $loggedin = FALSE;
?>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>BLOG O firmie</title>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="aspect/css/w3s.css"> 
  <script src="aspect/js/script.js"></script>

  <style>
	.jumbotron{
	padding-top:5px;
	padding-bottom:5px;
	margin-bottom:5px;
	color:inherit;
	background-color:#eee;
	}
  
	.mySlides {display:none}
	
    /* Remove the navbar's default rounded borders and increase the bottom margin */ 
    .navbar {
      margin-bottom: 30px;
      border-radius: 0;
    }
    
    /* Remove the jumbotron's default bottom margin */ 
     .jumbotron {
      margin-bottom: 0;
    }
   
    /* Add a gray background color and some padding to the footer */
    footer {
	  background-color: #f2f2f2;
      padding: 25px;
    }
	
	#blogItem {
    border: 1px solid grey;
    border-radius: 5px;
	padding: 10px;
	background-color: white;
	font-size: 1.2em;
	}
	
	#comment {
    border-radius: 15px;
	padding: 10px;
	margin: 10px;
	background-color: WhiteSmoke;
	font-size: 0.85em;
	}
	

  </style>
</head>
<body>
	<div class="jumbotron"><center><img src="aspect/files/company.jpg" style="width:30%" alt="Image">
	<h2> BLOG <i>O Firmie </i> </h2></center>
	</div>
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
		<div class="navbar-header">
		  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>		
		  </button>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
			<li><a href="<?php echo ROOT_URL; ?>">O firmie</a></li>
			<li><a href="<?php echo ROOT_URL; ?>blog">Blog</a></li>
			<li><a href="<?php echo ROOT_URL; ?>contact">Kontakt</a></li>
			</ul>
		</div>
	  </div>
	</nav>
	
	<div class="container">
	<div class="row">
	
	<?php require($view); ?>
	
	</div>
	</div>
	<footer class="container-fluid text-center">
		<p>Copyright Dawid Sarnecki 2016</p>  
	</footer>
</body>
</html>
	








