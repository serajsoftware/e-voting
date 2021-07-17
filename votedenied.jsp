<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,evoting.dto.CandidateInfo"  %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script src="jsscript/vote.js"></script>
        <script src="jsscript/jquery.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link href="stylesheet/backgroundimage.css" rel="stylesheet">
        <link href="stylesheet/pageheader.css" rel="stylesheet">
        <link href="stylesheet/showcandidate.css" rel="stylesheet">
        <title>Voting Page</title>
    </head>
    <body>
        <%
            String userid=(String)session.getAttribute("userid");
            if(userid==null)
            {
                response.sendRedirect("accessdenied.html");
                return;
            }
             StringBuffer displayBlock=new StringBuffer("");
             displayBlock.append("<div class='sticky'><div class='candidate'>VOTE FOR CHANGE</div><br>"+
                "<div class='subcandidate'>Your Vote is Already Taken</div><br><br>"+
                "<div class='logout'><a href='login.html' class='btn btn-outline-danger'>logout</a></div>"+
                "</div><div class='buttons'></div>");
             CandidateInfo candidate=(CandidateInfo)request.getAttribute("candidate");
             if(candidate!=null)
             {
                
                 displayBlock.append("<br><div class='candidateprofile'><p>Candidate Id: "+candidate.getCandidateId()+"<br>");
                 displayBlock.append("Candidate Name: "+candidate.getCandidateName()+"<br>");
                 displayBlock.append("Party: "+candidate.getParty()+"</p></div>");
                 displayBlock.append("<div><img src='data:image/jpg;base64,"+candidate.getSymbol()+"' style='width:250px;height:200px;/></div>");
             }
             out.println(displayBlock);
        %>
    </body>
</html>
