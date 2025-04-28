<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les chaines</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les chaines de charactères</h1>
<form action="#" method="post">
    <p>Saisir une chaine (Du texte avec 6 caractères minimum) : <input type="text" id="inputValeur" name="chaine">
    <p><input type="submit" value="Afficher">
</form>
<%-- Récupération des valeurs --%>
    <% String chaine = request.getParameter("chaine"); %>
    
    <% if (chaine != null) { %>

    <%-- Obtention de la longueur de la chaîne --%>
    <% int longueurChaine = chaine.length(); %>
    <p>La longueur de votre chaîne est de <%= longueurChaine %> caractères</p>

    <%-- Extraction du 3° caractère dans votre chaine --%>
    <% char caractereExtrait = chaine.charAt(2); %>
    <p>Le 3° caractère de votre chaine est la lettre <%= caractereExtrait %></p>

    <%-- Obtention d'une sous-chaîne --%>
    <% String sousChaine = chaine.substring(2, 6); %>
    <p>Une sous chaine de votre texte : <%= sousChaine %></p>

    <%-- Recharche de la lettre "e" --%>
    <% char recherche = 'e'; 
       int position = chaine.indexOf(recherche); %>
    <p>Votre premier "e" est en : <%= position %></p>

    
<h2>Exercice 1 : Combien de 'e' dans notre chaine de charactère ?</h2>
<%
    int compteurE = 0;
    for (int i = 0; i < chaine.length(); i++) {
        if (chaine.charAt(i) == 'e' || chaine.charAt(i) == 'E') {
            compteurE++;
        }
    }
%>
<p>Le nombre de lettres 'e' dans votre chaine est : <%= compteurE %></p>

<h2>Exercice 2 : Affichage vertical</h2>
<%
    for (int i = 0; i < chaine.length(); i++) {
%>
    <p><%= chaine.charAt(i) %></p>
<%
    }
%>

<h2>Exercice 3 : Retour à la ligne (espace = nouvelle ligne)</h2>
<%
    String[] mots = chaine.split(" ");
    for (int i = 0; i < mots.length; i++) {
%>
    <p><%= mots[i] %></p>
<%
    }
%>

<h2>Exercice 4 : Afficher une lettre sur deux</h2>
<%
    StringBuilder uneLettreSurDeux = new StringBuilder();
    for (int i = 0; i < chaine.length(); i += 2) {
        uneLettreSurDeux.append(chaine.charAt(i));
    }
%>
<p>Texte avec une lettre sur deux : <%= uneLettreSurDeux.toString() %></p>

<h2>Exercice 5 : La phrase en verlant</h2>
<%
    StringBuilder verlant = new StringBuilder(chaine);
    verlant.reverse();
%>
<p>Votre texte en verlant : <%= verlant.toString() %></p>

<h2>Exercice 6 : Consonnes et voyelles</h2>
<%
    int voyelles = 0;
    int consonnes = 0;
    String voyellesStr = "aeiouyAEIOUY";

    for (int i = 0; i < chaine.length(); i++) {
        char c = chaine.charAt(i);
        if (Character.isLetter(c)) {
            if (voyellesStr.indexOf(c) != -1) {
                voyelles++;
            } else {
                consonnes++;
            }
        }
    }
%>
<p>Nombre de voyelles : <%= voyelles %></p>
<p>Nombre de consonnes : <%= consonnes %></p>

<!-- ======================= Fin Exercices ============================ -->

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
