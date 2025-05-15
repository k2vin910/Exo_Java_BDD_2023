<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>String Manipulation</title>
</head>
<body>

<%
    // Original string
    String bonjour = "salut la compagnie";

    // Convert to uppercase
    String bonjourMajuscules = bonjour.toUpperCase();

    // Capitalize only the first letter (manual logic)
    String bonjourCapitalise = "";
    if (bonjour != null && bonjour.length() > 0) {
        bonjourCapitalise = bonjour.substring(0, 1).toUpperCase() + bonjour.substring(1);
    }
%>

<h2>Original message:</h2>
<p><%= bonjour %></p>

<h2>Uppercase message:</h2>
<p><%= bonjourMajuscules %></p>

<h2>Capitalized first letter only:</h2>
<p><%= bonjourCapitalise %></p>

</body>
</html>
