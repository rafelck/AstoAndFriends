<%-- 
    Document   : KRS2
    Created on : Jun 8, 2014, 1:20:03 PM
    Author     : Anonymous
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Model.DataBaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pilih Mata Kuliah</title>
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
        <p align="right">
            <a href="Home Page.jsp"><button><image src="image/home_1.png" height="36px" width="36px"><br>HOME</button></a>
            <a  href="logout"><button><image src="image/logout.png" height="36px" width="36px"><br>LOGOUT</button></a></p>
        <h4 align="right">User : <% out.print(session.getAttribute("username"));%></h4>
        <table>
            <tr>
                <td>
                    <b>Pilih Mata Kuliah &nbsp;</b>
                </td>
            <form action="" method="POST">
                <td>
                    <select name="krsMakul">
                        <option value="kosong">--Pilih Mata Kuliah--</option>
                        <%
                                 String nama_makul = request.getParameter("nama_makul");

                            session.setAttribute("namaMakul", nama_makul);
                            DataBaseConnection connection = new DataBaseConnection();
                            try {
                                String query = "select * from mahasiswa";
                                Statement statement = connection.getConnection().createStatement();
                                ResultSet result = statement.executeQuery(query);

                                while (result.next()) {
                out.print("<option value ='"+result.getString("nama_makul")+"'"
                        + ">"+result.getString("nama_makul")+"</option>" );

                                }
                                statement.close();
                            } catch (Exception ex) {
                                ex.getMessage();
                            }
                        %>
                    </select>
                </td>
                <td>
                    <button><image src="image/ok.png" height="12px" width="12px"> Pilih</button>
                </td>
            </form>
        </tr>
    </table>
<center><h2>Detail Mata Kuliah : </h2></center>
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
                Hari
            </td>
             <td>
                Jam
            </td>
            <td>
                Tambah?
            </td>
        </tr>
        <tr>
            <%
                
                try {
                     String query2="select * from mahasiswa where nama_makul = '"+request.getParameter("krsMakul")+"'";
                        Statement ss2 = connection.getConnection().createStatement();
                        ResultSet rs2 = ss2.executeQuery(query2);
                        while(rs2.next()){
                            String nm_matakuliah = rs2.getString("nama_makul");
                            session.setAttribute("makulNama", nm_matakuliah);
                            
                            String kd_maktakuliah = rs2.getString("kodemakul");
                            session.setAttribute("kd_makul", kd_maktakuliah);
                            
                            String sks_matakuliah = rs2.getString("sks");
                            session.setAttribute("sks_makul", sks_matakuliah);
                            
                             String dosen_matakuliah = rs2.getString("dosen");
                            session.setAttribute("dosen_makul", dosen_matakuliah);
                               
                            String hari_matakuliah = rs2.getString("hari");
                            session.setAttribute("hari_makul", hari_matakuliah); 
                            
                            String jam_matakuliah = rs2.getString("jam");
                            session.setAttribute("jam_makul", jam_matakuliah);
                            
                            
            %>
            <td><%=rs2.getString("nama_makul")%></td>
            <td><%=rs2.getString("kodemakul")%></td>
            <td><%=rs2.getString("dosen")%></td>
            <td><%=rs2.getString("sks")%></td>
            <td><%=rs2.getString("hari")%></td>
            
                        <td><%=rs2.getString("jam")%></td>

            <%
                       
                    }
                    ss2.close();
                } catch (Exception ex) {
                    ex.getMessage();
                }%></td>
            <td>
                <a href="ProsesInput"><button><image src="image/add.png" height="12px" width="12px"> Tambah</button></a>
            </td>
        </tr>
    </table>
</div>
<center><h2>Mata Kuliah yang Ditambahkan : </h2></center>

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
                Hari
            </td>
            <td>
                Jam
            </td>
            <td>
                Opsi
            </td>
        </tr>

        <%
                int totalsks = 0;
                int tarif = 165000;
                int totaltarif=0;
            DataBaseConnection con = new DataBaseConnection();
        con.getConnection();
        %> 
            <% DataBaseConnection conn = new DataBaseConnection();
                try {
                    String query = "select  * from pilih_makul a, mahasiswa b where username ="+session.getAttribute("username")+" and a.kd_makul = b.kodemakul" ;
                    Statement statement = conn.getConnection().createStatement();
                    ResultSet result = statement.executeQuery(query); %>
           <%
                        while (result.next()) {
                                            totalsks = totalsks + Integer.parseInt(result.getString("sks"));
                                            totaltarif = tarif*totalsks;
           %>
                <tr>
                    <td><%=result.getString("nama_makul")%></td>
                    <td><%=result.getString("kd_makul")%></td>
                    <td><%=result.getString("dosen")%></td>
                    <td><%=result.getString("sks")%></td>
                    <td><%=result.getString("hari")%></td>
                                <td><%=result.getString("jam")%></td>

                    <td><button><a href="ProsesHapus?kodemakul=<%=result.getString("kd_makul")%>"> Hapus</button></a> </td>

                    
                    
                    
        <%
                }
                statement.close();
            } catch (Exception ex) {
                ex.getMessage();
            }
        %>
        

    </table>
</div>
        <h3>Total sks : <%=totalsks%> Sks</h3>
        <h3>Total TARIF : Rp. <%=totaltarif%> ,00</h3>
<center>
    <table>
        <tr>
            <td></td>
            <td></td>
            <td><a href="cetak.jsp"><button><image src="image/print.png" height="36px" width="36px"><br>Cetak</button></a></td>
            <td></td>
            <td></td>
        </tr>
    </table>
</center>
</body>
</html>
