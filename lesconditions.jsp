<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Déclaration GLOBALE des variables
    String valeur1 = request.getParameter("valeur1");
    String valeur2 = request.getParameter("valeur2");
    String valeur3 = request.getParameter("valeur3");
%>
<html>
<head>
<title>Les conditions</title>
</head>
<body bgcolor="white">
<h1>Exercices sur les conditions</h1>

<form action="#" method="post">
    <p>Saisir la valeur 1 : <input type="text" id="inputValeur1" name="valeur1"></p>
    <p>Saisir la valeur 2 : <input type="text" id="inputValeur2" name="valeur2"></p>
    <p>Saisir la valeur 3 (pour exercice 1 et 2) : <input type="text" id="inputValeur3" name="valeur3"></p>
    <p><input type="submit" value="Afficher"></p>
</form>

<%
    // Comparaison entre valeur1 et valeur2
    if (valeur1 != null && !valeur1.isEmpty() && valeur2 != null && !valeur2.isEmpty()) {
        int intValeur1 = Integer.parseInt(valeur1);
        int intValeur2 = Integer.parseInt(valeur2);

        if (intValeur1 > intValeur2) {
%>
            <p>Valeur 1 est supérieure à Valeur 2.</p>
<%
        } else if (intValeur1 < intValeur2) {
%>
            <p>Valeur 1 est inférieure à Valeur 2.</p>
<%
        } else {
%>
            <p>Valeur 1 est égale à Valeur 2.</p>
<%
        }
    }
%>
   
    
<h2>Exercice 1 : Comparaison 1</h2>
<p>Ecrire un programme qui demande à l'utilisateur de saisir 3 valeurs (des chiffres),</br>
A, B et C et dites nous si la valeur de C est comprise entre A et B.</br>

<%
    String valeur3 = request.getParameter("valeur3"); // ➔ ajouter ici juste pour les exercices
%>

<form action="#" method="post">
    <p>Saisir la valeur 3 : <input type="text" id="inputValeur3" name="valeur3"></p>
    <p><input type="submit" value="Vérifier"></p>
</form>

<%
    if (valeur1 != null && !valeur1.isEmpty() && valeur2 != null && !valeur2.isEmpty() && valeur3 != null && !valeur3.isEmpty()) {
        int A = Integer.parseInt(valeur1);
        int B = Integer.parseInt(valeur2);
        int C = Integer.parseInt(valeur3);

        if ((C >= A && C <= B) || (C >= B && C <= A)) {
%>
            <p>Oui, C est compris entre A et B.</p>
<%
        } else {
%>
            <p>Non, C n'est pas compris entre A et B.</p>
<%
        }
    }
%>

<h2>Exercice 2 : Pair ou Impair ?</h2>
<p>Écrivez un programme pour vérifier si un nombre est pair ou impair en utilisant une structure if</p>

<%
    if (valeur3 != null && !valeur3.isEmpty()) {
        int nombre = Integer.parseInt(valeur3);

        if (nombre % 2 == 0) {
%>
            <p>Le nombre <%= nombre %> est pair.</p>
<%
        } else {
%>
            <p>Le nombre <%= nombre %> est impair.</p>
<%
        }
    }
%>>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
