<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../base.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>All Products</title>
    <link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css' />">
    <script src="<c:url value='/js/bootstrap.bundle.min.js' />"></script>
    <style>
        body {
            background-image: url('/images/dark-background-abstract-background-network-3d-background-3840x2160-8324 (1).png');
            background-size: cover;
            background-position: center;
            font-family: 'Poppins', sans-serif;
            color: #fff; /* Changed font color to white for better contrast */
        }

        .product-card {
            background: rgba(255, 255, 255, 0.1); /* Semi-transparent white */
            backdrop-filter: blur(10px); /* Creates the glass effect */
            border: 1px solid rgba(255, 255, 255, 0.2); /* Subtle border for depth */
            border-radius: 10px; /* Rounded corners */
            margin-bottom: 20px;
            padding: 20px; /* Increased padding for a better look */
            text-align: center;
            transition: box-shadow 0.3s ease;
        }

        .product-card:hover {
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3); /* Deeper shadow on hover */
        }

        .product-img {
            width: 100%;
            height: auto;
            max-height: 150px; /* Adjust height as needed */
            object-fit: contain; /* Keeps aspect ratio */
            border-radius: 5px; /* Round image corners for consistency */
        }

        .product-details {
            margin-top: 10px; /* Spacing between image and details */
        }

        .product-title {
            font-size: 1.2rem; /* Slightly larger font for the title */
            font-weight: bold; /* Make the title bold */
            color: #ffd700; /* Gold color for the title */
        }

        .product-category, .product-price, .product-discount, .product-stock {
            font-size: 0.9rem; /* Adjust font size for details */
            color: #e0e0e0; /* Light gray color for other details */
            margin: 5px 0; /* Spacing between details */
        }
    </style>
</head>
<body>
    <section>
        <div class="container-fluid mt-4 p-3">
            <div class="row">
                <p class="text-center fs-3 mt-2">All Products</p>
                <hr>
                <a href="${pageContext.request.contextPath}/admin/" class="text-decoration-none">
                    <i class="fa-solid fa-arrow-left"></i> Back
                </a>

                <% if (session.getAttribute("succMsg") != null) { %>
                    <p class="text-success fw-bold"><%= session.getAttribute("succMsg") %></p>
                    <% session.removeAttribute("succMsg"); %>
                <% } %>

                <% if (session.getAttribute("errorMsg") != null) { %>
                    <p class="text-danger fw-bold text-center"><%= session.getAttribute("errorMsg") %></p>
                    <% session.removeAttribute("errorMsg"); %>
                <% } %>

                <div class="col-md-4 p-3">
                    <form action="${pageContext.request.contextPath}/admin/products" method="get" class="d-flex">
                        <input type="text" class="form-control me-2" name="ch" placeholder="Search...">
                        <button class="btn btn-primary" type="submit">Search</button>
                        <div class="dropdown ms-3">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="categoryDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                Category
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="categoryDropdown" id="categoryList">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/products">All Categories</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/products?category=Electronics">Electronics</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/products?category=Fashion">Fashion</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/products?category=HomeNeeds">Home Needs</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/products?category=Toys">Toys</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/products?category=Accessories">Accessories</a></li>
                            </ul>
                        </div>
                    </form>
                </div>

                <div class="col-12 p-3">
                    <div class="row">
                        <c:forEach var="p" items="${products}">
                            <div class="col-md-3">
                                <div class="product-card">
                                    <img src="${pageContext.request.contextPath}/img/product_img/${p.image}" class="product-img" alt="${p.title}">
                                    <h5 class="mt-2"><c:out value="${p.title}"/></h5>
                                    <p>Category: <c:out value="${p.category}"/></p>
                                    <p>Price: <c:out value="${p.price}"/></p>
                                    <p>Discount: <c:out value="${p.discount}"/>%</p>
                                    <p>Discount Price: <c:out value="${p.discountPrice}"/></p>
                                    <p>Status: <c:out value="${p.isActive}"/></p>
                                    <p>Stock: <c:out value="${p.stock}"/></p>
                                    <a href="${pageContext.request.contextPath}/admin/editProduct/${p.id}" class="btn btn-sm btn-primary">
                                        <i class="fa-solid fa-pen-to-square"></i> Edit
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/deleteProduct/${p.id}" class="btn btn-sm btn-danger">
                                        <i class="fa-solid fa-trash"></i> Delete
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">Total Products: <c:out value="${totalElements}"/></div>
                    <div class="col-md-6">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <li class="page-item <c:if test="${isFirst}">disabled</c:if>">
                                    <a class="page-link" href="${pageContext.request.contextPath}/admin/products?pageNo=${pageNo - 1}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>

                                <c:forEach var="i" begin="1" end="${totalPages}">
                                    <li class="page-item <c:if test="${pageNo + 1 == i}">active</c:if>">
                                        <a class="page-link" href="${pageContext.request.contextPath}/admin/products?pageNo=${i - 1}">
                                            <c:out value="${i}"/>
                                        </a>
                                    </li>
                                </c:forEach>

                                <li class="page-item <c:if test="${isLast}">disabled</c:if>">
                                    <a class="page-link" href="${pageContext.request.contextPath}/admin/products?pageNo=${pageNo + 1}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>  
</html>
