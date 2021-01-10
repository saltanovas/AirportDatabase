import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Query {

    public Query() {
        /*
         */
    }

    public List<Map<String, Object>> queryData(PreparedStatement stmt, List<Object> values) throws SQLException {
        return getData(avoidInjection(stmt, values).executeQuery());
    }

    public int updateData(PreparedStatement stmt, List<Object> values) throws SQLException {
        return avoidInjection(stmt, values).executeUpdate();
    }

    private List<Map<String, Object>> getData(ResultSet rs) throws SQLException {
        ResultSetMetaData md = rs.getMetaData();
        int columns = md.getColumnCount();
        List<Map<String, Object>> list = new ArrayList<>();

        while (rs.next()) {
            Map<String, Object> row = new HashMap<>(columns);
            for (int i = 1; i <= columns; ++i) {
                row.put(md.getColumnLabel(i), rs.getObject(i));
            }
            list.add(row);
        }

        return list;
    }

    private PreparedStatement avoidInjection(PreparedStatement stmt, List<Object> values) throws SQLException {
        for (int i = 1; i < values.size() + 1; ++i)
            stmt.setObject(i, values.get(i - 1));
        return stmt;
    }
}
