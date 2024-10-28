<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
    body {
    margin-top:30px;
       background-image: url('/images/dark-background-abstract-background-network-3d-background-3840x2160-8324 (1).png');

 background-size: cover;
        background-position: center;
        font-family: 'Poppins', sans-serif;
        color: #333;
    }

    .card-sh {
        background: rgba(255, 255, 255, 0.5); /* Semi-transparent background */
        backdrop-filter: blur(10px); /* Glass effect */
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        border-radius: 20px;
        overflow: hidden;
        animation: fadeInUp 1s ease-out;
        transform: translateY(0);
        transition: transform 0.5s ease-out;    }

    .card-sh:hover {
        transform: translateY(-10px);
    }

    .form-control {
     background-color: rgba(255, 255, 255, 0.2);
        border-radius: 12px;
        border: 2px solid #e0e7ff;
         transition: border-color 0.3s ease;
    color: #fff; 
    }

    .form-control:focus {
        border-color: #00aaff;
    box-shadow: 0 0 5px rgba(0, 170, 255, 0.1);
    background-color: rgba(255, 255, 255, 0.1);
    }

    .btn-primary {
        background:rgba(0, 170, 255, 0.2); /* Make button background transparent */
        border: 2px solid #00aaff; /* Optional: Add border color */
        border-radius: 15px;
        font-weight: bold;
        color: white; /* Change text color */
        transition: background 0.3s ease, transform 0.2s;
    }

    .btn-primary:hover {
        background: rgba(0, 170, 255, 0.2); /* Change hover background */
        transform: translateY(-3px);
        box-shadow: 0 8px 15px rgba(0, 102, 255, 0.3);
    }

    .card-header {
        background-color: rgba(255, 255, 255, 0.5); /* Make the header semi-transparent */
        padding: 1rem 1.5rem;
        text-align: center;
         /* Optional: Make border semi-transparent */
    }

    .card-header p {
        color: #333; /* Change text color */
        font-size: 1.5rem;
        font-weight: 600;
        margin-bottom: 0;
    }

    .text-success, .text-danger {
        font-size: 1rem;
        font-weight: 500;
        margin-top: 0.5rem;
    }

    .mb-3 label {
        font-weight: 600;
        color: #333;
    }
    

    /* Animations */
    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    @media (max-width: 768px) {
        .container {
            padding: 1rem;
        }
    }

    @media (max-width: 576px) {
        .container {
            padding: 0.75rem;
        }

        .form-control, .btn {
            font-size: 0.75rem;
        }
    }
</style>
</head>
<body>
    <section>
        <div class="container p-5 mt-3">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card card-sh">
                        <div class="card-header text-center">
                            <p class="fs-4">Add Product</p>

                            <!-- Success Message -->
                            <c:if test="${not empty sessionScope.succMsg}">
                                <p class="text-success fw-bold">${sessionScope.succMsg}</p>
                                <%
                                    session.removeAttribute("succMsg");
                                %>
                            </c:if>

                            <!-- Error Message -->
                            <c:if test="${not empty sessionScope.errorMsg}">
                                <p class="text-danger fw-bold">${sessionScope.errorMsg}</p>
                                <%
                                    session.removeAttribute("errorMsg");
                                %>
                            </c:if>
                        </div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/admin/saveProduct"
                                  method="post" enctype="multipart/form-data">
                                <div class="mb-3">
                                    <label>Enter Title</label> 
                                    <input type="text" name="title" class="form-control" required>
                                </div>

                                <div class="mb-3">
                                    <label>Enter Description</label>
                                    <textarea rows="3" class="form-control" name="description" required></textarea>
                                </div>

                                <div class="mb-3">
                                    <label>Category</label>
                                    <select class="form-control" name="category" required>
                                        <option value="">-- Select --</option>
                                        <c:forEach var="c" items="${categories}">
                                            <option value="${c.name}">${c.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label>Enter Price</label> 
                                    <input type="number" name="price" class="form-control" required>
                                </div>

                                <div class="mb-3">
                                    <label>Status</label>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" value="true" name="isActive" id="active" checked>
                                        <label class="form-check-label" for="active">Active</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="isActive" value="false" id="inactive">
                                        <label class="form-check-label" for="inactive">Inactive</label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="mb-3 col-md-6">
                                        <label>Enter Stock</label> 
                                        <input type="text" name="stock" class="form-control" required>
                                    </div>
                                    <div class="mb-3 col-md-6">
                                        <label>Upload Image</label> 
                                        <input type="file" name="file" class="form-control" required>
                                    </div>
                                </div>

                                <button class="btn btn-primary col-md-12" type="submit">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
