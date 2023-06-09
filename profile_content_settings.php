<div style="min-height: 400px;width:100%;background-color: whitesmoke;text-align: center;">
	<div style="padding: 10px;max-width:350px;display: inline-block;margin-top:30px">
		<form method="post" enctype="multipart/form-data">

  						
			<?php
		 
				$settings_class = new Settings();

				$settings = $settings_class->get_settings($_SESSION['mybook_userid']);

				if(is_array($settings)){

					echo "First Name:<input type='text' id='textbox' name='first_name' value='".htmlspecialchars($settings['first_name'])."' placeholder='First name' />";
					echo "Last Name:<input type='text' id='textbox' name='last_name' value='".htmlspecialchars($settings['last_name'])."' placeholder='Last name' />";

					echo "Gender:<select id='textbox' name='email' style='height:26px;'>

							<option>".htmlspecialchars($settings['gender'])."</option>
							<option>Male</option>
							<option>Female</option>
						</select>";

					echo "Email:<input type='text' id='textbox' name='email'  value='".htmlspecialchars($settings['email'])."' placeholder='Email'/>";
					echo "Password:<input type='password' id='textbox' name='password'  value='".htmlspecialchars($settings['password'])."' placeholder='Password'/>";
					echo "Confirm Password:<input type='password' id='textbox' name='password2'  value='".htmlspecialchars($settings['password'])."' placeholder='Password'/>";

					echo '<input id="post_button" type="submit" value="Save">';
				}
				
			?>

		</form>
	</div>
</div>