<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie List</title>
        <link rel="stylesheet" type="text/css" href="styles/main.css">
    </head>
    <body>
        <h1>Movie List</h1>

        <c:if test="${empty movies}">
            <p>No movies found.</p>
        </c:if>

        <c:if test="${not empty movies}">
            <table border="1">
                <tr>
                    <th>Title</th>
                    <th>Director</th>
                </tr>
                <c:forEach var="movie" items="${movies}">
                    <tr>
                        <td>${movie.title}</td>
                        <td>${movie.director.firstName} ${movie.director.lastName}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>

    </body>
</html>
