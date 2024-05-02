<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exam Page</title>
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

        .navbar {
            border-bottom: 1px solid #dee2e6; /* Added border for navbar separation */
        }

        .navbar-nav {
            margin-left: auto;
        }

        .navbar-nav a {
            margin-right: 10px;
        }

        .question-container {
            margin-top: 30px;
        }

        .question {
            display: none;
        }

        .question.active {
            display: block;
        }

        .question-options {
            list-style: none;
            padding: 0;
        }

        .question-options li {
            margin-bottom: 10px;
        }

        .question-options label {
            display: block;
        }

        .question-navigation {
            margin-top: 20px;
            text-align: center;
        }

        .question-navigation button {
            margin-right: 10px;
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

        <!-- Question Container -->
        <div class="question-container">
            <form action="SubmitServlet" method="post">
                <div class="question active">
                    <h2>Question 1:</h2>
                    <p>What is the capital of France?</p>
                    <ul class="question-options">
                        <li>
                            <label><input type="radio" name="answer1" value="0"> Paris</label>
                        </li>
                        <li>
                            <label><input type="radio" name="answer1" value="1"> Berlin</label>
                        </li>
                        <li>
                            <label><input type="radio" name="answer1" value="2"> London</label>
                        </li>
                        <li>
                            <label><input type="radio" name="answer1" value="3"> Rome</label>
                        </li>
                    </ul>
                </div>

                <div class="question">
                    <h2>Question 2:</h2>
                    <p>Which planet is known as the Red Planet?</p>
                    <ul class="question-options">
                        <li>
                            <label><input type="radio" name="answer2" value="0"> Earth</label>
                        </li>
                        <li>
                            <label><input type="radio" name="answer2" value="1"> Mars</label>
                        </li>
                        <li>
                            <label><input type="radio" name="answer2" value="2"> Jupiter</label>
                        </li>
                        <li>
                            <label><input type="radio" name="answer2" value="3"> Saturn</label>
                        </li>
                    </ul>
                </div>

                <!-- Add more questions as needed -->

                <div class="question-navigation">
                    <button type="button" class="btn btn-primary" onclick="showPreviousQuestion()">Previous</button>
                    <button type="button" class="btn btn-primary" onclick="showNextQuestion()">Next</button>
                    <input type="submit" class="btn btn-success" value="Submit Exam">
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function showNextQuestion() {
            const activeQuestion = document.querySelector('.question.active');
            const nextQuestion = activeQuestion.nextElementSibling;

            if (nextQuestion) {
                activeQuestion.classList.remove('active');
                nextQuestion.classList.add('active');
            }
        }

        function showPreviousQuestion() {
            const activeQuestion = document.querySelector('.question.active');
            const previousQuestion = activeQuestion.previousElementSibling;

            if (previousQuestion) {
                activeQuestion.classList.remove('active');
                previousQuestion.classList.add('active');
            }
        }
    </script>
</body>
</html>
