<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tableau d'entiers - Menu interactif</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f1f1f1;
            padding: 40px;
            text-align: center;
        }
        form {
            margin: 20px auto;
        }
        input[type="number"] {
            padding: 8px;
            width: 80px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        input[type="submit"] {
            padding: 10px 15px;
            margin: 8px;
            border: none;
            background-color: #007BFF;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .message {
            font-weight: bold;
            color: #333;
            margin-top: 20px;
        }
        .output {
            margin-top: 20px;
            padding: 15px;
            background-color: white;
            border-radius: 10px;
            width: 50%;
            margin-left: auto;
            margin-right: auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

<h1>Gestion du tableau d'entiers (max 10)</h1>

<%
    ArrayList<Integer> tableau = (ArrayList<Integer>) session.getAttribute("tableau");
    if (tableau == null) {
        tableau = new ArrayList<Integer>();
        session.setAttribute("tableau", tableau);
    }

    String message = "";
    String action = request.getParameter("action");

    if (action != null) {
        switch (action) {
            case "ajouter":
                try {
                    int valeur = Integer.parseInt(request.getParameter("valeur"));
                    if (tableau.size() < 10) {
                        tableau.add(valeur);
                        message = "✅ Valeur ajoutée avec succès.";
                    } else {
                        message = "⚠️ Tableau plein. Maximum de 10 éléments.";
                    }
                } catch (Exception e) {
                    message = "❌ Veuillez entrer une valeur entière valide.";
                }
                break;

            case "supprimer":
                if (!tableau.isEmpty()) {
                    tableau.remove(tableau.size() - 1);
                    message = "🗑️ Dernière valeur supprimée.";
                } else {
                    message = "⚠️ Le tableau est déjà vide.";
                }
                break;

            case "afficher":
                if (tableau.isEmpty()) {
                    message = "📭 Le tableau est vide.";
                } else {
                    message = "📋 Contenu actuel du tableau affiché ci-dessous.";
                }
                break;

            case "vider":
                tableau.clear();
                message = "🧹 Tableau vidé.";
                break;
        }
    }
%>

<form method="post">
    <input type="number" name="valeur" placeholder="Valeur">
    <input type="submit" name="action" value="ajouter">
    <input type="submit" name="action" value="supprimer">
    <input type="submit" name="action" value="afficher">
    <input type="submit" name="action" value="vider">
</form>

<div class="message"><%= message %></div>

<%
    if (action != null && action.equals("afficher") && !tableau.isEmpty()) {
%>
    <div class="output">
        <% for (int i = 0; i < tableau.size(); i++) { %>
            Élément <%= i + 1 %> : <%= tableau.get(i) %><br>
        <% } %>
    </div>
<%
    }
%>

</body>
</html>

