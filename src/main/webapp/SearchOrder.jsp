<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="searchorderuserservlet" method="GET">
            <label for="id">Nhập ID:</label>
            <input type="text" id="id" name="id" required>
            <button type="submit">Search</button>
        </form>       
        <c:if test="${order == null}">
            <p>Order not found!</p>
        </c:if>
        <c:if test="${not empty order}">
            <table>
            <tr>
                <th>Bill of lading no</th>
                <th>Sender</th>
                <th>Receiver</th>
                <th>Origin_address</th>
                <th>Destination_address</th>
                <th>Sender_phone</th>
                <th>Receiver_phone</th>
                <th>Status</th>
                <th>Weight</th>
                <th>Total_cost</th>
                <th>Payment status</th>
            </tr>    
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
                <td>${ten.total_cost}</td>
                <td>${ten.payment_status ? 'Paid' : 'Unpaid'}</td>
                <td><a href="UserListOrderToUpdate">Update</a></td>
            </tr>
            </c:forEach>
        </table> 
        </c:if>
        <c:if test="${order != null}">
            <table border="1">
                <tr>
                    <th>Bill of lading no</th>
                    <td>${order.order_id}</td>
                </tr>
                <tr>
                    <th>Sender</th>
                    <td>${order.sender}</td>
                </tr>
                <tr>
                    <th>Receiver</th>
                    <td>${order.receiver}</td>
                </tr>
                <tr>
                    <th>Origin Address</th>
                    <td>${order.originAddress}</td>
                </tr>
                <tr>
                    <th>Destination Address</th>
                    <td>${order.destinationAddress}</td>
                </tr>
                <tr>
                    <th>Sender Phone</th>
                    <td>${order.sender_phone}</td>
                </tr>
                <tr>
                    <th>Sender Phone</th>
                    <td>${order.sender_phone}</td>
                </tr>
                <tr>
                    <th>Receiver Phone</th>
                    <td>${order.receiver_phone}</td>
                </tr>
                <tr>
                    <th>Status</th>
                    <td>${order.status}</td>
                </tr>
                <tr>
                    <th>Weight</th>
                    <td>${order.weight}</td>
                </tr>
                <tr>
                    <th>Total Cost</th>
                    <td>${order.total_cost}</td>
                </tr>
                <tr>
                    <th>Payment Status</th>
                    <td>${order.payment_status  ? 'Paid' : 'Unpaid'}</td>
                </tr>
            </table>
        </c:if>
        
        
</body>
</html>