<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Manipulation de chaîne</title>
</head>
<body>

<%
    // Déclaration de la chaîne
    String bonjour = "salut la compagnie";

    // Conversion en majuscules
    String bonjourMajuscules = bonjour.toUpperCase();

    // Fonction pour mettre juste la première lettre en majuscule
    String capitalizeFirstLetter(String s) {
        if (s == null || s.length() == 0) return s;
        return s.substring(0, 1).toUpperCase() + s.substring(1);
    }

    // Appel de la méthode personnalisée
    String bonjourCapitalise = capitalizeFirstLetter(bonjour);
%>

<h2>Message original :</h2>
<p><%= bonjour %></p>

<h2>Message en majuscules :</h2>
<p><%= bonjourMajuscules %></p>

<h2>Message avec la première lettre en majuscule :</h2>
<p><%= bonjourCapitalise %></p>

</body>
</html>
