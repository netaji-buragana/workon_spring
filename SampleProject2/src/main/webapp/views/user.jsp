<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

 

 


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

 


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
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
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

.form button:hover, .form button:active, .form button:focus {
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
	background: rgb(141, 194, 111);
	background: linear-gradient(90deg, rgb(108 251 27) 0%,
		rgb(44 66 14/ 23%) 50%);
	font-family: "Roboto", sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}
</style>


<script type="text/javascript">
	$('.message a').click(function() {
		$('form').animate({
			height : "toggle",
			opacity : "toggle"
		}, "slow");
	});
</script>



<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>



<style>
.container {
	margin-top: 50px;
	text-align: center;
}

.image-container {
	margin-top: 20px;
	position: relative;
	display: inline-block;
	border-radius: 50%;
	overflow: hidden;
	width: 100px;
	height: 100px;
	background-color: #e9ecef;
	border: 2px solid #343a40;
}

.image-container img {
	display: block;
	height: 100%;
	width: 100%;
	object-fit: cover;
}

.upload-btn-wrapper {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	opacity: 0;
	cursor: pointer;
	z-index: 2;
}

.upload-btn-wrapper input[type=file] {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	opacity: 0;
	cursor: pointer;
	z-index: 2;
}

.upload-btn-wrapper .btn {
	position: absolute;
	bottom: 10px;
	left: 50%;
	transform: translateX(-50%);
	font-size: 16px;
	padding: 8px 16px;
	background-color: #343a40;
	color: #fff;
	border-radius: 4px;
	cursor: pointer;
	z-index: 1;
}
</style>



<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->



</head>
<body>

	<div class="/userDetails">

		<form action="/userDetails" method="POST"
			enctype="multipart/form-data">

			<div class="form">

				<div style="padding-bottom: 50px;">





					<!-- <form action="/saveImage1" method="POST" enctype="multipart/form-data">
    <input type="file" name="file" accept="image/*">
    <input type="submit" value="Upload">
</form>
 -->




					<i style='font-size: 36px'>


						<div class="image-container ">
						
						<%-- <input name="file" id="file" accept="image/*" value="${data.getData()}"> --%>
							<img id="preview" width="100" height="100" class="img-circle"
								src="http://localhost:8090/image/${data.getId() }"
								alt="${data.getUsername() }"  >
								
							<div class="upload-btn-wrapper">
								<button class="btn">Upload Image</button>
								<input type="file" name="file" id="file" accept="image/*"
									onchange="loadImage(event)">
							</div>
						</div>
					</i>






					<h2>Profile</h2>
				</div>





				<input type="text" name="id" placeholder="id"
					value="${data.getId() }" hidden /> <input type="text"
					name="username" placeholder="username"
					value="${data.getUsername() }" /> <input type="email" name="email"
					placeholder="Email" value="${data.getEmail() }" /> <input
					type="text" name="password" placeholder="password"
					value="${data.getPassword() }" />
				<button style="font-size: 20px;">Submit</button>
				
           <a   style="display:block;width:270px"  href="page?action" class="btn btn-danger ">Cancel</a>


			</div>
		</form>
	</div>



	<script>
		function loadImage(event) {
			var reader = new FileReader();
			reader.onload = function() {
				var output = document.getElementById('preview');
				output.src = reader.result;
			}
			reader.readAsDataURL(event.target.files[0]);
		}



		
	</script>


</body>
</html>