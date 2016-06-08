<%-- 
    Document   : date
    Created on : Jun 1, 2016, 9:30:53 PM
    Author     : astoo
--%>


<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.text.*" %>
<%
    DateFormat date= DateFormat.getDateInstance(DateFormat.FULL);
    String date2 = date.format(new Date());
    %>
    <h4>TODAY : <%=date2%> </h4>
        