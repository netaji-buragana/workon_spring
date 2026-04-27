<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> <!-- no need -->


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"   
	crossorigin="anonymous">                                                                        <!--  need -->

	
<!-- <script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
 -->

<!-- <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous"> -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>                                                             <!-- need -->
<!-- <script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script> -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>



<style>
.search right -panel {
	display: grid grid-template-columns:6fr 6fr;
	border-left: 2px solid black padding-left:20px;
}
/* .card{
border-top:none;
} */
.grid-container {
	display: grid;
	grid-template-columns: auto auto;
	padding: 10px;
}

.test {
	background-color: lightblue !important;
	
	
}
/* .test1:hover {
	background-color: lightblue !important;
	
	
} */



.button {
	/* background-color: #33BEFF; */
	border: none;
	color: white;
	padding: 10px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.action {
	border: none;
	color: white;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.search {
	border: none;
	color: white;
	padding: 5px 30px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.clear {
	border: none;
	color: white;
	padding: 3px 5px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.button1 {
	/*   background-color: #4CAF50; /* Green */ */
	border: none;
	/* color: white; */
	padding: 1px 7px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
}

.SearchContainer {
	padding: 2px 1px 10px;
}

#searchinput {
	width: 160px;
}

#searchclear {
	position: absolute;
	right: 5px;
	top: 0;
	bottom: 0;
	height: 14px;
	margin: auto;
	font-size: 10px;
	cursor: pointer;
	color: #ccc;
}

.frame {
	background-color: #33ccff !important;
	background: linear-gradient(to bottom, #99ccff 0%, #ffccff 100%);
	width: 100%;
	height: 45px;
	text-align: center;
	top: 0px;
	color: green;
}

.hide {
	display: none;
}

.cls {
	width: 500px;
	height: 100px;
	border: 2px solid lightblue;
}

</style>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="css/form.css">
<link rel="stylesheet" href="css/address.css">

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


<script>
 function deleteEmp(empId)
 {
     swal({
         title: "Are you sure?",
         text: "Want to Delete",
         icon: "warning",
         buttons: true,
         dangerMode: true,
     })
         .then((willDelete) => {
             if (willDelete) {
                 window.location="/delete1/"+empId;

             } else {
                /*  swal("Not Deleted"); */
             }
         });
 }




 function deleteAddress(id)
 {
     swal({
         title: "Are you sure?",
         text: "Want to Delete",
         icon: "warning",
         buttons: true,
         dangerMode: true,
     })
         .then((willDelete) => {
             if (willDelete) {
                 window.location="/deleteForAddress/"+id;

             } else {
                /*  swal("Not Deleted"); */
             }
         });
 }




 $(function () {
	    $('[data-toggle="tooltip"]').tooltip();
	});

 
 </script>
 
 <script type="text/javascript">

window.setTimeout(function() {
    $(".alert").fadeTo(0, 0).slideUp(0, function(){
        $(this).remove(); 
    });
}, 3000);

 
 </script>

<!-- <style type="text/css">
 @import "compass/css3";

body{
  padding: 50px;
}
</style> -->
<!-- <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">




<link rel="stylesheet"
	href="https://mdbcdn.b-cdn.net/wp-content/themes/mdbootstrap4/docs-app/css/dist/mdb5/standard/core.min.css">



 -->

<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>






<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
	<style>
		/* .container {
			margin-top: 50px;
			text-align: center;
		} */
		.image-container {
			margin-top: 20px;
			position: relative;
			display: inline-block;
			border-radius: 50%;
			overflow: hidden;
			width: 50px;
			height: 50px;
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


<!-- 
<style>
        @import url("https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap");

        :root {
            --header-height: 3rem;
            --nav-width: 68px;
            --first-color: #4723D9;
            --first-color-light: #AFA5D9;
            --white-color: #F7F6FB;
            --body-font: 'Nunito', sans-serif;
            --normal-font-size: 1rem;
            --z-fixed: 100
        }

        *,
        ::before,
        ::after {
            box-sizing: border-box
        }

        body {
            position: relative;
            margin: var(--header-height) 0 0 0;
            padding: 0 1rem;
            font-family: var(--body-font);
            font-size: var(--normal-font-size);
            transition: .5s
        }

        a {
            text-decoration: none
        }

        .header {
            width: 100%;
            height: var(--header-height);
            position: fixed;
            top: 0;
            left: 0;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 1rem;
            background-color: var(--white-color);
            z-index: var(--z-fixed);
            transition: .5s
        }


        .header_toggle {
            color: var(--first-color);
            font-size: 1.5rem;
            cursor: pointer
        }

        .header_img {
            width: 35px;
            height: 35px;
            display: flex;
            justify-content: center;
            border-radius: 50%;
            overflow: hidden
        }

        .header_img img {
            width: 40px
        }

        .l-navbar {
            position: fixed;
            top: 0;
            left: -30%;
            width: var(--nav-width);
            height: 100vh;
            background-color: var(--first-color);
            padding: .5rem 1rem 0 0;
            transition: .5s;
            z-index: var(--z-fixed)
        }

        .nav {
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            overflow: hidden
        }

        .nav_logo,
        .nav_link {
            display: grid;
            grid-template-columns: max-content max-content;
            lign-items: center;
            column-gap: 1rem;
            padding: .5rem 0 .5rem 1.5rem
        }

        .nav_logo {
            margin-bottom: 2rem
        }

        .nav_logo-icon {
            font-size: 1.25rem;
            color: var(--white-color)
        }

        .nav_logo-name {
            color: var(--white-color);
            font-weight: 700
        }

        .nav_link {
            position: relative;
            color: var(--first-color-light);
            margin-bottom: 1.5rem;
            transition: .3s
        }

        .nav_link:hover {
            color: var(--white-color)
        }

        .nav_icon {
            font-size: 1.25rem
        }

        .show {
            left: 0
        }

        .body-pd {
            padding-left: calc(var(--nav-width) + 1rem)
        }

        .active {
            color: var(--white-color)
        }

        .active::before {
            content: '';
            position: absolute;
            left: 0;
            width: 2px;
            height: 32px;
            background-color: var(--white-color)
        }

        .height-100 {
            height: 100vh
        }

        @media screen and (min-width: 768px) {
            body {
                margin: calc(var(--header-height) + 1rem) 0 0 0;
                padding-left: calc(var(--nav-width) + 2rem)
            }

            .header {
                height: calc(var(--header-height) + 1rem);
                padding: 0 2rem 0 calc(var(--nav-width) + 2rem)
            }

            .header_img {
                width: 40px;
                height: 40px
            }

            .header_img img {
                width: 45px
            }

            .l-navbar {
                left: 0;
                padding: 1rem 1rem 0 0
            }

            .show {
                width: calc(var(--nav-width) + 156px)
            }

            .body-pd {
                padding-left: calc(var(--nav-width) + 188px)
            }
        }
    </style> -->


<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">

   
 -->



</head>
<body>






<nav class="navbar navbar-expand-lg navbar-dark bg-primary ">
			
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>



			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li   class="nav-item col-6 col-lg-auto"><a class="nav-link py-2 px-0 px-lg-2 active" 
						href="/display">Home 
					</a></li>
					<li   class="nav-item col-6 col-lg-auto">
					
					<a class="nav-link py-2 px-0 px-lg-2 active"  href="/page?action="><strong>EMPLOYEE DETAILS</strong></a></li>
					
					
					
					<li   class="nav-item col-6 col-lg-auto">
					
					<a class="nav-link py-2 px-0 px-lg-2 active"
						href="/accounts-info">BANK ACCOUNTS 
					</a></li>
					
					<li   class="nav-item col-6 col-lg-auto">
					
					<a class="nav-link py-2 px-0 px-lg-2 active"
						href="/projects-info">PROJECTS <span class="sr-only">(current)</span>
					</a></li>
					

				</ul>
				
			</div>






















		<div class="dropdown">
			<i title="${userName}" style="color: white;" id="navbarDropdown"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">


				<div class="image-container ">
					<img id="preview" width="100" height="100" class="img-circle"
						src="http://localhost:8090/image/${imageId}" alt="${userName}">
					<div class="upload-btn-wrapper">
						<button class="btn">Upload Image</button>
						<input type="file" name="file" id="file" accept="image/*"
							onchange="loadImage(event)">
					</div>
				</div>
				





			</i> &nbsp;



			<div class="dropdown-menu dropdown-menu-right"
				aria-labelledby="navbarDropdown">
				<a class="dropdown-item" href="/logout">Logout</a> <a
					class="dropdown-item" href="/dis">Edit Profile</a>
			</div>
		</div>






		<!-- <a href="/logout" class="nav-item active" style="color:white;"><strong>Logout</strong></a> -->
			
		</nav>


<!-- <div class="container">
                                     
  <div class="dropdown">
    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Dropdown Example
    <span class="caret"></span></button>
    <ul class="dropdown-menu">
      <li><a href="#">HTML</a></li>
      <li><a href="#">CSS</a></li>
      <li><a href="#">JavaScript</a></li>
    </ul>
  </div>
</div> -->
	
	
	
	
	<%-- ${userName}
	
	${image}
	
	<img  src=@${image}>
	
	
	
	<img  width="100" height="100" src="http://localhost:8080/image/${imageId}">
	
	${photo}
	
	 --%>
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	
	
	<div class="image-container ">
			<img id="preview"  width="100" height="100" class="img-circle" src="http://localhost:8080/image/${imageId}" alt="Profile Picture">
			<div class="upload-btn-wrapper">
				<button class="btn">Upload Image</button>
				<input type="file" name="file" id="file" accept="image/*" onchange="loadImage(event)">
			</div>
		</div>
	
	
	

		<%-- <div class="${details=='Already Having This credentials'  || details=='Sucessfully Added' ? 'frame':''} ">
	    <h3 >${details}</h3>
	</div> --%>

<%-- <div class="alert alert  ${update== null   ? 'hide':''} " role="alert" >
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> --%>
  <!-- <strong>Success!</strong> You have been signed in successfully! -->

<div class="alert alert  ${param.delete== null   ? 'hide':''} " role="alert" >
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>	
		<h3 class="${param.delete!= null? 'frame': ''} "
			style="color: red;">Successfully Deleted</h3>
			
			
	</div>		
			

<div class="alert alert  ${update== null   ? 'hide':''} " role="alert" >
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>				
		<h3 class="${update== 'Record Successfully Updated'? 'frame': ''}"
			style="color: green;">${update }</h3>
</div>
<%-- 
  <c:if class="alert alert" role="alert"  test = "${param.delete== null   ? 'hide':''}">
           <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>	
		<c:if class="alert alert" role="alert"  test = "${param.delete== 'Deleted Successfully'? 'frame': ''} "
			style="color: red;">${delete }


</c:if>
           
          </c:if> --%>




<div class="alert alert  ${details== null   ? 'hide':''} " role="alert" >
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>	
		<c:if test="${details=='Successfully Added'}">
			<h3 class="${details=='Successfully Added'? 'frame':''}"
				style="color: green">${details}</h3>
		</c:if>

		<c:if test="${details=='Already Having This credentials'}">
			<h3 class="${details=='Already Having This credentials'? 'frame':''}"
				style="color: #ffeb3b">${details}</h3>
		</c:if>
</div>		
		
		
		
<div class="alert alert  ${nodata== null   ? 'hide':''} " role="alert" >
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>		

		<c:if test="${nodata=='No Data Found'}">
			<h3 class="${nodata=='No Data Found'? 'frame':''}"
				style="color: #ffeb3b">${nodata}</h3>
		</c:if>
		

</div>











		<br />

		<div class="grid-container SearchContainer"  style=" padding-left: 50px;">

			<div class="grid-container ">
				<form action="/searchAll" class="form-inline text-right  w-100">
					<div class="form-group">
						&nbsp; <input type="search" class="form-control w-15"
							id="searchinput" name="empId" placeholder="Employee Id"
							value=${deleteid}> <span id="searchclear"
							class="glyphicon glyphicon-remove-circle"></span> &nbsp; <input
							type="search" class="form-control w-15" id="searchinput"
							name="eName" placeholder="SearchByName" value=${name}> <span
							id="searchclear" class="glyphicon glyphicon-remove-circle"></span>


						&nbsp; <input type="search" class="form-control w-15"
							id="searchinput" name="eSalary" placeholder="Search By Salary"
							value=${salary}> <span id="searchclear"
							class="glyphicon glyphicon-remove-circle"></span> &nbsp; <input
							type="search" class="form-control w-15" id="searchinput"
							name="mobile" placeholder="Search By Mobile" value=${mobile}>
						<span id="searchclear" class="glyphicon glyphicon-remove-circle"></span>
						
		

						&nbsp; <input type="search" class="form-control w-15"
							id="searchinput" name="eMail" placeholder="Search By Email"
							value=${address}>
							
							
							 <select name="val1" class="custom-select">
							 
							 <option value="${value}"
										>${value}</option>
        <option value="5">5</option>
        <option value="10">10</option>
        <option value="25">25</option>
        <option value="30">330</option>
        </select>
							
							 <span id="searchclear"
							class="glyphicon glyphicon-remove-circle"></span> &nbsp; &nbsp; <input
							type="submit" value="Search"
							class="btn btn-primary btn-rounded   search"> <input
							type="reset" value="Clear" class="btn btn-danger   search">
							
							
							
							
							
							
							
							

						&nbsp; &nbsp; &nbsp;<a href=""
							class="btn btn-primary btn-rounded mb-1 w-10 text-center button"
							data-toggle="modal" data-target="#modalRegisterForm"> Add
							Details</a>


					</div>



					<!-- <script>

                       $("#searchclear").click(function(){
                        $("#searchinput").val('');
                        });


</script> -->





				</form>
			</div>
		</div>
		
		
		
			
		<div class="container p-0">
		
		
		<%-- <form action="/recordsPerPage">
       
        <select name="val1"  class="custom-select" style="width: 100px;" >
        <option value="${value}">${value}</option>
										
        <option value="5">5</option>
        <option value="10">10</option>
        <option value="25">25</option>
        <option value="30">30</option>
        </select>
       
        <input type="submit" value="Submit">
        </form>
 --%>


		<!-- Add Details -->
		<!-- <div class="text-center">
			<a href="" class="btn btn-primary btn-rounded mb-1 w-20 text-center"
				data-toggle="modal" data-target="#modalRegisterForm"> AddDetails</a>
		</div> -->


		<%-- <h3>${delete}</h3>
		<h3>${update}</h3>
		<h3>${details}</h3> --%>

		<table class="table table-striped" border="1">

			<thead class="bg-primary text-white">
				<tr>


					<th scope="col" class="text-center">Id</th>
					<th scope="col" class="text-center">Name</th>
					<th scope="col" class="text-center">Salary</th>
					<th scope="col" class="text-center">Mobile</th>
					<th scope="col" class="text-center">Email</th>
					<!-- <th>Bank account</th> -->
					<th scope="col" class="text-center">Actions</th>
					<!-- <th scope="col" class="text-center"></th> -->
				</tr>
			</thead>

			<tbody>

				<c:forEach items="${emp}" var="b">
					<tr>


						<td style="padding: 10px" class="text-center">${b.empId}</td>
						<td class="text-center">${b.eName}</td>
						<td class="text-center">${b.eSalary}</td>
						<td class="text-center">${b.mobile}</td>
						<td class="text-center">${b.eMail}</td>
						
						<%-- <td>${b.getAccount()}  
						<br> <br>${b.addresses}
						</td> --%>
				
						<td class="text-center">
						
				
											<strong> <span style="color: blue;"> <a
													
													href="/editById?action=edit&val=${page}&id=${b.empId}"
													data-toggle="tooltip" data-placement="top" title="Edit">
														<i class="fa fa-edit"></i>Edit &nbsp;

												</a>

											</span>


											</strong>

										
								
								
								
								
							

											<strong>
											
											
								<a onclick="deleteEmp(${b.empId})"> <span
									style="padding-left: 5px; padding-right: 1px; color: red"
									data-toggle="tooltip" data-placement="top" title="Delete"><i
										class="fa fa-trash"> Delete </i></span></a>




						</strong>


										
						</td>
											</tr>
				</c:forEach>
			</tbody>

		</table>

		

		<div class="modal fade" id="modalRegisterForm" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">


			<div class="modal-dialog" role="document">

				<div class="modal-content">
					<div class="modal-header text-center">

					

						<h4 class="modal-title w-100 font-weight-bold">Add Details Here</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<section>



						<form action="/insert" method="POST" id="form"
							class="row g-3 p-3 form" id="form">




							<div class="col-md-6 field1">

								<label for="inputPassword4" class="form-label">Name</label> <input
									type="text" class="form-control" name="eName" id="uname"
									placeholder="Name"> <span
									class="material-icons success">check_circle</span> <br> <span
									class="material-icons error ">error</span> <small>Error
									message</small>
							</div>

							<div class="col-md-6 field1">

								<label for="inputPassword4" class="form-label">Email</label> <input
									type="email" class="form-control" name="eMail" id="email"
									placeholder="Email"> <span
									class="material-icons success">check_circle</span> <br> <span
									class="material-icons error ">error</span> <small>Error
									message</small>
							</div>


							<div class="col-md-6 field1">

								<label for="inputPassword4" class="form-label">Salary</label> <input
									type="number" class="form-control" name="eSalary" id="salary"
									placeholder="Salary"> <span
									class="material-icons success">check_circle</span> <span
									class="material-icons error ">error</span> <br> <small>Error
									message</small>

							</div>



							<div class="col-md-6 field1">

								<label for="inputAddress" class="form-label">Mobile</label> <input
									type="text" class="form-control" name="mobile" id="mobile"
									placeholder="Mobile"> <span
									class="material-icons success">check_circle</span> <span
									class="material-icons error ">error</span> <br> <small>Error
									message</small>
							</div>

							<div class="col-md-12 field1">
								<label>Address</label>
							</div>


							<div class="col-md-6 field1">

								<input type="text" class="form-control" name="line1"
									id="address" placeholder="AddressLine1"> <span
									class="material-icons success">check_circle</span> <span
									class="material-icons error ">error</span> <br> <small>Error
									message</small>

							</div>

							<div class="col-md-6 field1">

								<input type="text" class="form-control" id="inputPassword4"
									placeholder="AddressLine2 (optional)" name="line2">



							</div>



							<div class="col-md-6 field1">

								<input type="text" class="form-control" name="street"
									id="street" placeholder="Street"> <span
									class="material-icons success">check_circle</span> <span
									class="material-icons error ">error</span> <br> <small>Error
									message</small>

							</div>

							<div class="col-md-6 field1">

								<input type="text" class="form-control" id="village"
									placeholder="Village" name="village"> <span
									class="material-icons success">check_circle</span> <span
									class="material-icons error ">error</span> <br> <small>Error
									message</small>

							</div>

							<div class="col-md-5 field1">

								<input type="text" class="form-control" id="city"
									placeholder="City/District/Town" name="city"> <span
									class="material-icons success">check_circle</span> <span
									class="material-icons error ">error</span> <br> <small>Error
									message</small>



							</div>

							<div class="col-md-5 field1">

								<input type="text" class="form-control" id="pin"
									placeholder="Pin" name="pin"> <span
									class="material-icons success">check_circle</span> <span
									class="material-icons error ">error</span> <br> <small>Error
									message</small>

							</div>

							<div class="col-md-3">

								<select name="state" id="state">
									<option>select State</option>
									<option value="Andhra Pradesh">Andhra Pradesh</option>
									<option value="Andaman and Nicobar Islands">Andaman
										and Nicobar Islands</option>
									<option value="Arunachal Pradesh">Arunachal Pradesh</option>
									<option value="Assam">Assam</option>
									<option value="Bihar">Bihar</option>
									<option value="Chandigarh">Chandigarh</option>
									<option value="Chhattisgarh">Chhattisgarh</option>
									<option value="Dadar and Nagar Haveli">Dadar and Nagar
										Haveli</option>
									<option value="Daman and Diu">Daman and Diu</option>
									<option value="Delhi">Delhi</option>
									<option value="Lakshadweep">Lakshadweep</option>
									<option value="Puducherry">Puducherry</option>
									<option value="Goa">Goa</option>
									<option value="Gujarat">Gujarat</option>
									<option value="Haryana">Haryana</option>
									<option value="Himachal Pradesh">Himachal Pradesh</option>
									<option value="Jammu and Kashmir">Jammu and Kashmir</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Karnataka">Karnataka</option>
									<option value="Kerala">Kerala</option>
									<option value="Madhya Pradesh">Madhya Pradesh</option>
									<option value="Maharashtra">Maharashtra</option>
									<option value="Manipur">Manipur</option>
									<option value="Meghalaya">Meghalaya</option>
									<option value="Mizoram">Mizoram</option>
									<option value="Nagaland">Nagaland</option>
									<option value="Odisha">Odisha</option>
									<option value="Punjab">Punjab</option>
									<option value="Rajasthan">Rajasthan</option>
									<option value="Sikkim">Sikkim</option>
									<option value="Tamil Nadu">Tamil Nadu</option>
									<option value="Telangana">Telangana</option>
									<option value="Tripura">Tripura</option>
									<option value="Uttar Pradesh">Uttar Pradesh</option>
									<option value="Uttarakhand">Uttarakhand</option>
									<option value="West Bengal">West Bengal</option>
								</select>

							</div>

							<div class="col-md-4" style="padding-left: 10%;">

								<select id="country" name="country">
									<option>select country</option>
									<option value="AF">Afghanistan</option>
									<option value="AX">Aland Islands</option>
									<option value="AL">Albania</option>
									<option value="DZ">Algeria</option>
									<option value="AS">American Samoa</option>
									<option value="AD">Andorra</option>
									<option value="AO">Angola</option>
									<option value="AI">Anguilla</option>
									<option value="AQ">Antarctica</option>
									<option value="AG">Antigua and Barbuda</option>
									<option value="AR">Argentina</option>
									<option value="AM">Armenia</option>
									<option value="AW">Aruba</option>
									<option value="AU">Australia</option>
									<option value="AT">Austria</option>
									<option value="IN">India</option>
									<option value="ID">Indonesia</option>
									<option value="IR">Iran, Islamic Republic of</option>
									<option value="IQ">Iraq</option>
									<option value="IE">Ireland</option>
									<option value="IM">Isle of Man</option>
									<option value="IL">Israel</option>
									<option value="IT">Italy</option>
									<option value="JM">Jamaica</option>
									<option value="JP">Japan</option>

								</select>

							</div>




							<div class="col-md-12 field1">
								<label>Address Type</label>
							</div>





							<div class="col-md-12 field1">

								<input class="form-check-input" type="radio" name="addressType"
									id="addressType" value="1"> <label
									class="form-check-label" for="inlineRadio1">Home</label> <span
									class="material-icons error ">error</span> <br> <small>Error
									message</small>

								<!-- 		<div class="field1"> -->

								<input class="form-check-input" type="radio" name="addressType"
									id="addressType2" value="2"> <label
									class="form-check-label" for="inlineRadio2">Office</label>

								<!-- </div> -->
								<!-- <h4 id="error1" style= "color:red"> </h4> -->

							</div>



<div class="col-md-12 field1">
								<strong><label>Bank  Account</label></strong>
								
							</div>


							<div class="col-md-6 field1">

								<input type="text" class="form-control" name="cif"
									id="address" placeholder="cid">
							</div>

							<div class="col-md-6 field1">

								<input type="text" class="form-control" id="inputPassword4"
									placeholder="AccountNumber " name="accountNumber">

                               <span class="material-icons success">check_circle</span> <span
									class="material-icons error ">error</span> <br> <small>Error
									message</small>
							</div>
							
							
							
							
							<div class="col-md-6 field1">

								<input type="text" class="form-control" id="inputPassword4"
									placeholder="accountName " name="Account Holder Name">

                               <span class="material-icons success">check_circle</span> <span
									class="material-icons error ">error</span> <br> <small>Error
									message</small>
							</div>
							
							
							
							
							<div class="col-md-6 field1">

								<input type="text" class="form-control" id="inputPassword4"
									placeholder="Father " name="father">

                               <span class="material-icons success">check_circle</span> <span
									class="material-icons error ">error</span> <br> <small>Error
									message</small>
							</div>
							
							



							<div class="col-md-6 field1">

								<input type="text" class="form-control" name="ifsc"
									id="street" placeholder="IFC CODE"> <span
									class="material-icons success">check_circle</span> <span
									class="material-icons error ">error</span> <br> <small>Error
									message</small>

							</div>

							

							

							
							
							<div class="col-md-12 field1">
								<label>Account Type</label>
							</div>





							<div class="col-md-12 field1">

								<input class="form-check-input" type="radio" name="accountType"
									id="accountType" value="1"> <label
									class="form-check-label" for="inlineRadio1">Saving</label> <span
									class="material-icons error ">error</span> <br> <small>Error
									message</small>

								<!-- 		<div class="field1"> -->

								<input class="form-check-input" type="radio" name="accountType"
									id="accountType2" value="2"> <label
									class="form-check-label" for="inlineRadio2">Current</label>

								<!-- </div> -->
								<!-- <h4 id="error1" style= "color:red"> </h4> -->

							</div>



						



							<div class="col-md-12 field1">

								<input class="form-control btn btn-primary" type="submit"></input>

							</div>

						</form>
						<script src="js/form.js"></script>


					</section>
				</div>

			</div>
		</div>
		<script src="js/form.js"></script>







<%-- <nav aria-label="...">
		<form action="/page" class="${count1 == null? 'hide':''}">
			<ul class="pagination">
				
				<li class="page-item ${page<2? 'disabled':'enable'}">
				
				
				
				<a class="page-link" href="/page?val=${page-1}" tabindex="-1">
					< </a>
				
				</li>&nbsp; &nbsp;
                  <li class="page-item"><c:forEach items="${count1}" var="z">
						<tr>
							<td><input type="submit" name="val" value="${z}"
								class=" btn btn-light w-1  ${page==z? 'test': ''}">
							</td>
						</tr>
					</c:forEach></li>&nbsp; &nbsp;
				<li class="page-item ${page==lastPage? 'disabled':'enable'}"><a
					class="page-link" href="/page?val=${page+1}"> > </a></li>
				<li class="page-item ${page==lastPage? 'disabled':'enable'}"><a
					class="page-link" href="/employee?val=${lastPage}">Last</a></li>
			</ul>
			<script src="button.js"></script>
		</form>
	</nav>
 --%>



                
                <c:if test="${actionName!='edit' && actionName!= 'editAddress' && actionName!='addNewAddress' }">


			<form action="/page" class="${count1 == null? 'hide':''} ">
				<a href="/page?val=${firstPage}" class=" btn btn-light w-1">
					<< </a> 
					
					
					<a href="/page?val=${previousPage-1}"
					class=" btn btn-light w-1"> < </a>&nbsp; &nbsp;

				<c:forEach items="${count1}" var="z">
					<tr>
						<td><input type="submit" name="val" value="${z}"
							class=" btn btn-light w-1 ${page==z? 'test': ''}">


						</td>

					</tr>
				</c:forEach>
				<%-- <input type="submit" name="val"  value="${nextPage+1}"	class="btn btn-primary w-1}"> --%>



				&nbsp; &nbsp;<a href="/page?val=${nextPage+1}" class=" btn btn-light w-1"> > </a> 
				<a
					href="/page?val=${lastPage}" class=" btn btn-light w-1">>></a>
				<script src="button.js"></script>
			</form>

		</c:if>













		

	</div>























	<div class="container p-0 ">
		<%-- ${actionName}# actionName:: ${actionName != null} ## ${fail} --%>
		<c:if
			test="${actionName != null && actionName != '' && actionName== 'edit' || actionName=='editAddress' || actionName=='addNewAddress'}">
			<div class="m-9 ">
				<%-- Form view::<br /> Action:: ${actionName}<br /> --%>


				

				






					<c:if test="${actionName=='edit' || actionName== 'editAddress' || actionName=='addNewAddress' }">
					<h4 class="text-center text-primary">EDIT DETAILS</h4>


					<section class="container my-2 bg-white w-50 text-dark p-2 card">

						<form action="/update" method="POST" id="form"
							class="row g-3 p-3 form" id="form">


							<div class="col-md-12 field1">

								<label>Id</label> <input type="text" name="empId"
									value="${b.empId}" readonly> <span
									class="material-icons success">check_circle</span> <span
									class="material-icons error ">error</span> <small>Error
									message</small>
							</div>




							<div class="col-md-6 field1">

								<label for="inputPassword4" class="form-label">Name</label> <input
									type="text" class="form-control" name="eName" id="uname"
									placeholder="Name" value="${b.eName}"> <span
									class="material-icons success">check_circle</span> <br> <span
									class="material-icons error ">error</span> <small>Error
									message</small>
							</div>

							<div class="col-md-6 field1">

								<label for="inputPassword4" class="form-label">Email</label> <input
									type="email" class="form-control" name="eMail" id="email"
									placeholder="Email" value="${b.eMail}"> <span
									class="material-icons success">check_circle</span> <br> <span
									class="material-icons error ">error</span> <small>Error
									message</small>
							</div>


							<%-- <div class="col-md-6 field1">

							<label for="inputPassword4" class="form-label">Salary</label> <input
								type="number" class="form-control" name="eSalary" id="salary"
								placeholder="Salary" value="${b.eSalary}"> <span
								class="material-icons success">check_circle</span> <span
								class="material-icons error ">error</span> <br> <small>Error
								message</small>

						</div> --%>



							<div class="col-md-6 field1">

								<label for="inputPassword4" class="form-label">Salary</label> <input
									type="number" class="form-control" name="eSalary" id="salary"
									placeholder="Salary" value="${b.eSalary}"> <span
									class="material-icons success">check_circle</span> <span
									class="material-icons error ">error</span> <br> <small>Error
									message</small>


							</div>



							<div class="col-md-6 field1">

								<label for="inputAddress" class="form-label">Mobile</label> <input
									type="text" class="form-control" name="mobile" id="mobile"
									placeholder="Mobile" value="${b.mobile}"> <span
									class="material-icons success">check_circle</span> <span
									class="material-icons error ">error</span> <br> <small>Error
									message</small>
							</div>

							

							<div class="col-md-12 field1">

								<input class="form-control btn btn-primary" type="submit"
									value="Update"></input> <a href="page?action"
									class="btn btn-danger btn-block">Cancel</a>

							</div>

							<script src="button.js"></script>


						</form>
					</section>
					
					
					
					
					
				
					<h3> <span class="badge badge-primary">Address Details</span></h3>
					
					<ul class="nav nav-tabs container" >
					
					
					<c:forEach items="${b.getAddresses()}" var="address">
							<li class="  <c:if test="${ address.id==selectSection }">? active </c:if>">
							<a class="nav-link     <c:if test="${ address.id==selectSection }"> active </c:if> "
										href=" /editAddress?action=editAddress&id=${address.id}&eid=${b.empId}" 
										><strong>section${loop}</strong> </a></li>
</c:forEach>    


<li> <strong><a class="  nav-link <c:if test="${ actionName=='addNewAddress' }"> active </c:if>"
									href="/addNewAddress?action=addNewAddress&id=${b.empId}"><span
										style="padding-left: 1px; padding-right: 1px;">+Add
											NewAddress</span> </a></strong>  </li>

 


							
									
						
									
									
						</ul>
						
						
					
			</c:if>
		</div>




					<!-- Bootstrap core JavaScript
    ================================================== -->
					<!-- Placed at the end of the document so the pages load faster -->
					<script
						src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
					<script
						src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


				</c:if>
			</div>
			
		

	<div class="container p-0 card "  style="border-top:none; border-bottom:none;">  
		<c:if test="${actionName=='addNewAddress'}">
			<h4 class="text-center text-primary">ADD NEW ADDRESS</h4>
			
			<section class="container my-2 bg-white w-50 text-dark p-2 card ">

			<form action="/updateAll" method="POST" id="form"
				class="row g-3 p-3 form" id="form" >


				<div class="col-md-12 field1"hidden>

					<label>Id</label> <input type="text" name="empId"
						value="${b.empId}" readonly> <span
						class="material-icons success">check_circle</span> <span
						class="material-icons error ">error</span> <small>Error
						message</small>
				</div>




				<div class="col-md-6 field1" hidden>

					<label for="inputPassword4" class="form-label">Name</label> <input
						type="text" class="form-control" name="eName" id="uname"
						placeholder="Name" value="${b.eName}"> <span
						class="material-icons success">check_circle</span> <br> <span
						class="material-icons error ">error</span> <small>Error
						message</small>
				</div>

				<div class="col-md-6 field1" hidden>

					<label for="inputPassword4" class="form-label">Email</label> <input
						type="email" class="form-control" name="eMail" id="email"
						placeholder="Email" value="${b.eMail}"> <span
						class="material-icons success">check_circle</span> <br> <span
						class="material-icons error ">error</span> <small>Error
						message</small>
				</div>




				<div class="col-md-6 field1"hidden>

					<label for="inputPassword4" class="form-label">Salary</label> <input
						type="number" class="form-control" name="eSalary" id="salary"
						placeholder="Salary" value="${b.eSalary}"> <span
						class="material-icons success">check_circle</span> <span
						class="material-icons error ">error</span> <br> <small>Error
						message</small>


				</div>



				<div class="col-md-6 field1">

					<label for="inputAddress" class="form-label">Mobile</label> <input
						type="text" class="form-control" name="mobile" id="mobile"
						placeholder="Mobile" value="${b.mobile}"> <span
						class="material-icons success">check_circle</span> <span
						class="material-icons error ">error</span> <br> <small>Error
						message</small>
				</div>

				<div class="col-md-12 field1">
					<label>New Address</label>
				</div>







				<div class="col-md-5 field1">




					<input type="text" class="form-control" name="line1" id="address"
						placeholder="AddressLine1""> <span
						class="material-icons success">check_circle</span> <span
						class="material-icons error ">error</span> <br> <small>Error
						message</small>

				</div>

				<div class="col-md-5 field1">

					<input type="text" class="form-control" id="inputPassword4"
						placeholder="AddressLine2 (optional)" name="line2">



				</div>



				<div class="col-md-6 field1">

					<input type="text" class="form-control" name="street" id="street"
						placeholder="Street"> <span class="material-icons success">check_circle</span>
					<span class="material-icons error ">error</span> <br> <small>Error
						message</small>

				</div>

				<div class="col-md-6 field1">

					<input type="text" class="form-control" id="village"
						placeholder="Village" name="village"> <span
						class="material-icons success">check_circle</span> <span
						class="material-icons error ">error</span> <br> <small>Error
						message</small>

				</div>

				<div class="col-md-5 field1">

					<input type="text" class="form-control" id="city"
						placeholder="City/District/Town" name="city"> <span
						class="material-icons success">check_circle</span> <span
						class="material-icons error ">error</span> <br> <small>Error
						message</small>



				</div>

				<div class="col-md-5 field1">

					<input type="text" class="form-control" id="pin" placeholder="Pin"
						name="pin"> <span class="material-icons success">check_circle</span>
					<span class="material-icons error ">error</span> <br> <small>Error
						message</small>

				</div>

				<div class="col-md-4">

					<select id="state" name="state">




						<option>Select State</option>
						<option value="Andhra Pradesh">Andhra Pradesh</option>
						<option value="Andaman and Nicobar Islands">Andaman and
							Nicobar Islands</option>
						<option value="Arunachal Pradesh">Arunachal Pradesh</option>
						<option value="Assam">Assam</option>
						<option value="Bihar">Bihar</option>
						<option value="Chandigarh">Chandigarh</option>
						<option value="Chhattisgarh">Chhattisgarh</option>
						<option value="Dadar and Nagar Haveli">Dadar and Nagar
							Haveli</option>
						<option value="Daman and Diu">Daman and Diu</option>
						<option value="Delhi">Delhi</option>
						<option value="Lakshadweep">Lakshadweep</option>
						<option value="Puducherry">Puducherry</option>
						<option value="Goa">Goa</option>
						<option value="Gujarat">Gujarat</option>
						<option value="Haryana">Haryana</option>
						<option value="Himachal Pradesh">Himachal Pradesh</option>
						<option value="Jammu and Kashmir">Jammu and Kashmir</option>
						<option value="Jharkhand">Jharkhand</option>
						<option value="Karnataka">Karnataka</option>
						<option value="Kerala">Kerala</option>
						<option value="Madhya Pradesh">Madhya Pradesh</option>
						<option value="Maharashtra">Maharashtra</option>
						<option value="Manipur">Manipur</option>
						<option value="Meghalaya">Meghalaya</option>
						<option value="Mizoram">Mizoram</option>
						<option value="Nagaland">Nagaland</option>
						<option value="Odisha">Odisha</option>
						<option value="Punjab">Punjab</option>
						<option value="Rajasthan">Rajasthan</option>
						<option value="Sikkim">Sikkim</option>
						<option value="Tamil Nadu">Tamil Nadu</option>
						<option value="Telangana">Telangana</option>
						<option value="Tripura">Tripura</option>
						<option value="Uttar Pradesh">Uttar Pradesh</option>
						<option value="Uttarakhand">Uttarakhand</option>
						<option value="West Bengal">West Bengal</option>
					</select>

				</div>

				<div class="col-md-4">

					<select id="country" name="country">

						<option>select country</option>
						<option value="AF">Afghanistan</option>
						<option value="AX">Aland Islands</option>
						<option value="AL">Albania</option>
						<option value="DZ">Algeria</option>
						<option value="AS">American Samoa</option>
						<option value="AD">Andorra</option>
						<option value="AO">Angola</option>
						<option value="AI">Anguilla</option>
						<option value="AQ">Antarctica</option>
						<option value="AG">Antigua and Barbuda</option>
						<option value="AR">Argentina</option>
						<option value="AM">Armenia</option>
						<option value="AW">Aruba</option>
						<option value="AU">Australia</option>
						<option value="AT">Austria</option>
						<option value="IN">India</option>
						<option value="ID">Indonesia</option>
						<option value="IR">Iran, Islamic Republic of</option>
						<option value="IQ">Iraq</option>
						<option value="IE">Ireland</option>
						<option value="IM">Isle of Man</option>
						<option value="IL">Israel</option>
						<option value="IT">Italy</option>
						<option value="JM">Jamaica</option>
						<option value="JP">Japan</option>

					</select>

				</div>




				<div class="col-md-12 field1">
					<label>Address Type</label>
				</div>





				<div class="col-md-12 field1">

					<input class="form-check-input" type="radio" name="addressType"
						id="addressType" value="1"> <label
						class="form-check-label" for="inlineRadio1">Home</label> <span
						class="material-icons error ">error</span> <br> <small>Error
						message</small>

					<!-- 		<div class="field1"> -->

					<input class="form-check-input" type="radio" name="addressType"
						id="addressType2" value="2"> <label
						class="form-check-label" for="inlineRadio2">Office</label>

					<!-- </div> -->
					<!-- <h4 id="error1" style= "color:red"> </h4> -->

				</div>
				<br> <br>


				<div class="col-md-12 field1">

					<input class="form-control btn btn-primary" type="submit"></input>
					<a href="page?action" class="btn btn-danger btn-block">Cancel</a>

				</div>

				<script src="button.js"></script>


			</form>
			</section>
		</c:if>
		
		</div>

	
	
	<div class="container p-0 card "  style="border-top:none; border-bottom:none;">  
	
	
	<div class="tab-content clearfix ">
<div class="tab-pane <c:if test="${ actionName=='editAddress' }"> active </c:if>  ">
								<%-- <h3>We use the class nav-pills instead of nav-tabs which
									automatically creates a background color for the tab    ${actionName} ${b.empId}</h3> --%>
									
									
									
									<div class="card "  style="border-top:none; ">
									
									
									
									
									<c:forEach items="${b.getAddresses()}" var="address">
									${address.id }
									</c:forEach>
									
									
									
									
									
									 <strong style="position: absolute; top: 0; right: 0; width: 100px; text-align:right;"> <a
											
												onclick="deleteAddress(${addressData.id})"> <span
													style="padding-left: 5px; padding-right: 1px; color: red"
													data-toggle="tooltip" data-placement="bottom" title="Delete">
														<i class="fa fa-trash"> Delete </i>
												</span></a>
											</strong>
									
									
									<section class="container my-2 bg-white w-50 text-dark p-2 card "  >

						<h4 class="text-center text-primary"> <strong>ADDRESS DETAILS</strong></h4>


						<form action="/updateAddress" method="get" id="form"
							class="row g-3 p-3 form " id="form">
							
							
							
							
							
							<%-- <div class="col-md-12 field1">

								<label hidden>Id</label> <input type="text" name="empId"
									value="${b.empId}" readonly hidden> <span
									class="material-icons success">check_circle</span> <span
									class="material-icons error ">error</span> <small>Error
									message</small>
							</div> --%>


						<%-- 	<div class="col-md-12 field1">

								<label>Id</label> <input type="text" name="empId"
									value="${b.empId}" readonly> <span
									class="material-icons success">check_circle</span> <span
									class="material-icons error ">error</span> <small>Error
									message</small>
							</div>




							<div class="col-md-6 field1">

								<label for="inputPassword4" class="form-label">Name</label> <input
									type="text" class="form-control" name="eName" id="uname"
									placeholder="Name" value="${b.eName}"> <span
									class="material-icons success">check_circle</span> <br> <span
									class="material-icons error ">error</span> <small>Error
									message</small>
							</div>

							<div class="col-md-6 field1">

								<label for="inputPassword4" class="form-label">Email</label> <input
									type="email" class="form-control" name="eMail" id="email"
									placeholder="Email" value="${b.eMail}"> <span
									class="material-icons success">check_circle</span> <br> <span
									class="material-icons error ">error</span> <small>Error
									message</small>
							</div>


							<div class="col-md-6 field1">

							<label for="inputPassword4" class="form-label">Salary</label> <input
								type="number" class="form-control" name="eSalary" id="salary"
								placeholder="Salary" value="${b.eSalary}"> <span
								class="material-icons success">check_circle</span> <span
								class="material-icons error ">error</span> <br> <small>Error
								message</small>

						</div>



							<div class="col-md-6 field1">

								<label for="inputPassword4" class="form-label">Salary</label> <input
									type="number" class="form-control" name="eSalary" id="salary"
									placeholder="Salary" value="${b.eSalary}"> <span
									class="material-icons success">check_circle</span> <span
									class="material-icons error ">error</span> <br> <small>Error
									message</small>


							</div>



							<div class="col-md-6 field1">

								<label for="inputAddress" class="form-label">Mobile</label> <input
									type="text" class="form-control" name="mobile" id="mobile"
									placeholder="Mobile" value="${b.mobile}"> <span
									class="material-icons success">check_circle</span> <span
									class="material-icons error ">error</span> <br> <small>Error
									message</small>
							</div>--%>

							<div class="col-md-12 field1">
								<strong><label>Address:</label></strong>
							</div> 




							<%-- 			<c:forEach items="${b.addresses}" var="data"> --%>

							<div class="col-md-12 field1">

								<label hidden>Id</label> <input type="text" name="id"
									value="${addressData.id}" readonly hidden> <span
									class="material-icons success">check_circle</span> <span
									class="material-icons error ">error</span> <small>Error
									message</small>

							</div>


							<div class="col-md-5 field1">
							<strong>Line1</strong>
								<input type="text" class="form-control" name="line1"
									id="address" placeholder="AddressLine1"
									value="${addressData.line1}"> <span
									class="material-icons success">check_circle</span> <span
									class="material-icons error ">error</span> <br> <small>Error
									message</small>

							</div>

							<div class="col-md-5 field1">
                                <strong>Line2</strong>
								<input type="text" class="form-control" id="inputPassword4"
									placeholder="AddressLine2 (optional)" name="line2"
									value="${addressData.line2}">



							</div>



							<div class="col-md-6 field1">
                                     <strong>Street</strong>
								<input type="text" class="form-control" name="street"
									id="street" placeholder="Street" value="${addressData.street}">
								<span class="material-icons success">check_circle</span> <span
									class="material-icons error ">error</span> <br> <small>Error
									message</small>

							</div>

							<div class="col-md-6 field1">
                                   <strong>Village</strong>
								<input type="text" class="form-control" id="village"
									placeholder="Village" name="village"
									value="${addressData.village}"> <span
									class="material-icons success">check_circle</span> <span
									class="material-icons error ">error</span> <br> <small>Error
									message</small>

							</div>

							<div class="col-md-5 field1">
                                      <strong>City/District/Town</strong>
								<input type="text" class="form-control" id="city"
									placeholder="City/District/Town" name="city"
									value="${addressData.city}"> <span
									class="material-icons success">check_circle</span> <span
									class="material-icons error ">error</span> <br> <small>Error
									message</small>



							</div>

							<div class="col-md-5 field1">
                                <strong>Pin</strong>
								<input type="text" class="form-control" id="pin"
									placeholder="Pin" name="pin" value="${addressData.pin}">
								<span class="material-icons success">check_circle</span> <span
									class="material-icons error ">error</span> <br> <small>Error
									message</small>

							</div>

							<div class="col-md-4">

								<select id="state" name="state">

									<option value="${addressData.state}"
										${addressData.state == selectedDept ? 'selected="selected"' : ''}>${addressData.state}</option>


									<option>Select State</option>
									<option value="Andhra Pradesh">Andhra Pradesh</option>
									<option value="Andaman and Nicobar Islands">Andaman
										and Nicobar Islands</option>
									<option value="Arunachal Pradesh">Arunachal Pradesh</option>
									<option value="Assam">Assam</option>
									<option value="Bihar">Bihar</option>
									<option value="Chandigarh">Chandigarh</option>
									<option value="Chhattisgarh">Chhattisgarh</option>
									<option value="Dadar and Nagar Haveli">Dadar and Nagar
										Haveli</option>
									<option value="Daman and Diu">Daman and Diu</option>
									<option value="Delhi">Delhi</option>
									<option value="Lakshadweep">Lakshadweep</option>
									<option value="Puducherry">Puducherry</option>
									<option value="Goa">Goa</option>
									<option value="Gujarat">Gujarat</option>
									<option value="Haryana">Haryana</option>
									<option value="Himachal Pradesh">Himachal Pradesh</option>
									<option value="Jammu and Kashmir">Jammu and Kashmir</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Karnataka">Karnataka</option>
									<option value="Kerala">Kerala</option>
									<option value="Madhya Pradesh">Madhya Pradesh</option>
									<option value="Maharashtra">Maharashtra</option>
									<option value="Manipur">Manipur</option>
									<option value="Meghalaya">Meghalaya</option>
									<option value="Mizoram">Mizoram</option>
									<option value="Nagaland">Nagaland</option>
									<option value="Odisha">Odisha</option>
									<option value="Punjab">Punjab</option>
									<option value="Rajasthan">Rajasthan</option>
									<option value="Sikkim">Sikkim</option>
									<option value="Tamil Nadu">Tamil Nadu</option>
									<option value="Telangana">Telangana</option>
									<option value="Tripura">Tripura</option>
									<option value="Uttar Pradesh">Uttar Pradesh</option>
									<option value="Uttarakhand">Uttarakhand</option>
									<option value="West Bengal">West Bengal</option>
								</select>

							</div>

							<div class="col-md-4">

								<select id="country" name="country">
									<option value="${addressData.country}"
										${addressData.country == selectedDept ? 'selected="selected"' : ''}>${addressData.country}</option>
									<option>select country</option>
									<option value="AF">Afghanistan</option>
									<option value="AX">Aland Islands</option>
									<option value="AL">Albania</option>
									<option value="DZ">Algeria</option>
									<option value="AS">American Samoa</option>
									<option value="AD">Andorra</option>
									<option value="AO">Angola</option>
									<option value="AI">Anguilla</option>
									<option value="AQ">Antarctica</option>
									<option value="AG">Antigua and Barbuda</option>
									<option value="AR">Argentina</option>
									<option value="AM">Armenia</option>
									<option value="AW">Aruba</option>
									<option value="AU">Australia</option>
									<option value="AT">Austria</option>
									<option value="IN">India</option>
									<option value="ID">Indonesia</option>
									<option value="IR">Iran, Islamic Republic of</option>
									<option value="IQ">Iraq</option>
									<option value="IE">Ireland</option>
									<option value="IM">Isle of Man</option>
									<option value="IL">Israel</option>
									<option value="IT">Italy</option>
									<option value="JM">Jamaica</option>
									<option value="JP">Japan</option>

								</select>

							</div>




							<div class="col-md-12 field1">
								<strong><label>Address Type</label></strong>
							</div>





							<div style="padding-left: 10%;">


								<input class="form-check-input" type="radio" name="addressType"
									id="addressType" value="1"
									<c:if test="${addressData.addressType=='1'}">checked</c:if>>

								<label class="form-check-label" for="inlineRadio1">Home</label>&nbsp;





								<div class="form-check form-check-inline">

									<input class="form-check-input" type="radio" name="addressType"
										id="addressType2" value="2"
										<c:if test="${addressData.addressType=='2'}">checked</c:if>>
									<label class="form-check-label" for="inlineRadio2">Office</label>

								</div>






							</div>


							<%-- </c:forEach> --%>

							<div class="col-md-12 field1">

								<input class="form-control btn btn-primary" type="submit"
									value="Update"></input> <a href="page?action"
									class="btn btn-danger btn-block">Cancel</a>

							</div>

							<script src="button.js"></script>


						</form>
					</section>
					
					</div>
									
									</div>
									</div>
	
	</div>
	
					








<%-- 
	<c:forEach items="${list3}" var="z1">

		<h3>${z1}</h3>

	</c:forEach>
	 --%>
	
	
	
	<br><br>
	
	
	
	
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

<script> 
function passValue(){ 
	var value = document.getElementById("testId")
	console.log("value is " + value)
}
</script>
</html>



