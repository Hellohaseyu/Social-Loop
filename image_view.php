<?php 

	include("classes/autoload.php");
 
	$login = new Login();
	$user_data = $login->check_login($_SESSION['mybook_userid']);
 
 	$USER = $user_data;
 	
 	if(isset($_GET['id']) && is_numeric($_GET['id'])){

	 	$profile = new Profile();
	 	$profile_data = $profile->get_profile($_GET['id']);

	 	if(is_array($profile_data)){
	 		$user_data = $profile_data[0];
	 	}

 	}
 	
	
	$Post = new Post();
	$ROW = false;

	$ERROR = "";
	if(isset($_GET['id'])){

		$ROW = $Post->get_one_post($_GET['id']);
	}else{

		$ERROR = "No image was found!";
	}
 
?>

<!DOCTYPE html>
	<html>
	<head>
		<link rel="icon" href="tab_logo.png">
		<link rel="stylesheet" href="styles/image_view.css" />
		<title>Single Post | Social Loop</title>
	</head>


	<body style= "background-image:url('brownbody.png');">

		<br>
		<?php include("header.php"); ?>

		<!--cover area-->
		<div style="width: 800px;margin:auto;min-height: 400px;">
		 
			<!--below cover area-->
			<div style="display: flex;">	

				<!--posts area-->
 				<div style="min-height: 400px;flex:2.5;padding: 20px;padding-right: 0px;">
 					
 					<div style="border:solid thin #aaa; padding: 10px;background-color: white;">

  					    <?php 

  					 		$user = new User();
  					 		$image_class = new Image();

  					 		if(is_array($ROW)){

								echo "<img src='$ROW[image]' style='width:100%;' />";  					 			
  					 		}

  					    ?>

  					 <br style="clear: both;">
 					</div>
  

 				</div>
			</div>

		</div>

	</body>
</html>