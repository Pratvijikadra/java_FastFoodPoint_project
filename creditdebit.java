import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/creditdebit")
public class creditdebit extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the payment amount from the request
        String paymentAmount = request.getParameter("Amount");

        if (paymentAmount != null && !paymentAmount.isEmpty()) {
            // Convert the payment amount to a double
            double amount = Double.parseDouble(paymentAmount);

            // Database connection variables
          
            Connection connection = null;

            try {
                // Load the JDBC-ODBC driver
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

                // Establish the connection to the Access database
                connection = DriverManager.getConnection("jdbc:odbc:food");

                // SQL query to insert the payment amount into the orders table
                String query = "INSERT INTO orders (payment_amount) VALUES (?)";
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setDouble(1, amount);

                // Execute the update
                int rowsInserted = preparedStatement.executeUpdate();

                if (rowsInserted > 0) {
                    // Redirect to a success page after storing the payment amount
                    response.sendRedirect("paymentSuccess.jsp");
                } else {
                    // If no rows were inserted, show an error message
                    response.sendRedirect("paymentError.jsp");
                }

            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
                // Redirect to an error page if there's an issue with the database connection
                response.sendRedirect("paymentError.jsp");
            } finally {
                try {
                    // Close the connection
                    if (connection != null) {
                        connection.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } else {
            // Redirect back if the required payment amount parameter is missing
            response.sendRedirect("paymentError.jsp");
        }
    }
}
