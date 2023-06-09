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

	$ERROR = "";
	if(isset($_GET['id'])){

		 $ROW = $Post->get_one_post($_GET['id']);

		 if(!$ROW){

		 	$ERROR = "No such post was found!";
		 }else{

		 	if($ROW['userid'] != $_SESSION['mybook_userid']){

		 		$ERROR = "Accesss denied! you cant delete this file!";
		 	}
		 }

	}else{

		$ERROR = "No such post was found!";
	}

	if(isset($_SERVER['HTTP_REFERER']) && !strstr($_SERVER['HTTP_REFERER'], "edit.php")){

		$_SESSION['return_to'] = $_SERVER['HTTP_REFERER'];
	}

	//if something was posted
	if($_SERVER['REQUEST_METHOD'] == "POST"){

		$Post->edit_post($_POST,$_FILES);


		header("Location: ".$_SESSION['return_to']);
		die;
	}

?>

<!DOCTYPE html>
	<html>
	<head>
		<link rel="icon" href="tab_logo.png">
	    <link rel="stylesheet" href="styles/edit.css" />
		<title>Delete | Social Loop</title>
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

  						<form method="post" enctype="multipart/form-data">
 							
  								<?php

 									if($ERROR != ""){

								 		echo $ERROR;
								 	}else{

	  									echo "<b>Edit Post</b><br><br>";
 										
 										echo '<textarea name="post" placeholder="Whats on your mind?">'.$ROW['post'].'</textarea>
	 											<input type="file" name="file">';

	  									echo "<input type='hidden' name='postid' value='$ROW[postid]'>";
	 									echo "<input style='background-color:rgb(154, 224, 207);' id='post_button' type='submit' value='Save'>";

	 									if(file_exists($ROW['image']))
										{
											$image_class = new Image();
											$post_image = $image_class->get_thumb_post($ROW['image']);

											echo "<br><br><div style='text-align:center;'><img src='$post_image' style='width:50%;' /></div>";
										}

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