<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa; /* Bootstrap default background color */
            padding-top: 80px; /* Adjusted padding for fixed navbar */
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 50px; /* Adjusted margin for space at the bottom */
        }

        .welcome-message {
            text-align: center;
            margin-bottom: 20px;
        }

        h2, h3, h4 {
            color: #333;
        }

        p {
            margin-bottom: 20px;
            padding: 3px;
        }

        .instructions {
            margin-top: 30px;
            border: 1px solid #ccc;
            padding: 15px;
            border-radius: 8px;
        }

        .instructions p {
            cursor: default;
            background-color: transparent;
        }

        .terms-and-conditions {
            margin-top: 30px;
        }

        .terms-and-conditions label {
            cursor: default;
            background-color: transparent;
            display: block;
            margin-bottom: 10px;
        }

        .terms-and-conditions input[type="checkbox"] {
            margin-right: 5px;
            vertical-align: middle;
        }

        .terms-and-conditions input[type="submit"] {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #3498db;
            color: #fff;
            cursor: pointer;
        }

        .terms-and-conditions input[type="submit"]:hover {
            background-color: #2980b9;
        }

    </style>
</head>
<body>
    <!-- Bootstrap Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
        <a class="navbar-brand" href="#">Online Exam System</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="ProfileServlet">Update Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet">Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <div class="welcome-message">
            <h2>Welcome to the Online Examination System!</h2>
            <h3>Hello, <%= session.getAttribute("FirstName") %> <%= session.getAttribute("LastName") %>!</h3>
        </div>
        
        <!-- Display error message if available -->
        <% if (request.getAttribute("errorMessage") != null) { %>
            <h4 style="color: red;"><%= request.getAttribute("errorMessage") %></h4>
        <% } %>

        <div class="instructions">
            <h4>Exam Instructions:</h4>
            <p>1. Click on the "Start Exam" button to begin the examination.</p>
            <p>2. Answer all the questions within the specified time.</p>
            <p>3. Use the provided radio buttons to select your answers.</p>
            <p>4. Click on the "Next Question" button to move to the next question.</p>
            <p>5. After answering all questions, click on the "Submit Exam" button to finish.</p>
        </div>

        <div class="terms-and-conditions">
            <form action="ExamServlet" method="post">
                <label>
                    <input type="checkbox" id="termsCheckbox" required>
                    I agree to the Terms and Conditions
                </label>
                <input type="submit" class="btn btn-success" value="Start Exam">
            </form>
        </div>
    </div>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
