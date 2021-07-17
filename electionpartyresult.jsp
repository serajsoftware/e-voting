<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.LinkedHashMap,java.util.Iterator,java.util.Map,evoting.dto.Candidatepojo"  %>
<%
    String userid=(String)session.getAttribute("userid");
    if(userid==null)
    {
        response.sendRedirect("accessdenied.html");
        return;
    }
     LinkedHashMap<Candidatepojo,Integer> candidate=(LinkedHashMap)request.getAttribute("result");
     int votecount=(int)request.getAttribute("votecount");
     Iterator it=candidate.entrySet().iterator();
     StringBuffer displayBlock=new StringBuffer("<table class='table table-hover table-borderless bg-danger text-center'>");
     displayBlock.append("<tr class='bg-dark'> <th>Party</th>  <th>Symbol</th>  <th>Voting Percentage</th></tr>");
    while(it.hasNext())
    {
        Map.Entry<Candidatepojo,Integer> e=(Map.Entry)it.next();
        Candidatepojo cp=e.getKey();
        float voteper=(e.getValue()*100.0f)/votecount;
        displayBlock.append("<tr><td>"+cp.getParty()+"</td><td><img src='data:image/jpg;base64,"+cp.getSymbol()+"'style='width:100px;height:100px;'/></td><td>"+voteper+"</td></tr>");    
    }
    displayBlock.append("</table>");
    out.println(displayBlock);   
%>