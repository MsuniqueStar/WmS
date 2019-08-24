<?php
	session_start();
	//$_SEESION["pass"] = "True";
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">

    
    
   <style>
.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}


.button3 {border-radius: 8px;}

</style>

  <title>Login Page Wholesale</title>

        <link rel="stylesheet" href="css/style.css">

</head>

<body>
  <body class="align">

  <div class="site__container">

    <div class="grid__container">

      <form action="Login.php" method="post" class="form form--login">

        <div class="form__field">
          <label class="fontawesome-user" for="login__username"><span class="hidden">Username</span></label>
          <input id="login__username" name="userid" type="text" class="form__input" placeholder="Username" required>
        </div>

        <div class="form__field">
          <label class="fontawesome-lock" for="login__password"><span class="hidden">Password</span></label>
          <input id="login__password" name="pass" type="password" class="form__input" placeholder="Password" required>
        </div>

        <div class="form__field">
          <input type="submit" name="Login" value="Log In">

  
        </div>
 </form>
<div class="form__field">
  <a href="logout.php" class="form--refresh">
          <button class="button button3">
&nbsp;&nbsp;&nbsp;&nbsp;
<b>BACK</b>
&nbsp;&nbsp;&nbsp;&nbsp;</button>
        </a>
</div>
     



</div>

  </div>

</body>


</body>
</html>
