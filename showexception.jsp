
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Exception ex=(Exception)request.getAttribute("Exception");
    System.out.println("Exception is ::"+ex);
    out.println("Sonme exception occured :"+ex.getMessage());
%>
