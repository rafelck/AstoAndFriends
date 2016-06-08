<%-- 
    Document   : Home Page
    Created on : Jun 7, 2014, 2:47:41 PM
    Author     : Anonymous
--%>

<%@page import="Model.DataBaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <style>
        body {
            background-color: chocolate;
        }
    </style>
    <body class="body">
    <center><h3>Selamat Datang <%
        DataBaseConnection con = new DataBaseConnection();
        con.getConnection();
        try {
            String query = ("select * from data where nim = " + session.getAttribute("username"));
            Statement stat = con.getConnection().createStatement();
            ResultSet result = stat.executeQuery(query);
            String pwd = null;
            while (result.next()) {
                out.print(result.getString("nama"));
            }
            con.getClosed();
        } catch (SQLException ex) {
            ex.getMessage();
        }
            %></h3></center>
    <center><a href="Home Page.jsp"><button><image src="image/home_1.png" height="36px" width="36px"><br>HOME</button></a>
        <a href="Daftar MaKul.jsp"><button><image src="image/list.png" height="36px" width="36px"><br>Daftar Mata Kuliah</button></a>
        <a href="KRS2.jsp"><button><image src="image/add_1.png" height="36px" width="36px"><br>Mulai Memilih Mata Kuliah</button></a>
        <a href="logout"><button><image src="image/logout.png" height="36px" width="36px"><br>LOGOUT</button></a></center>
</body>
</html>
