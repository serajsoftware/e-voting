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
        displayBlock.append("<option value=' ' class='form-control'>Choose Candidate Id:</option>");
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
      displayBlock.append("<form method='POST' enctype='multipart/form-data' id='fileUploadForm'>");
      displayBlock.append("<table><tr><th class='labelText'>User Id:</th><td><input type='text' id='uid' class='form-control' value='"+cd.getUserId()+"' disabled></td></tr>");
      displayBlock.append("<tr><th class='labelText'>Candidate Name:</th><td><input type='text' id='cname' class='form-control' value='"+cd.getCanididateName()+"' disabled></td></tr>");
      displayBlock.append("<tr><th class='labelText'>City:</th><td><input type='text' id='city' class='form-control' value='"+cd.getCity()+"'></td></tr>");
      displayBlock.append("<tr><th class='labelText'>Party:</th><td><input type='text' id='party' class='form-control' value='"+cd.getParty()+"'></td></tr>");
      displayBlock.append("<tr><th class='labelText'>Symbol:</th><td>"+str+"</td></tr>");
      displayBlock.append("<td colspan='2'><input type='file' class='form-control-file mt-2 ml-4 name='files' id='symbol' value=''><td>");
      displayBlock.append("<tr><th><input type='button' class='btn btn-success mt-2 ml-4' value='Save Changes' onclick='updatecandidate()' id='updcnd' class='btn btn-outline-primary mt-2'></th>");
      displayBlock.append("<th><input type='reset' class='btn btn-secondary mt-2 mr-4' value='Clear' onclick='clearText()' class='btn btn-outline-secondary mt-2'></th></tr></table></form>");
      json.put("subdetails",displayBlock.toString());
      out.println(json);

    }
%>
