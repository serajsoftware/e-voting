<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,evoting.dto.CandidateInfo"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <!--Bootstrap CSS CDN-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
         <!--JQuery,Popper,BootStrap CDN-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link href="stylesheet/backgroundimage.css" rel="stylesheet">
        <link href="stylesheet/pageheader.css" rel="stylesheet">
        <link href="stylesheet/showcandidate.css" rel="stylesheet">
        <link href="stylesheet/mydesign.css" rel="stylesheet">
         <script src="jsscript/vote.js"></script>
        <script src="jsscript/jquery.js"></script>
        <title>manage candidate</title>
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
                "<div class='subcandidate'>Whom Do You Want To Vote</div><br><br>"+
                "<div class='logout'><a href='login.html' class='btn btn-outline-danger'>logout</a></div>"+
                "</div><div class='buttons'></div>");
             ArrayList<CandidateInfo> candidate=(ArrayList<CandidateInfo>)request.getAttribute("candidateList");
             for(CandidateInfo c:candidate)
             {
                 displayBlock.append("<div class='container'>"
                         +"<div class='card showcandidate_card'>"                         
                         +"<input type='radio' name='flat' id='"+c.getCandidateId()+"' value='"+c.getCandidateId()+"' onclick='addvote()'>"
                         +"<label for='"+c.getCandidateId()+"'><img src='data:image/jpg;base64,"+c.getSymbol()+"'style='width:200px;height:180px;/></label><br>"
                         +"<div class='card-body text-center'><br>Candidate Id:<span>"+c.getCandidateId()+"</span><br>"
                         +"Candidate Name:<span>"+c.getCandidateName()+"</span><br>"
                         +"Party:<span>"+c.getParty()+"</span>"
                         +"</div></div></div>");
             }
              out.println(displayBlock);
             
        %>
    </body>
