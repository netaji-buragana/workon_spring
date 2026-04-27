<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>



<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  border-radius: 40px;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
/*  border-radius: 10px; */
  
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  /* border-radius: 10px; */
  outline: 0;
  background: #3ad940;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #43A047;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}
body {
  background: #76b852; /* fallback for old browsers */
  background: rgb(141,194,111);
  background: linear-gradient(90deg, rgb(108 251 27) 0%, rgb(44 66 14 / 23%) 50%);
  
  
  
  
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;      
}</style>


<script type="text/javascript">
$('.message a').click(function(){
	   $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
	});
</script>



<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>


</head>
<body>
	<!-- <h2>Login</h2>

	<form action="login" method="post">
		<table>
			<tr>
				<td>User: <input type="text" name="username"></td>
			</tr>
			<tr>
				<td>password: <input type="text" name="password"></td>
			</tr>

			<tr>
				<td><input type="submit" name="submit"></td>
			</tr>

		</table>

	</form>
	<a href="/register">Register</a> -->
	
	
	
	
	
	
	
	
	
	<div class="login-page">
	
  <div class="form"><div style="  padding-bottom: 50px;">
  
  <i class='fas fa-user-alt' style='font-size:36px'></i>
          <h2>Log In</h2>
          
           <c:if test = "${param.changedPassword != null}">
           <p style="color:dark green;"> <strong>Password Changed Successfully...</strong></p>
           
          </c:if>
  </div>
    
    <form  action="/login" method="post" >
    
   <%--  <div class="alert alert  ${param.message== null   ? 'hide':''} " role="alert" >
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>	
		<h3 class="${param.message!= null? 'frame': ''} "
			style="color: red;">${param.message}</h3>
			
			
	</div>		 --%>
			
    
      <input type="text" name="username" placeholder="username"/>
      <input type="password" name="password"placeholder="password"/>
      
      <p class="message" style="font-size:15px; color:black;"> <a style=" padding-left: 120px;" href="/forgotpassword"><strong> &nbsp; ForgotPassword ?</strong></a></p>
      
      <button style="font-size:20px;">login</button>
      <p class="message" style="font-size:15px; color:black;">Not registered? <a  href="/register"><strong> &nbsp; Sign Up</strong></a></p>
    </form>
  </div>
</div>
</body>
</html>