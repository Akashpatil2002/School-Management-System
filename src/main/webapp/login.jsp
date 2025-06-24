<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
body {
	background: linear-gradient(to right, #4A90E2, #50C878);
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.card {
	max-width: 400px;
	width: 100%;
	padding: 20px;
	border-radius: 12px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	animation: fadeIn 1s ease-in-out;
	margin-top: -200px;
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(-20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.btn-custom {
	width: 100%;
	font-size: 18px;
	font-weight: bold;
}

.btn-success {
	background-color: #50C878;
	border: none;
}

.btn-success:hover {
	background-color: #3DAE5B;
}

.form-control {
	border-radius: 8px;
}
</style>

</head>
<body class="bg-light">
<body>
	<div class="card shadow">
		<h2 class="text-center">Login</h2>
		<form action="LoginServlet" method="post">
			<input type="email" name="email" placeholder="Email"
				class="form-control mb-3" required> <input type="password"
				name="password" placeholder="Password" class="form-control mb-3"
				required>
			<button class="btn btn-success btn-custom mb-2">Login</button>
			<a href="register.jsp" class="btn btn-success btn-custom">Register</a>
		</form>
	</div>
</body>

<!-- <div class="container mt-5">
		<div class="card shadow p-4">
			<h2 class="text-center">Login</h2>
			<form action="LoginServlet" method="post">
				<input type="email" name="email" placeholder="Email"
					class="form-control mb-3" required> <input type="password"
					name="password" placeholder="Password" class="form-control mb-3"
					required>
				<div class="">
					<button class="btn btn-success">Login</button>
					<a href="register.jsp" class="btn btn-success">Register</a>
				</div>
				<style>
.btn-success {
	margin: 10px; /* Adjust spacing */
	display: inline-block; /* Ensures buttons stay inline */
}

.div {
	text-align: center; /* Center alignment */
}
</style>

			</form>
		</div>
	</div> -->
</body>


</html>