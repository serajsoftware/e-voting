<%-- 
    Document   : response
    Created on : 28 Apr, 2021, 3:52:24 PM
    Author     : Keshri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean result=(boolean)request.getAttribute("result");
    boolean userfound=(boolean)request.getAttribute("userfound");
    if(userfound==true)
        out.println("uap");
    else if(result==true)
        out.println("success");
    else
        out.println("error");
 %>
