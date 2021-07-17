<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.json.JSONObject"%>
<%@page import="evoting.dto.UserInfo" %>
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
    if(result!=null && result.equalsIgnoreCase("userlist"))
    {
        ArrayList<String> userList=(ArrayList)request.getAttribute("adharid");
        displayBlock.append("<option value=' '>Choose Adhar No:</option>");
        for(String id:userList)
        {
            displayBlock.append("<option value='"+id+"'>"+id+"</option>");
        }
        json.put("uid",displayBlock.toString());
        out.println(json);
        System.out.println(displayBlock.toString());
    }
    else if(result!=null && result.equals("details"))
    {
      UserInfo user=(UserInfo)request.getAttribute("users");
      displayBlock.append("<form method='POST' id='fileUploadForm'>");
      displayBlock.append("<tr><td><input type='hidden' id='pass' value='"+user.getPassword()+"' disabled></td></tr>");
      displayBlock.append("<table><tr><th class='labelText'>Username:</th><td><input type='text' id='uname' class='form-control mt-2' value='"+user.getUserName()+"' disabled></td></tr>");
      displayBlock.append("<tr><th class='labelText'>Gender:</th><td><input type='text' id='gender' class='form-control' value='"+user.getGender()+"' disabled></td></tr>");
      displayBlock.append("<tr><th class='labelText'>Email Id:</th><td><input type='text' id='email' class='form-control' value='"+user.getEmailId()+"' disabled></td></tr>");
      displayBlock.append("<tr><th class='labelText'>Mobile No:</th><td><input type='text' id='mobile' class='form-control' value='"+user.getMobileNo()+"' disabled></td></tr>");
      displayBlock.append("<tr><th class='labelText'>Address:</th><td><input type='text' id='address' class='form-control' value='"+user.getAddress()+"' disabled></td></tr>");
      displayBlock.append("<tr><th class='labelText'>City:</th><td><input type='text' id='city' class='form-control' value='"+user.getCity()+"' disabled></td></tr>");
      displayBlock.append("<tr><td><input type='hidden' id='utype' value='"+user.getUserType()+"' disabled></td></tr>");
      displayBlock.append("<tr><th><input type='button' class='btn btn-danger mt-2 ml-4' value='Remove User' onclick='removeuser()' id='remuser'></th>");
      displayBlock.append("<th><input type='reset' class='btn btn-secondary mt-2 mr-4' value='Clear' onclick='clearText()'></th></tr></table></form>");
      json.put("subdetails",displayBlock.toString());
      out.println(json);
    }
%>
