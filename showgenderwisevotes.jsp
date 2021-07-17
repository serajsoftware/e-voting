<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.LinkedHashMap,java.util.Iterator,java.util.Map"  %>
<%
    String userid=(String)session.getAttribute("userid");
    if(userid==null)
    {
        response.sendRedirect("accessdenied.html");
        return;
    }
     LinkedHashMap<String,Integer> result=(LinkedHashMap)request.getAttribute("result");
     int votecount=(int)request.getAttribute("votecount");
     Iterator it=result.entrySet().iterator();
     StringBuffer displayBlock=new StringBuffer("<table class='table table-hover table-borderless bg-danger text-center'>");
     displayBlock.append("<tr class='bg-dark'><th>Gender </th><th> Votes </th><th> Vote% </th></tr>");
    while(it.hasNext())
    {
        Map.Entry<String,Integer> e=(Map.Entry)it.next();
        String gender=e.getKey();
        float voteper=(e.getValue()*100.0f)/votecount;
        displayBlock.append("<tr><td>"+gender+"</td><td>"+e.getValue()+"</td><td>"+voteper+"</td></tr>");    
    }
    displayBlock.append("</table>");
    out.println(displayBlock);   
%>