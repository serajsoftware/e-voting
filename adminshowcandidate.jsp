
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.json.JSONObject"%>
<%@page import="evoting.dto.CandidateDetails" %>
<%@page import="java.util.ArrayList" %>
<%
    String userid=(String)session.getAttribute("userid");
    if(userid==null)
    {
        session.invalidate();
        response.sendRedirect("accessdenied.html");
        return;
    }
    String result=(String)request.getAttribute("result");
    JSONObject json=new JSONObject();
    StringBuffer displayBlock=new StringBuffer();
    if(result!=null && result.equalsIgnoreCase("candidatelist"))
    {
        ArrayList<String> candidateList=(ArrayList<String>)request.getAttribute("candidateid");
        displayBlock.append("<option value=' '>Choose Candidate Id:</option>");
        for(String id:candidateList)
        {
            displayBlock.append("<option value='"+id+"'>"+id+"</option>");
        }
        json.put("cid",displayBlock.toString());
        out.println(json);
        System.out.println(displayBlock.toString());
    }
    else if(result!=null && result.equals("details"))
    {
        CandidateDetails cd=(CandidateDetails)request.getAttribute("candidate");
        String str="<img src='data:image/jpg;base64,"+cd.getSymbol()+"'style='width:250px;height:200px;'/>";
        displayBlock.append("<table class='table table-hover table-borderless'><tr><th class='labelText'>Candidate Name :</th><td class='labelText'>"+cd.getCanididateName()+"</td></tr>");
        displayBlock.append("<tr><th class='labelText'>User Id :</th><td class='labelText'>"+cd.getUserId()+"</td></tr>");
        displayBlock.append("<tr><th class='labelText'>Party :</th><td class='labelText'>"+cd.getParty()+"</td></tr>");
        displayBlock.append("<tr><th class='labelText'>City :</th><td class='labelText'>"+cd.getCity()+"</td></tr>");
        displayBlock.append("<tr><th class='labelText'>Symbol:</th><td>"+str+"</td></tr></table>");  
        json.put("subdetails",displayBlock.toString());
        out.println(json);
    }
    else
        out.println("error");
    
    
%>