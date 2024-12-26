<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>List Order</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	background-color: #f8f9fa;
}

.sidebar {
	background-color: #343a40;
	color: #fff;
	height: 100vh;
	position: fixed;
	width: 16%;
	padding: 20px 15px;
}

.sidebar h3 {
	text-align: center;
	margin-bottom: 20px;
}

.sidebar a {
	color: #adb5bd;
	text-decoration: none;
	padding: 10px;
	display: block;
	margin: 5px 0;
	border-radius: 5px;
	transition: background-color 0.3s, color 0.3s;
}

.sidebar a:hover {
	background-color: #007bff;
	color: #fff;
}

.content {
	margin-left: 250px;
	padding: 20px;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px 20px;
	background-color: white;
	box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
	position: sticky;
	top: 0;
	z-index: 1000;
}

.header h1 {
	margin: 0;
	font-size: 24px;
}

.logout-btn {
	background: linear-gradient(90deg, #ff6f61, #ff9472);
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 50px;
	font-size: 16px;
	font-weight: bold;
	text-transform: uppercase;
	cursor: pointer;
	transition: all 0.3s ease-in-out;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.logout-btn:hover {
	background: linear-gradient(90deg, #ff9472, #ff6f61);
	box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
	transform: scale(1.05);
}

.search-bar {
	margin: 20px 0;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	font-size: 14px;
}

table th, table td {
	text-align: left;
	padding: 8px;
	border: 1px solid #ddd;
}

table th {
	background-color: #f1f1f1;
}

table tr:nth-child(even) {
	background-color: #f9f9f9;
}

/* CSS cho nút Update */
.update-btn {
	display: inline-block;
	padding: 8px 16px;
	background: linear-gradient(90deg, #4caf50, #81c784);
	color: white;
	border: none;
	border-radius: 50px;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	text-decoration: none;
	cursor: pointer;
	transition: all 0.3s ease-in-out;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.update-btn:hover {
	background: linear-gradient(90deg, #81c784, #4caf50);
	box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
	transform: scale(1.05);
}

@media screen and (max-width: 768px) {
	table {
		font-size: 12px;
	}
	table th, table td {
		white-space: nowrap;
	}
}
</style>
</head>

<body>
	<!-- Sidebar -->
	<div class="sidebar">
    <h3>Menu</h3>
    <a href="Exit">Home</a>
    <a href="AdiminpagetoCreateOrder">Create Order</a>
    <a href="orderlistadminservlet">Order List</a>
    <a href="AdminpagetoCreateDriver">Create Driver</a>
    <a href="driverListservlet">Driver List</a>
    <a href="AdminpagetoCreateVehical">Create Vehicle</a>
    <a href="vehicleListservlet">Vehicle List</a>
    <a href="AdminpagetoCreateRoute">Create Route</a>
    <a href="routeListservlet">Route List</a>
    <a href="AdminpagetoCreateTracking">Add Tracking</a>
    <a href="TrackingListservlet">Tracking List</a>
  </div>

	<!-- Page Content -->
	<div class="content">
		<!-- Header -->
		<div class="header">
			<h1>List Order</h1>
			<button class="logout-btn" onclick="location.href='LogoutServlet'">Log
				out</button>
		</div>

		<!-- Search Bar -->
		<form action="" class="search-bar" method="GET"
			onsubmit="showSearchModal(event)">
			<input type="text" name="search" placeholder="Search.."
				class="form-control d-inline-block w-75" />
			<button type="submit" class="btn btn-primary d-inline-block"
				data-bs-toggle="modal" data-bs-target="#searchModal">Search</button>
		</form>

		<!-- Table -->
		<c:if test="${empty list}">
			<div class="alert alert-warning">List is empty.</div>
		</c:if>

		<c:if test="${not empty list}">
			<table>
				<thead>
					<tr>
						<th>Bill of Lading No</th>
						<th>Sender</th>
						<th>Receiver</th>
						<th>Origin Address</th>
						<th>Destination Address</th>
						<th>Sender Phone</th>
						<th>Receiver Phone</th>
						<th>Status</th>
						<th>Weight</th>
						<th>Total Cost</th>
						<th>Payment Status</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="ten" items="${list}">
						<tr>
							<td>${ten.order_id}</td>
							<td>${ten.sender}</td>
							<td>${ten.receiver}</td>
							<td>${ten.originAddress}</td>
							<td>${ten.destinationAddress}</td>
							<td>${ten.sender_phone}</td>
							<td>${ten.receiver_phone}</td>
							<td>${ten.status}</td>
							<td>${ten.weight}</td>
							<td>${ten.total_cost}$</td>
							<td>${ten.payment_status ? 'Paid' : 'Unpaid'}</td>
							<td><a href="AdminOrderListToUpdate" class="update-btn">Update</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>

	<!-- Search Results Modal -->
	<div class="modal fade" id="searchModal" tabindex="-1"
		aria-labelledby="searchModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<form action="SearchOrder" method="post">
						<h5 class="modal-title" id="searchModalLabel">Search Results</h5>
					</form>
					<!-- Nút Close thêm vào -->
					<a href="orderlistadminservlet"><button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button></a>
				</div>
				<div class="modal-body">
					<c:if test="${empty order}">
						<p class="text-center text-muted">No results found.</p>
					</c:if>
					<c:if test="${not empty order}">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Bill of Lading No</th>
									<th>Sender</th>
									<th>Receiver</th>
									<th>Origin Address</th>
									<th>Destination Address</th>
									<th>Sender Phone</th>
									<th>Receiver Phone</th>
									<th>Status</th>
									<th>Weight</th>
									<th>Total Cost</th>
									<th>Payment Status</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="ten" items="${order}">
									<tr>
										<td>${ten.order_id}</td>
										<td>${ten.sender}</td>
										<td>${ten.receiver}</td>
										<td>${ten.originAddress}</td>
										<td>${ten.destinationAddress}</td>
										<td>${ten.sender_phone}</td>
										<td>${ten.receiver_phone}</td>
										<td>${ten.status}</td>
										<td>${ten.weight}</td>
										<td>${ten.total_cost}$</td>
										<td>${ten.payment_status ? 'Paid' : 'Unpaid'}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
				</div>
				<!-- Nút Close cho modal -->
				<div class="modal-footer">
				<a href="orderlistadminservlet"><button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button> </a>	
				</div>
			</div>
		</div>
	</div>
	<script>
		function showSearchModal(event) {
			event.preventDefault(); // Ngăn form gửi dữ liệu và tải lại trang
			const modal = new bootstrap.Modal(document
					.getElementById('searchModal'));
			modal.show();
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
