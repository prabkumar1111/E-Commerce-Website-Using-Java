
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>  -->
<title>Login</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
     <form action="loginAction.jsp" method="post">
    	<input type="text" name = "email" placeholder = "Enter Email" required>
    	<input type="password" name = "password" placeholder = "Enter Password" required>
    	<input type="submit" value = "login">
    </form>
      <h2><a href="signup.jsp">SignUp</a></h2>
       <h2><a href="forgotPassword.jsp">Forgot Password?</a></h2>
  </div>
  <%
  if(request.getParameter("msg")!=null && (request.getParameter("msg").equals("invalid") || request.getParameter("msg").equals("notexist"))){
  %>
  <div class='whysignLogin'>
  <h2>Online Shopping Project</h2>
   <h1>Incorrect Username or Password</h1>  
<h1>Some thing Went Wrong! Try Again !</h1>
    
  <!-- <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p> --> 
  </div>
  <%} %>
</div>
</body>
</html>