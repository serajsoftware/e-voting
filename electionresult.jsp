<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.LinkedHashMap,java.util.Iterator,java.util.Map,evoting.dto.CandidateDetails"  %>
<%
    String userid=(String)session.getAttribute("userid");
    if(userid==null)
    {
        response.sendRedirect("accessdenied.html");
        return;
    }
     LinkedHashMap<CandidateDetails,Integer> candidate=(LinkedHashMap)request.getAttribute("result");
     int votecount=(int)request.getAttribute("votecount");
     Iterator it=candidate.entrySet().iterator();
     StringBuffer displayBlock=new StringBuffer("<table class='table table-hover table-borderless bg-danger text-center'>");
     displayBlock.append("<tr class='bg-dark'><th>Candidate Id</th><th>Candidate Name</th><th>Party</th><th>Symbol</th><th>City</th><th>Vote Count</th><th>Vote %</th></tr>");
    while(it.hasNext())
    {
        Map.Entry<CandidateDetails,Integer> e=(Map.Entry)it.next();
        CandidateDetails cd=e.getKey();
        float voteper=(e.getValue()*100.0f)/votecount;
        displayBlock.append("<tr><td>"+cd.getCandidateId()+"</td><td>"+cd.getCanididateName()+"</td><td>"+cd.getParty()+"</td><td><img src='data:image/jpg;base64,"+cd.getSymbol()+"'style='width:100px;height:100px;'/></td><td>"+cd.getCity()+"</td><td>"+e.getValue()+"</td><td>"+voteper+"</td></tr>");    
    }
    displayBlock.append("</table>");
    out.println(displayBlock);   
%>