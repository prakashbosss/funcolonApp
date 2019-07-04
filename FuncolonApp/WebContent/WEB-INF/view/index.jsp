<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">

<head>
<title>Funcolon</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 550px
}

/* Set gray background color and 100% height */
.sidenav {
	background-color: #f1f1f1;
	height: 100%;
}

/* On small screens, set height to 'auto' for the grid */
@media screen and (max-width: 767px) {
	.row.content {
		height: auto;
	}
}
</style>
</head>
<body>

	<nav class="navbar navbar-inverse visible-xs">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Funcolon</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">${message}</a></li>
					<li><a href="#">Age</a></li>
					<li><a href="#">Gender</a></li>
					<li><a href="#">Geo</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-3 sidenav hidden-xs">
				<h2>Funcolon</h2>
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="#section1">${message}</a></li>
					<!-- <li><a href="login">Login(Not working)</a></li> -->
					<!-- Trigger the modal with a button -->
					<li><a href="#" data-toggle="modal" data-target="#myModal">Login</a></li>
					<li><a href="logout">Logout</a></li>
					<c:if test="${user.userRole == 'admin'}">
						<li><a href="logout">Manage Users</a></li>
						<li><a href="logout">Manage Courses</a></li>
					</c:if>
				</ul>
				<br>
			</div>
			<br>


			<!--  Login Modal -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Login</h4>
						</div>
						<form action="login" method="post" id="userLoginForm"
							name="userLoginForm">
							<div class="modal-body">
								<div class="form-group">
									<label for="email">User Name:</label> <input type="text"
										class="form-control" name="userName" id="userName">
								</div>
								<div class="form-group">
									<label for="pwd">Password:</label> <input type="password"
										class="form-control" name="userPwd" id="userPwd">
								</div>
							</div>
							<div class="modal-footer">
								<!-- <a  onclick="loginUser()">loginUser</a> -->
								<!-- <button type="button" class="btn btn-default"
									 onclick="loginUser()">Login JS</button> -->
								<button type="submit" class="btn btn-default">Login</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!--  Add User Modal -->
			<div class="modal fade" id="addUserModal" role="dialog">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Add User</h4>
						</div>
						<form action="addUser" method="post" id="addUserForm"
							name="addUserForm">
							<div class="modal-body">
								<div class="form-group">
									<label for="email">User Name:</label> <input type="text"
										class="form-control" name="addUserName" id="addUserName">
								</div>
								<div class="form-group">
									<label for="pwd">Password:</label> <input type="password"
										class="form-control" name="addUserPwd" id="addUserPwd">
								</div>
								<div class="form-group">
									<label for="userRole">User Role:</label> <select
										class="form-control" id="addUserRole" name="addUserRole">
										<option>admin</option>
										<option>user</option>
									</select>
								</div>
							</div>
							<div class="modal-footer">
								<!-- <a  onclick="loginUser()">loginUser</a> -->
								<!-- <button type="button" class="btn btn-default"
									 onclick="loginUser()">Login JS</button> -->
								<button type="button" class="btn btn-primary"
									onclick="addUser()">Add</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Cancel</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!--  Edit User Modal -->
			<div class="modal fade" id="editUserModal" role="dialog">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Update User</h4>
						</div>
						<form action="editUser" method="post" id="editUserForm"
							name="editUserForm">
							<div class="modal-body">
								<div class="form-group">
									<label for="email">User Id:</label> <input type="text"
										class="form-control" name="editUserId" id="editUserId" disabled="disabled">
								</div>
								<div class="form-group">
									<label for="email">User Name:</label> <input type="text"
										class="form-control" name="editUserName" id="editUserName">
								</div>
								<div class="form-group">
									<label for="pwd">Password:</label> <input type="password"
										class="form-control" name="editUserPwd" id="editUserPwd">
								</div>
								<div class="form-group">
									<label for="userRole">User Role:</label> <select
										class="form-control" id="editUserRole" name="editUserRole">
										<option>admin</option>
										<option>user</option>
									</select>
								</div>
							</div>
							<div class="modal-footer">
								<!-- <a  onclick="loginUser()">loginUser</a> -->
								<!-- <button type="button" class="btn btn-default"
									 onclick="loginUser()">Login JS</button> -->
								<button type="button" class="btn btn-primary"
									onclick="editUser()">Update</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Cancel</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-sm-9">
				<%-- <div class="well">
					<h4>${message}</h4>
					<p>Some text..</p>
				</div> --%>
				<div class="row">
					<c:if test="${user.userRole == 'admin'}">
						<div class="col-sm-3">
							<div class="well">
								<h4>Users <span class="badge">${noUsers}</span></h4>
								<%-- <ul>
									<c:forEach items="${users}" var="user">
										<li>${user.userName}</li>
									</c:forEach>
								</ul> --%>
								<p>
									<button type="button" class="btn btn-primary btn-sm"
										data-toggle="modal" data-target="#addUserModal"><span class="glyphicon glyphicon-plus"></span> Add
										</button>
									<button type="button" class="btn btn-default btn-sm">View
										</button>
								</p>

							</div>
						</div>
						<div class="col-sm-3">
							<div class="well">
								<h4>Courses</h4>
								<p>
									<button type="button" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-plus"></span> Add
										</button>
									<button type="button" class="btn btn-default btn-sm">View
										</button>
								</p>
							</div>
						</div>

					</c:if>
					<!-- <div class="col-sm-3">
						<div class="well">
							<h4>Sessions</h4>
							<p>10 Million</p>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="well">
							<h4>Bounce</h4>
							<p>30%</p>
						</div>
					</div> -->
				</div>

				<c:if test="${user.userRole == 'admin'}">
					<div class="well">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">USER ID</th>
									<th scope="col">USER NAME</th>
									<th scope="col">USER ROLE</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${users}" var="u">
									<tr>
										<th scope="row">${u.getUserId()}</th>
										<td>${u.getUserName()}</td>
										<td>${u.getUserRole()}</td>
										<td>
											<button type="button" class="btn btn-primary btn-sm"
												data-toggle="modal" data-target="#editUserModal"
												data-id="${u.userId}" data-user-name="${u.userName}"
												data-user-pwd="${u.userPwd}" data-user-role="${u.userRole}"
												data-toggle="tooltip" title="Edit User"><span class="glyphicon glyphicon-pencil"></span> Edit</button>
											<%-- <button type="button" class="btn btn-danger btn-sm" onclick="deleteUser(${u.getUserId()})">Delete</button> --%>
											<a
											href="${pageContext.request.contextPath}/user/deleteUser/${u.userId}" class="btn btn-danger btn-sm" 
											 data-toggle="tooltip" title="Remove User">
											<span class="glyphicon glyphicon-remove"></span> Remove</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>




						</table>
					</div>
				</c:if>


				<!-- <div class="row">
					<div class="col-sm-4">
						<div class="well">
							<p>Text</p>
							<p>Text</p>
							<p>Text</p>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="well">
							<p>Text</p>
							<p>Text</p>
							<p>Text</p>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="well">
							<p>Text</p>
							<p>Text</p>
							<p>Text</p>
						</div>
					</div>
				</div> -->
				<!-- <div class="row">
					<div class="col-sm-8">
						<div class="well">
							<p>Text</p>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="well">
							<p>Text</p>
						</div>
					</div>
				</div> -->
			</div>
		</div>
	</div>
</body>


<script type="text/javascript">

function loginUser() {
	
	const user = new FormData(document.querySelector('form'));
	user.append("userId", 1);	
	
	//userData.append("userName", $("#userName").val());
	//userData.append("userPwd", $("#userPwd").val());
	user.append("userRole", "admin");
	// Display the values
	for (var value of user.values()) {
	   console.log(value); 
	}
	
	//var serialized = $("#userLoginForm").serialize();
	 //console.log(serialized);
     /* var request = new XMLHttpRequest();
    request.open("POST", "${pageContext.request.contextPath}/login", true);
    request.send(user);  */
      $.ajax({
        url: "${pageContext.request.contextPath}/login",
        type: 'POST',              
        contentType:false,
        cache: false,
        processData: false,
        data: user,       
        success: function (data) {
            console.log("Successfully processed.");
            $('#myModal').modal('hide');
        },
   		error:function(data){								
   			console.log("Error while processing")		
	}
    });   
}

function addUser() {
	
	const addUser = new FormData();
	addUser.append("userName",$("#addUserName").val());
	addUser.append("userPwd",$("#addUserPwd").val());
	addUser.append("userRole",$("#addUserRole").val());
	$.ajax({
        url: "${pageContext.request.contextPath}/user/addUser",
        type: 'POST',              
        contentType:false,
        cache: false,
        processData: false,
        data: addUser,       
        success: function (data) {
            console.log("User added successfully.");
            $('#addUserModal').modal('hide');
            window.location.href = "${pageContext.request.contextPath}/login";
            //alert("User added succsessfully.")
        },
   		error:function(data){								
   			console.log("Error while processing")		
	}
    });   
}
function editUser() {
	
	const editUser = new FormData();
	editUser.append("userId",$("#editUserId").val());
	editUser.append("userName",$("#editUserName").val());
	editUser.append("userPwd",$("#editUserPwd").val());
	editUser.append("userRole",$("#editUserRole").val());
	$.ajax({
        url: "${pageContext.request.contextPath}/user/editUser",
        type: 'POST',              
        contentType:false,
        cache: false,
        processData: false,
        data: editUser,       
        success: function (data) {
            console.log("User updated successfully.");
            $('#editUserModal').modal('hide');
            window.location.href = "${pageContext.request.contextPath}/login";
            //alert("User added succsessfully.")
        },
   		error:function(data){								
   			console.log("Error while updating user.")		
	}
    });   
}

$('#editUserModal').on('show.bs.modal', function (event) {
	
	  var button = $(event.relatedTarget); // Button that triggered the modal
	  
	  var userId= button.data('id');
	  var userName= button.data('user-name');
	  var userPwd= button.data('user-pwd');
	  var userRole= button.data('user-role');
	  //console.log(userId);
	  //console.log(userName);
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this);
	  modal.find('#editUserId').val(userId);
	  modal.find('.modal-title').html('<b>Update User with User Id : ' + userId);
	  modal.find('#editUserName').val(userName);
	  modal.find('#editUserPwd').val(userPwd);
	  modal.find('#editUserRole').val(userRole);
	  
});
</script>


</html>
