<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
<title>Gestionnaire de Tâches</title>
</head>
<body bgcolor="white">
<h1>Saisir une tâche</h1>
<form action="tasks.jsp" method="post">
    <label for="inputTitre">Saisir le titre de la tâche : </label>
    <input type="text" id="inputTitre" name="titre" required><br>
    <label for="inputDescription">Saisir la description de la tâche : </label>
    <input type="text" id="inputDescription" name="description" required><br>
    <label for="inputDate">Saisir la date d'échéance : </label>
    <input type="date" id="inputDate" name="dueDate" required><br>
    <input type="submit" value="Enregistrer">
</form>

<%! 
    class Task {
        String title;
        String description;
        String dueDate;

        public Task(String title, String description, String dueDate) {
            this.title = title;
            this.description = description;
            this.dueDate = dueDate;
        }
    }
%>

<%
    // Récupérer les données soumises par le formulaire
    String titre = request.getParameter("titre");
    String description = request.getParameter("description");
    String dueDate = request.getParameter("dueDate");

    // Si une tâche a été ajoutée, on la stocke dans la session
    if (titre != null && !titre.isEmpty() && description != null && !description.isEmpty() && dueDate != null) {
        Task newTask = new Task(titre, description, dueDate);
        
        // Récupérer la liste des tâches depuis la session
        ArrayList<Task> tasks = (ArrayList<Task>) session.getAttribute("tasks");
        if (tasks == null) {
            tasks = new ArrayList<>();
            session.setAttribute("tasks", tasks);
        }

        // Ajouter la nouvelle tâche à la liste
        tasks.add(newTask);
    }

    // Afficher toutes les tâches stockées
    ArrayList<Task> tasks = (ArrayList<Task>) session.getAttribute("tasks");
    if (tasks != null && !tasks.isEmpty()) {
%>
        <h2>Liste des tâches</h2>
        <ul>
            <c:forEach var="task" items="${sessionScope.tasks}">
                <li>
                    <b>Titre :</b> ${task.title} <br>
                    <b>Description :</b> ${task.description} <br>
                    <b>Date d'échéance :</b> ${task.dueDate} <br>
                </li>
            </c:forEach>
        </ul>
<%
    } else {
%>
        <p>Aucune tâche n'a été ajoutée.</p>
<%
    }
%>

</body>
</html>
