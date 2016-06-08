<%@page import="java.sql.SQLException"%>
<%@page import="Model.DataBaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Daftar Mata Kuliah</title>
    </head>
    <style>
        .tabelinfoMaKul {
            margin:0px;padding:0px;
            width:100%;
            border:1px solid #ffffff;

            -moz-border-radius-bottomleft:0px;
            -webkit-border-bottom-left-radius:0px;
            border-bottom-left-radius:0px;

            -moz-border-radius-bottomright:0px;
            -webkit-border-bottom-right-radius:0px;
            border-bottom-right-radius:0px;

            -moz-border-radius-topright:0px;
            -webkit-border-top-right-radius:0px;
            border-top-right-radius:0px;

            -moz-border-radius-topleft:0px;
            -webkit-border-top-left-radius:0px;
            border-top-left-radius:0px;
        }.tabelinfoMaKul table{
            border-collapse: collapse;
            border-spacing: 0;
            width:100%;
            height:100%;
            margin:0px;padding:0px;
        }.tabelinfoMaKul tr:last-child td:last-child {
            -moz-border-radius-bottomright:0px;
            -webkit-border-bottom-right-radius:0px;
            border-bottom-right-radius:0px;
        }
        .tabelinfoMaKul table tr:first-child td:first-child {
            -moz-border-radius-topleft:0px;
            -webkit-border-top-left-radius:0px;
            border-top-left-radius:0px;
        }
        .tabelinfoMaKul table tr:first-child td:last-child {
            -moz-border-radius-topright:0px;
            -webkit-border-top-right-radius:0px;
            border-top-right-radius:0px;
        }.tabelinfoMaKul tr:last-child td:first-child{
            -moz-border-radius-bottomleft:0px;
            -webkit-border-bottom-left-radius:0px;
            border-bottom-left-radius:0px;
        }.tabelinfoMaKul tr:hover td{

        }
        .tabelinfoMaKul tr:nth-child(odd){ background-color:#aad4ff; }
        .tabelinfoMaKul tr:nth-child(even)    { background-color:#ffffff; }.tabelinfoMaKul td{
            vertical-align:middle;


            border:1px solid #ffffff;
            border-width:0px 1px 1px 0px;
            text-align:center;
            padding:7px;
            font-size:12px;
            font-family:Arial;
            font-weight:normal;
            color:#000000;
        }.tabelinfoMaKul tr:last-child td{
            border-width:0px 1px 0px 0px;
        }.tabelinfoMaKul tr td:last-child{
            border-width:0px 0px 1px 0px;
        }.tabelinfoMaKul tr:last-child td:last-child{
            border-width:0px 0px 0px 0px;
        }
        .tabelinfoMaKul tr:first-child td{
            background:-o-linear-gradient(bottom, #005fbf 5%, #003f7f 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #005fbf), color-stop(1, #003f7f) );
            background:-moz-linear-gradient( center top, #005fbf 5%, #003f7f 100% );
            filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#005fbf", endColorstr="#003f7f");	background: -o-linear-gradient(top,#005fbf,003f7f);

            background-color:#005fbf;
            border:0px solid #ffffff;
            text-align:center;
            border-width:0px 0px 1px 1px;
            font-size:14px;
            font-family:Arial;
            font-weight:bold;
            color:#ffffff;
        }
        .tabelinfoMaKul tr:first-child:hover td{
            background:-o-linear-gradient(bottom, #005fbf 5%, #003f7f 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #005fbf), color-stop(1, #003f7f) );
            background:-moz-linear-gradient( center top, #005fbf 5%, #003f7f 100% );
            filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#005fbf", endColorstr="#003f7f");	background: -o-linear-gradient(top,#005fbf,003f7f);

            background-color:#005fbf;
        }
        .tabelinfoMaKul tr:first-child td:first-child{
            border-width:0px 0px 1px 0px;
        }
        .tabelinfoMaKul tr:first-child td:last-child{
            border-width:0px 0px 1px 1px;
        }

        body {
            background-color: chocolate;
        }
    </style>
    <body class="body">
        <p align="right"><a href="Home Page.jsp"><button><image src="image/home_1.png" height="36px" width="36px"><br>HOME</button></a>
                        <a  href="logout"><button><image src="image/logout.png" height="36px" width="36px"><br>LOGOUT</button></a></p>
    <h4 align="right">
        User : <% out.print(session.getAttribute("username"));%></h4>
                                            <%
        DataBaseConnection con = new DataBaseConnection();
        con.getConnection();
        %> 
            <% DataBaseConnection conn = new DataBaseConnection();
                try {
                    String query = "SELECT * FROM mahasiswa";
                    Statement statement = conn.getConnection().createStatement();
                    ResultSet result = statement.executeQuery(query);
            %> </h3>
        <h2 align="center">Daftar Mata Kuliah Yang Tersedia</h2><br>
        <div class="tabelinfoMaKul">
            <table border="1" frame="border" align="center">
                <tr bgcolor="lightgrey" align="center">
                    <td>
                        <b>Kode Mata Kuliah</b>
                    </td>
                    <td>
                        <b>Nama Mata Kuliah</b>
                    </td>
                    <td>
                        <b>Jumlah SKS</b>
                    </td>
                    <td>
                        <b>Dosen Pengampu</b>
                    </td>
                    <td>
                        <b>Jam</b>
                    </td>
                     <td>
                        <b>Hari</b>
                    </td>
                </tr>
                <%
                        while (result.next()) {%>
                <tr>
                    <td><%=result.getString("kodemakul")%></td>
                    <td><%=result.getString("nama_makul")%></td>
                    <td><%=result.getString("sks")%></td>
                    <td><%=result.getString("dosen")%></td>

                    <td><%=result.getString("jam")%></td>
                    <td><%=result.getString("hari")%></td>
                </tr>
                <% }
                %>
                <%
                        statement.close();
                    } catch (Exception ex) {
                        out.print("messages: " + ex.getMessage());
                    }
                %></td>
                </tr>
            </table>
        </div>
        <table align="center">
            <tr>
                <td>
                    <a href="Home Page.jsp"><button><image src="image/back.png" height="16px" width="16px"> Kembali</button></a>
                </td>
            </tr>
        </table>
    </body>
</html>
