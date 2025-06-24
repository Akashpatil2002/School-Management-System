<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
body {
	background: linear-gradient(135deg, #74ebd5, #9face6);
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	font-family: 'Poppins', sans-serif;
}

.card {
	background-color: #ffffffdd;
	border: none;
	border-radius: 20px;
	padding: 40px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
	width: 100%;
	max-width: 500px;
}

.card h2 {
	text-align: center;
	margin-bottom: 30px;
	color: #2c3e50;
	font-weight: 700;
}

.form-control {
	border-radius: 10px;
}

.form-control:focus {
	box-shadow: 0 0 0 0.2rem rgba(115, 185, 243, 0.25);
	border-color: #73b9f3;
}

.btn-primary {
	background-color: #5dade2;
	border: none;
	border-radius: 10px;
}

.btn-info {
	background-color: #58d68d;
	border: none;
	border-radius: 10px;
}
</style>
</head>
<!-- <body class="bg-light">
	<div class="container mt-5">
		<div class="card shadow p-4">
			<h2 class="text-center">User Registration</h2>
			<form action="RegisterServlet" method="post">
				<input type="text" name="name" placeholder="Full Name"
					class="form-control mb-3" required> <input type="email"
					name="email" placeholder="Email" class="form-control mb-3" required>
				<input type="password" name="password" placeholder="Password"
					class="form-control mb-3" required> <select name="role"
					class="form-control mb-3">
					<option value="student">Student</option>
					<option value="teacher">Teacher</option>
					<option value="admin">Admin</option>
				</select>
				<div class="d-flex">
					<button class="btn btn-primary w-50">Register</button>
					<button class="btn btn-info w-50">Login</button>
				</div>
			</form>
		</div>
	</div>
</body> -->

<body>
	<div class="card">
		<h2>Join Us</h2>
		<form action="RegisterServlet" method="post">
			<input type="text" name="name" class="form-control mb-3"
				placeholder="Full Name" required> <input type="email"
				name="email" class="form-control mb-3" placeholder="Email Address"
				required> <input type="password" name="password"
				class="form-control mb-3" placeholder="Create Password" required>
			<select name="role" class="form-control mb-4" required>
				<option value="" selected disabled>Select Role</option>
				<option value="student">Student</option>
				<option value="teacher">Teacher</option>
				<option value="admin">Admin</option>
			</select>
			<div class="d-flex gap-3">
				<button type="submit" class="btn btn-primary w-50">Register</button>
				<a href="login.jsp" class="btn btn-info w-50 text-center">Login</a>
			</div>
		</form>
	</div>
</body>

</html>