<%@ page import="java.sql.*, java.io.*, db.DBConnector" %>
<%
    response.setContentType("image/jpeg"); // or "image/png" depending on image format
    int hotelId = Integer.parseInt(request.getParameter("id"));

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        con = DBConnector.getConnection();
        ps = con.prepareStatement("SELECT image FROM hotels WHERE hotel_id = ?");
        ps.setInt(1, hotelId);
        rs = ps.executeQuery();

        if (rs.next()) {
            byte[] imageBytes = rs.getBytes("image");
            OutputStream os = response.getOutputStream();
            os.write(imageBytes);
            os.flush();
            os.close();
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
    }
%>
