<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../base.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>My Orders</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        /* Main container styling */
        .order-container {
            margin-top: 50px;
            padding: 30px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* Section heading */
        .section-heading {
            font-size: 1.8rem;
            color: #333;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
        }

        /* Glass effect styling */
        .order-card {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            gap: 20px;
            padding: 20px;
            margin-bottom: 15px;
            border-radius: 15px;
            background: rgba(255, 255, 255, 0.1);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            backdrop-filter: blur(10px);
            color: #333;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .order-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.25);
        }

        /* Styling for each section in grid */
        .product-details, .price-status, .order-action {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            font-size: 1rem;
        }

        /* Product Details styling */
        .product-details {
            font-weight: bold;
            color: #333;
            text-align: center;
        }

        /* Price and Status styling */
        .price-status {
            color: #555;
            text-align: center;
        }

        /* Order ID and Action styling */
        .order-action {
            text-align: center;
            font-size: 1rem;
        }

        /* Cancel button styling */
        .cancel-btn {
            transition: transform 0.3s ease, background-color 0.3s ease;
            font-weight: bold;
        }

        .cancel-btn:hover {
            transform: scale(1.1);
            background-color: #dc3545;
            color: #fff;
        }
    </style>
</head>
<body>
    <section>
        <div class="container order-container">
            <p class="section-heading">My Orders</p>

            <c:if test="${sessionScope.succMsg != null}">
                <p class="text-success fw-bold text-center">${sessionScope.succMsg}</p>
                <c:out value="${commnServiceImpl.removeSessionMessage()}"/>
            </c:if>

            <c:if test="${sessionScope.errorMsg != null}">
                <p class="text-danger fw-bold text-center">${sessionScope.errorMsg}</p>
                <c:out value="${commnServiceImpl.removeSessionMessage()}"/>
            </c:if>

            <c:forEach var="o" items="${orders}">
                <div class="order-card">
                    <!-- Product Details -->
                    <div class="product-details">
                        <span>${o.product.title}</span>
                        <span>Quantity: ${o.quantity}</span>
                    </div>

                    <!-- Price and Status -->
                    <div class="price-status">
                        <span>Price: $${o.price}</span>
                        <span>Total: $${o.quantity * o.price}</span>
                        <span>Status: ${o.status}</span>
                    </div>

                    <!-- Order ID and Action -->
                    <div class="order-action">
                        <span>Order ID: ${o.orderId}</span>
                        <c:choose>
                            <c:when test="${o.status != 'Cancelled'}">
                                <a href="${pageContext.request.contextPath}/user/update-status?id=${o.id}&st=6" class="btn btn-sm btn-danger cancel-btn">Cancel</a>
                            </c:when>
                            <c:otherwise>
                                <button class="btn btn-sm btn-secondary" disabled>Cancelled</button>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>
</body>
</html>
