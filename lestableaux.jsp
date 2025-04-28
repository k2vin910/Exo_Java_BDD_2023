<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les tableaux</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les tableaux</h1>
<form action="#" method="post">
    <p>Saisir au minimu 3 chiffres à la suite, exemple : 6 78 15 <input type="text" id="inputValeur" name="chaine">
    <p><input type="submit" value="Afficher">
</form>
<%-- Récupération des valeurs --%>
    <% String chaine = request.getParameter("chaine"); %>
    
    <% if (chaine != null) { %>

    <%-- Division de la chaîne de chiffres séparés par des espaces --%>
    <% String[] tableauDeChiffres = chaine.split("\\s+"); %>
    <p>La tableau contient <%= tableauDeChiffres.length %> valeurs</br>
    Chiffre 1 : <%= Integer.parseInt(tableauDeChiffres[0]) %></br>
    Chiffre 2 : <%= Integer.parseInt(tableauDeChiffres[1]) %></br>
    Chiffre 3 : <%= Integer.parseInt(tableauDeChiffres[2]) %></p>
    
<h2>Exercice 1 : Le carré de la première valeur</h2>
<%
    int premiereValeur = Integer.parseInt(tableauDeChiffres[0]);
    int carrePremiereValeur = premiereValeur * premiereValeur;
%>
<p>Le carré de la première valeur est : <%= carrePremiereValeur %></p>

<h2>Exercice 2 : La somme des 2 premières valeurs</h2>
<%
    int deuxiemeValeur = Integer.parseInt(tableauDeChiffres[1]);
    int sommeDeuxPremiers = premiereValeur + deuxiemeValeur;
%>
<p>La somme des deux premières valeurs est : <%= sommeDeuxPremiers %></p>

<h2>Exercice 3 : La somme de toutes les valeurs</h2>
<%
    int sommeTotale = 0;
    for (int i = 0; i < tableauDeChiffres.length; i++) {
        sommeTotale += Integer.parseInt(tableauDeChiffres[i]);
    }
%>
<p>La somme de toutes les valeurs est : <%= sommeTotale %></p>

<h2>Exercice 4 : La valeur maximum</h2>
<%
    int maximum = Integer.parseInt(tableauDeChiffres[0]);
    for (int i = 1; i < tableauDeChiffres.length; i++) {
        int valeur = Integer.parseInt(tableauDeChiffres[i]);
        if (valeur > maximum) {
            maximum = valeur;
        }
    }
%>
<p>La valeur maximale est : <%= maximum %></p>

<h2>Exercice 5 : La valeur minimale</h2>
<%
    int minimum = Integer.parseInt(tableauDeChiffres[0]);
    for (int i = 1; i < tableauDeChiffres.length; i++) {
        int valeur = Integer.parseInt(tableauDeChiffres[i]);
        if (valeur < minimum) {
            minimum = valeur;
        }
    }
%>
<p>La valeur minimale est : <%= minimum %></p>

<h2>Exercice 6 : La valeur la plus proche de 0</h2>
<%
    int procheDeZero = Integer.parseInt(tableauDeChiffres[0]);
    for (int i = 1; i < tableauDeChiffres.length; i++) {
        int valeur = Integer.parseInt(tableauDeChiffres[i]);
        if (Math.abs(valeur) < Math.abs(procheDeZero)) {
            procheDeZero = valeur;
        }
    }
%>
<p>La valeur la plus proche de 0 est : <%= procheDeZero %></p>

<h2>Exercice 7 : La valeur la plus proche de 0 (2° version)</h2>
<%
    int procheDeZero2 = Integer.parseInt(tableauDeChiffres[0]);
    for (int i = 1; i < tableauDeChiffres.length; i++) {
        int valeur = Integer.parseInt(tableauDeChiffres[i]);
        if (Math.abs(valeur) < Math.abs(procheDeZero2)) {
            procheDeZero2 = valeur;
        } else if (Math.abs(valeur) == Math.abs(procheDeZero2) && valeur > procheDeZero2) {
            procheDeZero2 = valeur;
        }
    }
%>
<p>La valeur la plus proche de 0 (version avec préférence pour le positif) est : <%= procheDeZero2 %></p>


<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
