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


	if(isset($_SERVER['HTTP_REFERER']) && !strstr($_SERVER['HTTP_REFERER'], "delete.php")){

		$_SESSION['return_to'] = $_SERVER['HTTP_REFERER'];
	}

	$ERROR = "";
	if(isset($_GET['id'])){

		 $ROW = $Post->get_one_post($_GET['id']);

		 if(!$ROW){

		 	$ERROR = "No such post was found!";
		 }else{

		 	if(!i_own_content($ROW)){

		 		$ERROR = "Accesss denied! you cant delete this file!";
		 	}
		 }

	}else{

		$ERROR = "No such post was found!";
	}


	//if something was posted
	if($ERROR == "" && $_SERVER['REQUEST_METHOD'] == "POST"){

		$Post->delete_post($_POST['postid']);
		header("Location: ".$_SESSION['return_to']);
		die;
	}

?>

<!DOCTYPE html>
	<html>
	<head>
		<link rel="icon" href="tab_logo.png">
	    <link rel="stylesheet" href="styles/delete.css" />
		<title>Delete | Social Loop</title>
	</head>

	<body style= "background-image:url('brownbody.png');">

		<?php include("header.php"); ?>

		<!--cover area-->
		<div style="width: 800px;margin:auto;min-height: 400px;">
		 
			<!--below cover area-->
			<div style="display: flex;">	

				<!--posts area-->
 				<div style="min-height: 400px;flex:2.5;padding: 20px;padding-right: 0px;">
 					
 					<div style="border:solid thin #aaa; padding: 10px;background-color: whitesmoke; color:black;">

  						<form method="post">
 							
  								<?php

 									if($ERROR != ""){

								 		echo $ERROR;
								 	}else{

	  									echo "Are you sure you want to delete this post??<br><br>";

										$user = new User();
	 									$ROW_USER = $user->get_user($ROW['userid']);
										 
	 									
	  									include("post_delete.php");

	  									echo "<input type='hidden' name='postid' value='$ROW[postid]'>";
	 									echo "<input style='background-color:rgb(154, 224, 207);' id='post_button' type='submit' value='Delete'>";
 									}
 								?>
  							
	 						
	 						<br>
 						</form>
 					</div>
  

 				</div>
			</div>

		</div>

	</body>
</html>