<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Fun stuff</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            padding: 40px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        h1 {
            color: #333;
        }
        form {
            margin-bottom: 20px;
        }
        input[type="text"] {
            padding: 10px;
            font-size: 16px;
            width: 300px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        input[type="submit"] {
            padding: 10px 16px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            margin-left: 10px;
        }
        .result {
            background: white;
            padding: 20px;
            border-radius: 10px;
            width: 400px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .result p {
            font-size: 18px;
            margin: 10px 0;
        }
    </style>
</head>
<body>

<h1>Fun stuff</h1>

<form method="get" action="chaine.jsp">
    <input type="text" name="inputText" placeholder="Enter your string here" required>
    <input type="submit" value="Format">
</form>

<%
    String input = request.getParameter("inputText");
    if (input != null && !input.trim().isEmpty()) {
        String uppercase = input.toUpperCase();
        String capitalized = input.substring(0, 1).toUpperCase() + input.substring(1);
%>

<div class="result">
    <p><strong>Original:</strong> <%= input %></p>
    <p><strong>Uppercase:</strong> <%= uppercase %></p>
    <p><strong>Capitalized:</strong> <%= capitalized %></p>
</div>

<%
    }
%>

</body>
</html>
