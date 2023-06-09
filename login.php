<?php

    session_start();

    include("classes/connect.php");
    include("classes/login.php");

    $email = "";
    $password = "";

    if($_SERVER['REQUEST_METHOD'] == 'POST')
    {
            
        $login = new Login();
            
        $result = $login->evaluate($_POST);
            
        if($result != "")
        {
            echo "<div style='text-align:center;font-size:12px;color:white;background-color:grey;'>";
            echo "<br>The following errors occured:<br><br>";
            echo $result;
            echo "</div>";
        }else
        {

            header("Location: profile.php");
            die;
        }
            
        $email = $_POST['email'];
        $password = $_POST['password'];
    }   

?>

<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="tab_logo.png">
        <meta name="vieport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles/login.css" />

        <title>Social Loop | Log In</title>
    </head>
    <body style="background-color: rgb(154, 224, 207);">
        <!--Header-->
        <section id="header">
            <div class="header container">
                <div>
                    <div class="brand">
                        <a href="#home"><h1>Social Loop</h1></a>
                </div>
            </div>
        </section>

        <!--Home Section-->
        <section id="home">

            <div class="home container">
                
                <div>
                    <h1>Welcome to <span></span></h1>
                    <h1>our new Social media,<span></span></h1>
                    <h1>Social Loop<span></span></h1>                    
                </div>
                <div id="login_home" style="">

                    <form method="post">
                        <h2 style="color:rgb(154, 224, 207);">Login to Social Loop</h2><br><br>
                        
                        <input name="email" value="<?php echo $email ?>" type="text" id="text" placeholder="Email"><br><br>
                        <input name="password" value="<?php echo $password ?>" type="password" id="text" placeholder="Password"><br><br>
                        <input type="submit" id="button" value="Log In"><br><br>
                        <p id="signup_href"><a href="signup.php">Dont have an account yet? Sign up now</a></p>
                    <form>
                </div>
            </div>
        </section>

    </body>

</html>
