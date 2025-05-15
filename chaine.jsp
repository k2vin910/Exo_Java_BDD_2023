<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>String Formatter - Dark Theme</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #0d0d0d;
            color: #f0f0f0;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px;
        }

        h1 {
            color: #ffffff;
            font-size: 2.5em;
            text-shadow: 0 0 8px #00ffff;
            margin-bottom: 30px;
        }

        form {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
        }

        input[type="text"] {
            padding: 12px;
            width: 320px;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            background-color: #1a1a1a;
            color: #fff;
            outline: none;
            box-shadow: 0 0 6px #555;
        }

        input[type="text"]::placeholder {
            color: #888;
        }

        input[type="submit"] {
            padding: 12px 20px;
            font-size: 16px;
            background: linear-gradient(90deg, #00ffff, #8a2be2);
            color: #0d0d0d;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            margin-left: 10px;
            cursor: pointer;
            transition: 0.3s ease;
            box-shadow: 0 0 8px #00ffff;
        }

        input[type="submit"]:hover {
            box-shadow: 0 0 12px #00ffff;
            transform: scale(1.05);
        }

        .result {
            background-color: #1a1a1a;
            padding: 30px;
            border-radius: 10px;
            width: 450px;
            box-shadow: 0 0 20px rgba(0, 255, 255, 0.3);
        }

        .result p {
            font-size: 18px;
            margin: 12px 0;
            color: #fff;
        }

        .label {
            color: #8a2be2;
            font-weight: bold;
        }
    </style>
</head>
<body>

<h1>String Formatter</h1>

<form method="get" action="chaine.jsp">
    <input type="text" name="inputText" placeholder="Type your text..." required>
    <input type="submit" value="Format">
</form>

<%
    String input = request.getParameter("inputText");
    if (input != null && !input.trim().isEmpty()) {
        String uppercase = input.toUpperCase();
        String capitalized = input.substring(0, 1).toUpperCase() + input.substring(1);
%>

<div class="result">
    <p><span class="label">Original:</span> <%= input %></p>
    <p><span class="label">Uppercase:</span> <%= uppercase %></p>
    <p><span class="label">Capitalized:</span> <%= capitalized %></p>
</div>

<%
    }
%>

</body>
</html>
