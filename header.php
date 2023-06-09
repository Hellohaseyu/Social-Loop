<!--top bar-->
<?php 

	$corner_image = "images/user_male.jpg";
	if(isset($USER)){
		
		if(file_exists($USER['profile_image']))
		{
			$image_class = new Image();
			$corner_image = $image_class->get_thumb_profile($USER['profile_image']);
		}else{

			if($USER['gender'] == "Female"){

				$corner_image = "images/user_female.jpg";
			}
		}
	}
?>

<div id="header">
	<form method="get" action="search.php">
		<div style="width: 800px;margin:auto;font-size: 30px;">
			
			<a href="index.php" style="color: whitesmoke; text-decoration:none;">Social Loop</a> 
			&nbsp &nbsp <input type="text" id="search_box" name="find" placeholder="Search for people" />
			

			<?php if(isset($USER)): ?>
				<a href="profile.php">
				<img src="<?php echo $corner_image ?>" style="width: 50px;float: right;">
				</a>
				<a href="logout.php">
					<!--Logout-->
				<span style="font-size:12px;float: right;margin-top:31px;color:white;">Logout</span>
				</a>

				<a href="notifications.php">
				<span style="display: inline-block;position: relative;">
					<img src="bell-2-64.ico" style="width:25px;float:right;margin-bottom10px;">
					<?php 
						$notif = check_notifications();
					?>
					<?php if($notif > 0): ?>
						<div style="background-color: red;color: white;position: absolute;right:-15px;
						width:18px;height: 18px;border-radius: 50%;padding: 4px;text-align:center;font-size: 10px;"><?= $notif ?></div>
					<?php endif; ?>
				</span>
				</a>

			<?php else: ?>
				<a href="profile.php">
				<img src="<?php echo $corner_image ?>" style="width: 50px;float: right;">
				</a>
				<a href="profile.php">
				<span style="font-size:13px;float: right;margin-top:31px;;color:white;">Logout</span>
			<?php endif; ?>


		</div>
	</form>
</div>