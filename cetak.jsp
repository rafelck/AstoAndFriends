<%-- 
    Document   : cetak
    Created on : Jun 9, 2014, 8:28:26 AM
    Author     : Anonymous
--%>

<%@page import="Model.DataBaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KRS</title>
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
</style>
<body class="body">
<p align="right">
    <a href="Home Page.jsp">
        <button><image src="image/home_1.png" height="36px" width="36px"><br>HOME</button>
    </a>
    <a href="logout">
        <button><image src="image/logout.png" height="36px" width="36px"><br>LOGOUT</button>
    </a>
</p>
    <h4 align="right">User : <% out.print(session.getAttribute("username"));%></h4>
    <h2 align="center">K R S<br><% out.print(session.getAttribute("username"));%></h2><br>
<div class="tabelinfoMaKul">
    <table>
        <tr>
            <td>
                Mata Kuliah
            </td>
            <td>
                Kode
            </td>
            <td>
                Dosen Pangampu
            </td>
            <td>
                Jumlah SKS
            </td>
            <td>
                Tarif
            </td>
        </tr>

        <%
            
           int totalsks2 = 0;
                int tarif2 = 165000;
                int totaltarif2=0;
            DataBaseConnection connection = new DataBaseConnection();
            try {
                String query = "select  * from pilih_makul a, mahasiswa b where username ="+session.getAttribute("username")+" and a.kd_makul = b.kodemakul";
                Statement statement = connection.getConnection().createStatement();
                ResultSet result = statement.executeQuery(query);
           while (result.next()) {
            totalsks2 = totalsks2 + Integer.parseInt(result.getString("sks"));
                                            
           %>
                <tr>
                    <td><%=result.getString("nama_makul")%></td>
                    <td><%=result.getString("kd_makul")%></td>
                    <td><%=result.getString("dosen")%></td>
                    <td><%=result.getString("sks")%></td>
                    <td><%=result.getString("hari")%></td>
                    <td><%=result.getString("jam")%></td>
        <%
                     totaltarif2 = tarif2*totalsks2;
                    totalsks2 = totalsks2 + Integer.parseInt(result.getString("sks"));
                }
                statement.close();
            } catch (Exception ex) {
                ex.getMessage();
            }%>

       
    </table>
            
</div>
     <h3>Total sks : <%=totalsks2%> Sks</h3>
        <h3>Total TARIF : Rp. <%=totaltarif2%> ,00</h3>
<center>
    <table>
        <tr>
            <td></td>
            <td></td>
            <td><a href="KRS2.jsp"><button><image src="image/back.png" height="16px" width="16px"> Kembali</button></a></td>
            <td></td>
        </tr>
    </table>
</center>
</body>
</html>
