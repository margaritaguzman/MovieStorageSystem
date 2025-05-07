<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add New Movie</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="styles/main.css">
    </head>
    <body>
        <h1>Add New Movie</h1>

        <form action="AddMovieServlet" method="post">
            <label for="title">Movie Title:</label><br>
            <input type="text" id="title" name="title" value="<%= request.getAttribute("title") != null ? request.getAttribute("title") : ""%>"><br>
            <% if (request.getAttribute("titleError") != null) {%>
            <span class="error"><%= request.getAttribute("titleError")%></span><br>
            <% }%>
            <br>

            <label for="genre">Genre:</label><br>
            <select id="genre" name="genre">
                <option value="">-- Select Genre --</option>
                <option value="Action" <%= "Action".equals(request.getAttribute("genre")) ? "selected" : ""%>>Action</option>
                <option value="Comedy" <%= "Comedy".equals(request.getAttribute("genre")) ? "selected" : ""%>>Comedy</option>
                <option value="Drama" <%= "Drama".equals(request.getAttribute("genre")) ? "selected" : ""%>>Drama</option>
                <option value="Horror" <%= "Horror".equals(request.getAttribute("genre")) ? "selected" : ""%>>Horror</option>
                <option value="Sci-Fi" <%= "Sci-Fi".equals(request.getAttribute("genre")) ? "selected" : ""%>>Sci-Fi</option>
                <option value="Romance" <%= "Romance".equals(request.getAttribute("genre")) ? "selected" : ""%>>Romance</option>
                <option value="Fantasy" <%= "Fantasy".equals(request.getAttribute("genre")) ? "selected" : ""%>>Fantasy</option>
            </select><br>

            <% if (request.getAttribute("genreError") != null) {%>
            <span class="error"><%= request.getAttribute("genreError")%></span><br>
            <% }%>
            <br>

            <label for="director">Director:</label><br>
            <input type="text" id="director" name="director" value="<%= request.getAttribute("director") != null ? request.getAttribute("director") : ""%>"><br>
            <% if (request.getAttribute("directorError") != null) {%>
            <span class="error"><%= request.getAttribute("directorError")%></span><br>
            <% }%>
            <br>

            <input type="submit" value="Add Movie">
        </form>
    </body>
</html>
