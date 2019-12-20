package Servicios;


import java.sql.*;

abstract public class DBService {


    protected static String database = "integrador";
    private static String user = "root";
    private static String pass = "root";
    private static String url = String.format("jdbc:mysql://%s:%d/%s?useSSL=false&useUnicode=true&serverTimezone=UTC", "localhost", 3306,
            database);
    private static Connection connection = null;

    static {
        try {
            if (DBService.connection == null) { // Singleton de conexión
                Class.forName("com.mysql.cj.jdbc.Driver");
                DBService.connection = DriverManager.getConnection(url, user, pass);

            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.exit(0);
        }
    }

    protected static final void execInsert(String query) throws SQLException {
        Statement st = (Statement) connection.createStatement();
        st.executeUpdate(query);
    }

    protected static final ResultSet execSelect(String query) throws SQLException {
        return connection.createStatement().executeQuery(query);
    }

    protected static String cifrado(Object pass)
    {
        return "MD5("+pass+")";
    }

    protected static final void execUpdate(String query) throws SQLException {
        Statement st = connection.createStatement();
        st.executeUpdate(query);
    }

    protected static final String comillas(String string) {
        return "'" + string + "'";
    }

    protected static final Integer execInsert(String query, Integer columnIndex) throws SQLException {
        Statement st = connection.createStatement();
        st.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);
        ResultSet rs = st.getGeneratedKeys();
        rs.next();
        return rs.getInt(columnIndex);
    }

}
