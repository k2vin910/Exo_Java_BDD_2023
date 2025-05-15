<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tableau</title>
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
            flex-wrap: wrap;
            justify-content: center;
            gap: 10px;
            margin-bottom: 30px;
        }

        input[type="text"] {
            padding: 12px;
            width: 200px;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            background-color: #1a1a1a;
            color: #fff;
            outline: none;
            box-shadow: 0 0 6px #555;
        }

        input[type="submit"] {
            padding: 12px 18px;
            font-size: 16px;
            background: linear-gradient(90deg, #00ffff, #8a2be2);
            color: #0d0d0d;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.3s ease;
            box-shadow: 0 0 8px #00ffff;
        }

        input[type="submit"]:hover {
            box-shadow: 0 0 12px #00ffff;
            transform: scale(1.05);
        }

        .message {
            font-weight: bold;
            margin: 20px 0;
            color: #00ffff;
            text-align: center;
        }

        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
            gap: 12px;
            background-color: #1a1a1a;
            padding: 20px;
            border-radius: 10px;
            width: 80%;
            max-width: 600px;
            box-shadow: 0 0 20px rgba(0, 255, 255, 0.2);
        }

        .grid-item {
            background-color: #262626;
            border: 1px solid #444;
            padding: 15px;
            border-radius: 8px;
            text-align: center;
            color: #fff;
            font-size: 16px;
            box-shadow: 0 0 6px rgba(138, 43, 226, 0.4);
        }
    </style>
</head>
<body>

<h1>Tableau</h1>

<%
    ArrayList<String> tableau = (ArrayList<String>) session.getAttribute("tableau");
    if (tableau == null) {
        tableau = new ArrayList<String>();
        session.setAttribute("tableau", tableau);
    }

    String message = "";
    String action = request.getParameter("action");

    if (action != null) {
        switch (action) {
            case "ajouter":
                String valeur = request.getParameter("valeur");
                if (valeur != null && !valeur.trim().isEmpty()) {
                    if (tableau.size() < 10) {
                        tableau.add(valeur.trim());
                        message = "✅ Value added successfully.";
                    } else {
                        message = "⚠️ The table is full (max 10 items).";
                    }
                } else {
                    message = "❌ Please enter a valid word or number.";
                }
                break;

            case "supprimer":
                if (!tableau.isEmpty()) {
                    tableau.remove(tableau.size() - 1);
                    message = "🗑️ Last value removed.";
                } else {
                    message = "⚠️ The table is already empty.";
                }
                break;

            case "afficher":
                if (tableau.isEmpty()) {
                    message = "📭 The table is empty.";
                } else {
                    message = "📋 Displaying current contents below.";
                }
                break;

            case "vider":
                tableau.clear();
                message = "🧹 Table cleared.";
                break;
        }
    }
%>

<form method="post">
    <input type="text" name="valeur" placeholder="Enter value...">
    <input type="submit" name="action" value="ajouter">
    <input type="submit" name="action" value="supprimer">
    <input type="submit" name="action" value="afficher">
    <input type="submit" name="action" value="vider">
</form>

<div class="message"><%= message %></div>

<%
    if ("afficher".equals(action) && !tableau.isEmpty()) {
%>
    <div class="grid-container">
        <% for (int i = 0; i < tableau.size(); i++) { %>
            <div class="grid-item">
                <%= tableau.get(i) %>
            </div>
        <% } %>
    </div>
<%
    }
%>

</body>
</html>
