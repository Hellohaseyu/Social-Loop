<?php

    include("classes/connect.php");
    include("classes/signup.php");

    $first_name = "";
    $last_name = "";
    $gender = "";
    $email = "";
    
    if($_SERVER['REQUEST_METHOD'] == 'POST')
    {
        $signup = new Signup();
        $result = $signup->evaluate($_POST);
        
        if($result != "") 
        {
            echo "<div style='text-align:center;font-size:12px;color:white;background-color:grey;'>";
            echo "<br>The following errors occured:<br>";
            echo $result;;
            echo "</div>";
        }else
        {
            header("Location: login.php");
            die;
        }

        $first_name = $_POST['first_name'];
        $last_name = $_POST['last_name'];
        $gender = $_POST['gender'];
        $email = $_POST['email'];
    }


?>


<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="tab_logo.png">
        <meta name="vieport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles/signup.css" />

        <title>Social Loop | Sign Up</title>
    </head>
    <body style="background-color: rgb(154, 224, 207);">
        

        <!--Home Section-->
        <section id="home">

            <div class="home container">
                
                <div>
                    <h1>Create your<span></span></h1>
                    <h1>Account here.<span></span></h1>                    
                </div>
                <div id="signup_home">
                    <h2 style="color:rgb(154, 224, 207);">Sign Up to Social Loop</h2><br><br>

                    <form method="post" action="">

                        <input value="<?php echo $first_name ?>" name="first_name" type="text" id="text" placeholder="First name"><br><br>
                        <input value="<?php echo $last_name ?>"name="last_name" type="text" id="text" placeholder="Last name"><br><br>
                        <select name="gender" style="color:#999" id="text">
                              <option value="" disabled selected hidden>Select Gender:</option>
                              <option value="Male">Male</option>
                              <option value="Female">Female</option>
                        </select><br> <br>
                        <input name="email" type="text" id="text" placeholder="Email"><br><br>

                        <input name="password"type="password" id="text" placeholder="Password"><br><br>
                        <input name="password2"type="password" id="text" placeholder="Confirm Password"><br><br>
                        <input type="submit" id="button" value="Sign Up"><br><br>
                        <a style="login_fref" href="login.php">Already have an account? Log in now.</a>

                    </form>
                    
                </div>
            </div>

        </section>
    </body>
</html>