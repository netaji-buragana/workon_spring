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
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
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
	color: white;
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
<script>
 function deleteAccount(bankid)
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
                 window.location="/deleteAccount/"+bankid;

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

</head>
<body>




<nav class="navbar navbar-expand-lg navbar-dark bg-info">
			
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>



			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li   class="nav-item col-6 col-lg-auto"><a class="nav-link py-2 px-0 px-lg-2 active" 
						href="/display"> Home 
					</a></li>
					<li   class="nav-item col-6 col-lg-auto">
					
					<a class="nav-link py-2 px-0 px-lg-2 active"  href="/page?action=">EMPLOYEE DETAILS  </a></li>
					
					
					
					<li   class="nav-item col-6 col-lg-auto">
					
					<a class="nav-link py-2 px-0 px-lg-2 active"
						href="/accounts-info"><strong>BANK ACCOUNTS </strong>
					</a></li>
					
					<li   class="nav-item col-6 col-lg-auto">
					
					<a class="nav-link py-2 px-0 px-lg-2 active"
						href="/projects-info">PROJECTS <span class="sr-only">(current)</span>
					</a></li>
					

				</ul>
				
			</div>
			 <a href="/logout" class="nav-item active" style="color:white;"><strong>Logout</strong></a>
			
			
		</nav>


	<div class="container p-0">




		<br />
		<div class="grid-container SearchContainer">

			<div class="grid-container ">
				<form action="/search-account1" class="form-inline text-right  w-100">
					<div class="form-group">
						&nbsp; <input type="search" class="form-control w-15"
							id="searchinput" name="empId" placeholder="Employee Id"
							value="${deleteid}"> <span id="searchclear"
							class="glyphicon glyphicon-remove-circle"></span> &nbsp; <input
							type="search" class="form-control w-15" id="searchinput"
							name="eName" placeholder="SearchByName" value=${name}> <span
							id="searchclear" class="glyphicon glyphicon-remove-circle"></span>


						&nbsp; <input type="search" class="form-control w-15"
							id="searchinput" name="accountNumber" placeholder="Search By AccountNumber"
							value=${accountNumber}> <span id="searchclear"
							class="glyphicon glyphicon-remove-circle"></span> &nbsp; <input
							type="search" class="form-control w-15" id="searchinput"
							name="mobile" placeholder="Search By Mobile" value=${mobile}>
						<span id="searchclear" class="glyphicon glyphicon-remove-circle"></span>



						&nbsp; <input type="search" class="form-control w-15"
							id="searchinput" name="eMail" placeholder="Search By Email"
							value=${address}> <span id="searchclear"
							class="glyphicon glyphicon-remove-circle"></span> &nbsp; &nbsp; <input
							type="submit" value="Search"
							class="btn btn-info btn-rounded   search"> <input
							type="reset" value="Clear" class="btn btn-danger   search">









						&nbsp; &nbsp; &nbsp;<a href=""
							class="btn btn-info btn-rounded mb-1 w-10 text-center button"
							data-toggle="modal" data-target="#modalRegisterForm"> Add
							Details</a>


					</div>







				</form>
			</div>
		</div>








		<table class="table table-striped" border="1">

			<thead class="bg-info text-white">
				<tr>


					<th scope="col" class="text-center">Id</th>
					<th scope="col" class="text-center">Name</th>
					<th scope="col" class="text-center">Account Number</th>
					<th scope="col" class="text-center">Mobile</th>
					<th scope="col" class="text-center">Email</th>
					<!-- <th scope="col" class="text-center">Father</th> -->
					<th scope="col" class="text-center">IFSC CODE</th>

					<th>Bank account Type</th>
					<th scope="col" class="text-center">Actions</th>
					<!-- <th scope="col" class="text-center"></th> -->
				</tr>
			</thead>

			<tbody>
			<c:forEach items="${emp1}" var="data">
			<tr>
			<td style="padding: 10px" class="text-center">  ${data[0]}</td> 
			<td style="padding: 10px" class="text-center">  ${data[1]}</td>
			<td style="padding: 10px" class="text-center">  ${data[2]}</td>
			<td style="padding: 10px" class="text-center">  ${data[3]}</td> 
			<td style="padding: 10px" class="text-center">  ${data[4]}</td> 
			<td style="padding: 10px" class="text-center">  ${data[5]}</td> 
			<td style="padding: 10px" class="text-center">  ${data[6]}</td>








						<td class="text-center ${data[7] != null? '':'hide'} ">

							<strong> <span style="color: blue;"> <a
									class="badge badge-light " style="color: blue;"
									href="/editByIdAccount?action=edit&val=${page}&id=${data[0]}"
									data-toggle="tooltip" data-placement="top" title="Edit"> <i
										class="fa fa-edit"></i>Edit &nbsp;

								</a>

							</span>
						</strong> <strong> <a class="badge badge-light"
								onclick="deleteAccount(${data[7]})"> <span
									style="padding-left: 5px; padding-right: 1px; color: red"
									data-toggle="tooltip" data-placement="top" title="Delete">
										<i class="fa fa-trash"> Delete
											${data[7]} </i>
								</span></a>
						</strong>
						</td>


						<td class="text-center ${data[7]== null  ? '':'hide'} ">

							<span style="color: blue;"> <a class="badge badge-light "
								style="color: green;"
								href="/editByIdAccount?action=addNewAccount&val=${page}&id=${data[0]}"
								data-toggle="tooltip" data-placement="top" title="Edit"> <i></i><strong>+Add
										Account </strong>&nbsp;

							</a>

						</span>


						</td>








					</tr>
					</c:forEach>

				<c:forEach items="${emp}" var="b">
				
				
				
					<tr>


						<td style="padding: 10px" class="text-center">${b.empId} </td>
						<td class="text-center">${b.eName}</td>
						<td class="text-center">${b.getAccount().getAccountNumber()}</td>
						<td class="text-center">${b.mobile}</td>
						<td class="text-center">${b.eMail}</td>
						<%-- <td class="text-center">${b.getAccount().getFather()}</td> --%>
						<td class="text-center">${b.getAccount().getIfsc()}</td>
						<td>${b.getAccount().getAccountTypeValue()}<%-- <br> <br>${b.addresses} --%>
						</td>

						<td class="text-center ${b.getAccount()!= null? '':'hide'} "  >
						
						<strong> <span
								style="color: blue;"> <a class="badge badge-light " style="color: blue;"
									href="/editByIdAccount?action=edit&val=${page}&id=${b.empId}"
									data-toggle="tooltip" data-placement="top" title="Edit"> <i
										class="fa fa-edit"></i>Edit  &nbsp;

								</a>

							</span>
						</strong>
						 <strong> <a class="badge badge-light"
								onclick="deleteAccount(${b.getAccount().getBankid()})"> <span
									style="padding-left: 5px; padding-right: 1px; color: red"
									data-toggle="tooltip" data-placement="top" title="Delete">
										<i class="fa fa-trash"> Delete
											${b.getAccount().getBankid()} </i>
								</span></a>
						</strong></td>


						<td class="text-center ${b.getAccount() == null  ? '':'hide'} ">
							 
							<span style="color: blue;"> <a class="badge badge-light " style="color: green;"
									href="/editByIdAccount?action=addNewAccount&val=${page}&id=${b.empId}"
									data-toggle="tooltip" data-placement="top" title="Edit"> <i
										></i><strong>+Add Account </strong>&nbsp;

								</a>

							</span>
						

						</td>




					</tr>
		
				</c:forEach>
			</tbody>

		</table>
		
		
		
		
		<form action="/accounts-info" class="${count1 == null? 'hide':''} ">
				<a href="/accounts-info?val=${firstPage}" class=" btn btn-light w-1">
					<< </a> 
					
					
					<a href="/accounts-info?val=${page-1}"
					class=" btn btn-light w-1"> < </a>&nbsp; &nbsp;

				<c:forEach items="${count1}" var="z">
					<tr>
						<td><input type="submit" name="val" value="${z}"
							class=" btn btn-light w-1 ${page==z? 'test': ''}">


						</td>

					</tr>
				</c:forEach>
				<%-- <input type="submit" name="val"  value="${nextPage+1}"	class="btn btn-primary w-1}"> --%>



				&nbsp; &nbsp;<a href="/accounts-info?val=${page+1}"
					class=" btn btn-light w-1"> ></a> <a
					href="accounts-info?val=${lastPage}" class=" btn btn-light w-1">>></a>
				<script src="button.js"></script>
			</form>
		
		
		
		
		<c:if
			test="${  actionName=='addNewAccount' }">
			<h4 class="text-center text-primary">Add Account</h4>


			<section class="container my-2 bg-white w-50 text-dark p-2 card">



				<form action="/updateAccount" method="POST"
					class="row g-3 p-3 form" >





					<div class="col-md-12 field1" hidden>

						<label>Id</label> <input type="text" name="empId"
							value="${b.empId}" readonly> <span
							class="material-icons success">check_circle</span> <span
							class="material-icons error ">error</span> <small>Error
							message</small>
					</div>




					<div class="col-md-6 field1" hidden>

						<label  class="form-label">Name</label> <input
							type="text" class="form-control" name="eName" 
							placeholder="Name" value="${b.eName }"> <span
							class="material-icons success">check_circle</span> <br> <span
							class="material-icons error ">error</span> <small>Error
							message</small>
					</div>

					<div class="col-md-6 field1" hidden>

						<label  class="form-label">Email</label> <input
							type="text" class="form-control" name="eMail" 
							placeholder="Email" value="${b.eMail}"> <span
							class="material-icons success">check_circle</span> <br> <span
							class="material-icons error ">error</span> <small>Error
							message</small>
					</div>


					<div class="col-md-6 field1" hidden>

						<label  class="form-label">Salary</label> <input
							type="number" class="form-control" name="eSalary"
							value="${b.eSalary }"> <span
							class="material-icons success">check_circle</span> <span
							class="material-icons error ">error</span> <br> <small>Error
							message</small>

					</div>



					<div class="col-md-6 field1" hidden>

						<label  class="form-label">Mobile</label> <input
							type="text" class="form-control" name="mobile" 
							value="${b.mobile }"> <span
							class="material-icons success">check_circle</span> <span
							class="material-icons error ">error</span> <br> <small>Error
							message</small>
					</div>
		
		
		<div class="col-md-12 field1">
						<strong><label>Bank Account</label></strong>

					</div>


					<%-- <div class="col-md-6 field1" hidden>

						<input type="text" class="form-control" name="bankid" 
							value="${b.getAccount().getBankid()}">
					</div> --%>






					<div class="col-md-6 field1">
					<label>Account Number</label>

						<input type="text" class="form-control" 
							placeholder="AccountNumber " name="accountNumber"
							> <span
							class="material-icons success">check_circle</span> <span
							class="material-icons error ">error</span> <br> <small>Error
							message</small>
					</div>




					<div class="col-md-6 field1">
					<label>IFSC</label>

						<input type="text" class="form-control" name="ifsc" 
							placeholder="IFSC " > <span
							class="material-icons success">check_circle</span> <span
							class="material-icons error ">error</span> <br> <small>Error
							message</small>

					</div>







					<div class="col-md-12 field1">
						<label>Account Type</label>
					</div>





					<div class="col-md-12 field1">

						<input class="form-check-input" type="radio" name="accountType"
							 value="1"
							>
						<label class="form-check-label" for="inlineRadio1">Saving</label>
						<span class="material-icons error ">error</span> <br> <small>Error
							message</small>

						<!-- 		<div class="field1"> -->

						<input class="form-check-input" type="radio" name="accountType"
							 value="2"
							>
						<label class="form-check-label" for="inlineRadio2">Current
							</label>

						<!-- </div> -->
						<!-- <h4 id="error1" style= "color:red"> </h4> -->


					</div>
				


					<div class="col-md-12 field1">
						<input class="form-control btn btn-primary" type="submit"></input>

					</div>

				</form>
			<!-- 	<script src="js/form.js"></script> -->
			</section>
		
		</c:if>
		



		<c:if
			test="${actionName=='edit' || actionName== 'editAddress' || actionName=='addNewAddress' }">
			<h4 class="text-center text-primary">EDIT DETAILS</h4>


			<section class="container my-2 bg-white w-50 text-dark p-2 card">



				<form action="/updateAccount" method="POST"
					class="row g-3 p-3 form">





					<div class="col-md-12 field1" hidden>

						<label>Id</label> <input type="text" name="empId"
							value="${b.empId}" readonly> <span
							class="material-icons success">check_circle</span> <span
							class="material-icons error ">error</span> <small>Error
							message</small>
					</div>




					<div class="col-md-6 field1" >

						<label  class="form-label">Name</label> <input
							type="text" class="form-control" name="eName"
							placeholder="Name" value="${b.eName }"> <span
							class="material-icons success">check_circle</span> <br> <span
							class="material-icons error ">error</span> <small>Error
							message</small>
					</div>

					<div class="col-md-6 field1">

						<label  class="form-label">Email</label> <input
							type="email" class="form-control" name="eMail" 
							placeholder="Email" value="${b.eMail }"> <span
							class="material-icons success">check_circle</span> <br> <span
							class="material-icons error ">error</span> <small>Error
							message</small>
					</div>


					<div class="col-md-6 field1" hidden>

						<label  class="form-label">Salary</label> <input
							type="number" class="form-control" name="eSalary" 
							value="${b.eSalary }"> <span
							class="material-icons success">check_circle</span> <span
							class="material-icons error ">error</span> <br> <small>Error
							message</small>

					</div>



					<div class="col-md-6 field1">

						<label for="inputAddress" class="form-label">Mobile</label> <input
							type="text" class="form-control" name="mobile" 
							value="${b.mobile }"> <span
							class="material-icons success">check_circle</span> <span
							class="material-icons error ">error</span> <br> <small>Error
							message</small>
					</div>

					<%-- <div class="col-md-12 field1" hidden>
						<label>Address</label>
					</div>


					<c:forEach items="${b.getAddresses()}" var="address">






						<div class="col-md-12 field1" hidden>

							<label>Id</label> <input type="text" name="Id"
								value="${address.getId()}" readonly> <span
								class="material-icons success">check_circle</span> <span
								class="material-icons error ">error</span> <small>Error
								message</small>
						</div>



						<div class="col-md-6 field1" hidden>

							<input type="text" class="form-control" name="line1" id="address"
								value="${address.getLine1()}"> <span
								class="material-icons success">check_circle</span> <span
								class="material-icons error ">error</span> <br> <small>Error
								message</small>

						</div>

						<div class="col-md-6 field1" hidden>

							<input type="text" class="form-control" id="inputPassword4"
								value="${address.getLine2()}" name="line2">



						</div>



						<div class="col-md-6 field1" hidden>

							<input type="text" class="form-control" name="street" id="street"
								value="${address.getStreet()}"> <span
								class="material-icons success">check_circle</span> <span
								class="material-icons error ">error</span> <br> <small>Error
								message</small>

						</div>

						<div class="col-md-6 field1" hidden>

							<input type="text" class="form-control" id="village"
								value="${address.getVillage()}" name="village"> <span
								class="material-icons success">check_circle</span> <span
								class="material-icons error ">error</span> <br> <small>Error
								message</small>

						</div>

						<div class="col-md-5 field1" hidden>

							<input type="text" class="form-control" id="city"
								value="${address.getCity()}" name="city"> <span
								class="material-icons success">check_circle</span> <span
								class="material-icons error ">error</span> <br> <small>Error
								message</small>



						</div>

						<div class="col-md-5 field1" hidden>

							<input type="text" class="form-control" id="pin"
								value="${address.getPin()}" name="pin"> <span
								class="material-icons success">check_circle</span> <span
								class="material-icons error ">error</span> <br> <small>Error
								message</small>

						</div>

						<div class="col-md-4" hidden>

							<select id="state" name="state">

								<option value="${address.getState()}"
									${address.getState() == selectedDept ? 'selected="selected"' : ''}>${address.getState()}</option>


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

						<div class="col-md-4" hidden>

							<select id="country" name="country">
								<option value="${address.getCountry()}"
									${address.getCountry()== selectedDept ? 'selected="selected"' : ''}>${address.getCountry()}</option>
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




						<div class="col-md-12 field1" hidden>
							<strong><label>Address Type</label></strong>
						</div>





						<div style="padding-left: 10%;" hidden>


							<input class="form-check-input" type="radio" name="addressType"
								id="addressType" value="1"
								<c:if test="${address.getAddressType()=='1'}">checked</c:if>>

							<label class="form-check-label" for="inlineRadio1">Home</label>&nbsp;





							<div class="form-check form-check-inline" hidden>

								<input class="form-check-input" type="radio" name="addressType"
									id="addressType2" value="2"
									<c:if test="${address.getAddressType()=='2'}">checked</c:if>>
								<label class="form-check-label" for="inlineRadio2">Office</label>

							</div>

						</div>

					</c:forEach> --%>

					<div class="col-md-12 field1">
						<strong><label>Bank Account</label></strong>

					</div>


					<div class="col-md-6 field1" hidden>

						<input type="text" class="form-control" name="bankid" 
							value="${b.getAccount().getBankid()}">
					</div>






					<div class="col-md-6 field1">

						<input type="text" class="form-control" 
							placeholder="AccountNumber " name="accountNumber"
							value="${b.getAccount().getAccountNumber()}"> <span
							class="material-icons success">check_circle</span> <span
							class="material-icons error ">error</span> <br> <small>Error
							message</small>
					</div>




					<div class="col-md-6 field1">

						<input type="text" class="form-control" name="ifsc" 
							value="${b.getAccount().getIfsc()}"> <span
							class="material-icons success">check_circle</span> <span
							class="material-icons error ">error</span> <br> <small>Error
							message</small>

					</div>







					<div class="col-md-12 field1">
						<label>Account Type</label>
					</div>





					<div class="col-md-12 field1">

						<input class="form-check-input" type="radio" name="accountType"
							 value="1"
							<c:if test="${b.getAccount().getAccountType()=='1'}">checked</c:if>>
						<label class="form-check-label" for="inlineRadio1">Saving${b.getAccount().getAccountType() }</label>
						<span class="material-icons error ">error</span> <br> <small>Error
							message</small>

						<!-- 		<div class="field1"> -->

						<input class="form-check-input" type="radio" name="accountType"
							 value="2"
							<c:if test="${b.getAccount().getAccountType()=='2'}">checked</c:if>>
						<label class="form-check-label" for="inlineRadio2">Current
							${b.getAccount().getAccountType() }</label>

						<!-- </div> -->
						<!-- <h4 id="error1" style= "color:red"> </h4> -->


					</div>
				


					<div class="col-md-12 field1">
						<input class="form-control btn btn-primary" type="submit"></input>

					</div>

				</form>
				<script src="js/form.js"></script>
			</section>



		</c:if>
	</div>


</body>
</html>