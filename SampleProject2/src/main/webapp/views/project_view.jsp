<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

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

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
<link rel="stylesheet" href="css/style.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="./libs/jquery/1.10.1/jquery.min.js"></script>

<style>
.test {
	background-color: #87cefa !important;
}

.test2 {
	background-color: red !important;
}

.hide {
	display: none;
}
</style>
<script>
function projectdelete(projectId)
{
    swal({
        title: "Are you Want?",
        text: "Want to Delete Project",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
        .then((willDelete) => {
            if (willDelete) {
                window.location="/projectdelete/"+projectId;
            
            }
            /* else {
                swal("Not Deleted");
            } */
        });
}

</script>
</head>
<body>
	<!-- Nav -->
	
	
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			
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
					
					<a class="nav-link py-2 px-0 px-lg-2 active"  href="/page?action=">EMPLOYEE DETAILS</a></li>
					
					
					
					<li   class="nav-item col-6 col-lg-auto">
					
					<a class="nav-link py-2 px-0 px-lg-2 active"
						href="/accounts-info">BANK ACCOUNTS 
					</a></li>
					
					<li   class="nav-item col-6 col-lg-auto">
					
					<a class="nav-link py-2 px-0 px-lg-2 active"
						href="/projects-info"><strong>PROJECTS</strong> <span class="sr-only">(current)</span>
					</a></li>
					

				</ul>
				
			</div>
			
			<a href="/logout" class="nav-item active" style="color:white;"><strong>Logout</strong></a>
			
		</nav>


	<div class="container p-0">
	<!-- End Of Nav -->

	<br>
	<br>
	<br>
	<c:if test="${actionName=='updateEmp'}">
		<div style="width: 60%; padding-left: 30%;" class="text-center">
			<div class="alert alert-success alert-dismissible fade show"
				role="alert">
				<strong><%=session.getAttribute("message")%></strong>
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</div>
	</c:if>
	<c:if test="${delete!=null}">
		<div style="width: 60%; padding-left: 30%;" class="text-center">
			<div class="alert alert-danger alert-dismissible fade show"
				role="alert">
				<strong>${delete}</strong>
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</div>
	</c:if>

	<div class="container-sm">
		<div style="padding-top: 3px;" class="d-flex justify-content-end">
			<a href="/newproject?action=createProject"
				style="height: 38px; width: 200px;" class=" btn btn-dark"> <i
				class='fas fa-plus'></i>&nbsp;CREATE PROJECT
			</a>

		</div>
		<i class='fa fa-table'></i>&nbsp;<strong>PROJECTS TABLE</strong>
		<table class="table table-striped" border="1">
			<thead class="bg-dark text-white">
				<tr>
					<th scope="col">PROJECT ID</th>
					<th scope="col">PROJECT NAME</th>
					<th scope="col">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="project" items="${projects}">
					<tr>
						<td>${project.projectId}</td>
						<td>${project.title}</td>
						<td><a class="badge badge-info "
							href="/editProject?action=editProject&projectId=${project.projectId}">
								&nbsp;<i class='fas fa-edit'></i>Edit
						</a>&nbsp;&nbsp;&nbsp;
						<%-- <a class="badge badge-danger "
							onclick="projectdelete(${project.projectId})"> &nbsp;Delete<i
								class='fas fa-trash-alt'></i>
						</a> --%> 
						</td>
					</tr>
				</c:forEach> 
			</tbody>
		</table>
	</div>
	<div class="container-md">
		<div class="d-flex flex-row">
			<div class="grid-container ">
				<form action="/assignProject" method="post"
					class="form-inline text-right m-1 w-100" class="justify-content">
					<label for="employee_id">EMPLOYEE ID:</label> &nbsp;&nbsp;<input
						type="text" class="form-control" name="empId" required>
					&nbsp;&nbsp;<label for="projectId">PROJECT ID:</label>&nbsp;&nbsp;
					<input type="text" class="form-control" id="projectId"
						name="projectId" required> &nbsp;&nbsp;<input type="submit"
						class="btn btn-primary " value="Add Employee to Project">
				</form>

			</div>
		</div>
		<br>
<i class='fa fa-table ' style="color:blue;"></i>&nbsp;<strong style="color:blue;">EMPLOYEE PROJECT TABLE</strong>
		<table class="table table-striped" border="1">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">EMPLOYEE ID</th>
					<th scope="col">EMPLOYEE NAME</th>
					<th scope="col">PROJECT NAME</th>
					<!-- <th scope="col">ACTION</th> -->
				</tr>
			</thead>
			<tbody>
				<c:forEach var="Emp" items="${emp}">
					<tr>
						<td>${Emp.empId}</td>
						<td>${Emp.eName}</td>
						<td><c:forEach var="project" items="${Emp.projects}">
                        ${project.title}
                        <%--<td> <a
									class="badge badge-info ${Emp.projects != null? '':'hide'}"href="/accountEdit?action=editAccount&acId=${Emp.projects().getAcId()}&empId=${Emp.empId}"><span>
											<!-- style="padding-left: 10px; padding-right: 10px;" -->Edit
											&nbsp;<i class='fas fa-edit'></i></a>&nbsp;&nbsp;&nbsp;</td> --%>
							</c:forEach></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<form action="/projects-info" class="${count1 == null? 'hide':''} ">
				<a href="/projects-info?val=${firstPage}" class="btn btn-primary button1">
					<< </a> <a href="/projects-info?val=${page-1}"
					class="btn btn-primary button1"> < </a>&nbsp; &nbsp;

				<c:forEach items="${count1}" var="z">
					<tr>
						<td><input type="submit" name="val" value="${z}"
							class="btn btn-primary w-1 button1 ${page==z? 'test': ''}">


						</td>

					</tr>
				</c:forEach>
				<%-- <input type="submit" name="val"  value="${nextPage+1}"	class="btn btn-primary w-1}"> --%>



				&nbsp; &nbsp;<a href="/projects-info?val=${page+1}"
					class="btn btn-primary button1"> ></a> <a
					href="/projects-info?val=${lastPage}" class="btn btn-primary button1">>></a>
				<script src="button.js"></script>
			</form>
		
		
	</div>
	
	
	
	
	<c:if test="${actionName=='editProject'}">
		<div style="padding-left: 150px">
			<div class="card" style="width: 30rem;">
				<section class="container my-4 bg-white w-50 text-dark p-4">
					<header class="text-center text-dark">
						<h4>EDIT PROJECT</h4>
					</header>
					<form action="/updateProject?action=updateProject" method="POST"
						class="row g-2 p-2">
						<div class="col-md-12">
							<label>Project Id</label> <input type="text" class="form-control"
								name="projectId" value="${project.projectId}" readonly>
						</div>
						<div class="col-md-12">
							<label>Project Name</label> <input type="text"
								class="form-control" name="title" value="${project.title}">
						</div>
						<div class="col-md-6">
							<input class="form-control btn btn-primary" type="submit"
								value="Save"></input>
						</div>
						<div class="col-md-6">
							<a href="projects-info" class="form-control btn btn-danger"
								type="submit">Cancel</a>
						</div>
					</form>
				</section>
			</div>
		</div>
	</c:if>
	
	
	
	<c:if test="${actionName=='createProject'}">
			<div style="padding-left: 150px">
				<div class="card" style="width: 30rem;">
					<section class="container my-4 bg-white w-50 text-dark p-4">
						<header class="text-center text-dark">
							<h4>NEW PROJECT</h4>
						</header>
						<form action="/createProject?action=newProject" method="POST"
							class="row g-2 p-2">
							<div class="col-md-12">
								<label>Project Name</label> <input type="text" class="form-control"
									name="title" >
							</div>
							<div class="col-md-12">
								<input class="form-control btn btn-primary" type="submit" value="CREATE"></input>

							</div>
						</form>
					</section>
				</div>
			</div>
		</c:if>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
	<script src="js/address.js"></script>
	</div>
</body>
</html>