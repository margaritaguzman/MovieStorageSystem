package moviestoragesystem.business;

import javax.persistence.*;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
import java.util.HashSet;


@WebServlet("/AddMovieServlet")
public class AddMovieServlet extends HttpServlet {

    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("MovieStorageSystemPU");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String genre = request.getParameter("genre");
        String director = request.getParameter("director");

        boolean hasErrors = false;

        List<String> allowedGenres = Arrays.asList("Action", "Comedy", "Drama", "Horror", "Sci-Fi", "Romance", "Fantasy");

        String titleError = null, genreError = null, directorError = null;
        // Title validation
        if (title.isEmpty()) {
            titleError = "Movie title is required.";
            hasErrors = true;
        } else if (title.length() > 100) {
            titleError = "Title cannot exceed 100 characters.";
            hasErrors = true;
        }

        // Genre validation
        if (genre.isEmpty()) {
            genreError = "Genre is required.";
            hasErrors = true;
        } else if (!allowedGenres.contains(genre)) {
            genreError = "Genre must be one of: " + allowedGenres;
            hasErrors = true;
        }

        // Director validation
        if (director.isEmpty()) {
            directorError = "Director name is required.";
            hasErrors = true;
        } else if (!director.matches("^[a-zA-Z\\s]+$")) {
            directorError = "Director name should contain only letters and spaces.";
            hasErrors = true;
        }

        // If validation fails, return errors to the form
        if (hasErrors) {
            request.setAttribute("titleError", titleError);
            request.setAttribute("genreError", genreError);
            request.setAttribute("directorError", directorError);
            request.setAttribute("title", title);
            request.setAttribute("genre", genre);
            request.setAttribute("director", director);
            RequestDispatcher dispatcher = request.getRequestDispatcher("addMovie.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // If no validation errors, persist the movie
        EntityManager em = emf.createEntityManager();
        EntityTransaction transaction = em.getTransaction();

        try {
            transaction.begin();

            // Check if the genre exists, else create it
            TypedQuery<Genre> genreQuery = em.createQuery("SELECT g FROM Genre g WHERE g.genreName = :name", Genre.class);
            genreQuery.setParameter("name", genre);
            List<Genre> genresList = genreQuery.getResultList();
            Genre movieGenre = genresList.isEmpty() ? new Genre() : genresList.get(0);
            if (genresList.isEmpty()) {
                movieGenre.setGenreName(genre);
                em.persist(movieGenre);
            }

            // Check if the director exists, else create it
            TypedQuery<Director> directorQuery = em.createQuery("SELECT d FROM Director d WHERE d.firstName = :name", Director.class);
            directorQuery.setParameter("name", director);
            List<Director> directorList = directorQuery.getResultList();
            Director movieDirector = directorList.isEmpty() ? new Director() : directorList.get(0);
            if (directorList.isEmpty()) {
                movieDirector.setFirstName(director);
                movieDirector.setLastName("");  // Assuming no last name for simplicity
                em.persist(movieDirector);
            }

            // Persist the movie
            Movie movie = new Movie();
            movie.setTitle(title);
            movie.setDirector(movieDirector);
            movie.setGenres(new HashSet<>(List.of(movieGenre)));
            em.persist(movie);

            // Ensure the changes are written to the database
            em.flush();  // Force the persistence to be written to the database

            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback(); // Rollback in case of an error
            }
            e.printStackTrace();
        } finally {
            em.close(); // Always close the EntityManager
        }

        // Forward to success page
        request.setAttribute("title", title);
        request.setAttribute("genre", genre);
        request.setAttribute("director", director);
        RequestDispatcher dispatcher = request.getRequestDispatcher("movieAdded.jsp");
        dispatcher.forward(request, response);
    }
}
