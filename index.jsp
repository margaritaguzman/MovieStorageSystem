<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Storage System</title>
        <link rel="stylesheet" type="text/css" href="styles/main.css">
    </head>
    <body>

        <h1>Welcome to the Movie Storage System</h1>
        <h2>Movie List</h2>
         <div class="movie-list">
            <div class="movie-item">
                <img src="images/blade.jpg" alt="Blade Poster">
                <div class="movie-title">Blade</div>
                <div class="movie-info">Genre: Action</div>
                <div class="movie-info">Director: Stephen Norrington</div>
            </div>
            <div class="movie-item">
                <img src="images/wedding_crashers.jpg" alt="Wedding Crashers Poster">
                <div class="movie-title">Wedding Crashers</div>
                <div class="movie-info">Genre: Comedy</div>
                <div class="movie-info">Director: David Dobkin</div>
            </div>
            <div class="movie-item">
                <img src="images/atlas.jpg" alt="Atlas Poster">
                <div class="movie-title">Atlas</div>
                <div class="movie-info">Genre: Sci-Fi</div>
                <div class="movie-info">Director: Brad Peyton</div>
            </div>
            <div class="movie-item">
                <img src="images/inception.jpg" alt="Inception Poster">
                <div class="movie-title">Inception</div>
                <div class="movie-info">Genre: Sci-Fi</div>
                <div class="movie-info">Director: Christopher Nolan</div>
            </div>
            <div class="movie-item">
                <img src="images/dark_knight.jpg" alt="The Dark Knight Poster">
                <div class="movie-title">The Dark Knight</div>
                <div class="movie-info">Genre: Action</div>
                <div class="movie-info">Director: Christopher Nolan</div>
            </div>
        </div>
        <a href="addMovie.jsp">Add New Movie</a>
        <a href="listMovies.jsp">View All Movies</a>
    </body>
</html>
