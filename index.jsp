<%-- 
    Document   : index
    Created on : Jun 7, 2014, 11:32:02 AM
    Author     : KING
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <style>
        body {
            background-color: chocolate;
        }

        button {
            size: A4;
        }

        h2 {
            color: black
        }
    </style>
    <body>
        <form action="loginfilter">
            <marquee behavior="alternate" scrollamount="10"><h2>Selamat Datang di Sistem Informasi Akademik</h2></marquee>
            <center><img src="image/USDLOGO.png" height="400px" width="400px"></center>
            <center><h2>Silakan Login!</h2></center>
            <center>

                <table>
                    <tr>
                        <td>
                            <b>User Name</b>
                        </td>
                        <td>
                            <input type="text" name="username">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Password</b>
                        </td>
                        <td>
                            <input type="password" name="password">
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <input type="reset" value="Reset">
                            <input type="submit" value="Login">
                        </td>
                    </tr>
                </table>
            </center>
        </form>
    </body>
</html>
