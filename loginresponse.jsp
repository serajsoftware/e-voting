<%-- 
    Document   : loginresponse
    Created on : 7 May, 2021, 11:37:43 PM
    Author     : Keshri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String userid=(String)request.getAttribute("userid");
String result=(String)request.getAttribute("result");
    if(userid!=null && result!=null)
    {
        HttpSession sess=request.getSession();
        sess.setAttribute("userid", userid);
        String url="";
        if(result.equalsIgnoreCase("Admin"))
        {
            url="AdminControllerServlet;jsessionid="+sess.getId();
        }
        else
        {
            url="VotingControllerServlet;jsessionid="+sess.getId();
        }
        out.println(url);
    }
    else
        out.println("error"); 
%>