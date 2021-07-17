
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="evoting.dto.CandidateInfo" %>
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
        <title>Voting Details</title>
    </head>
    <body>
        <%
            String userid=(String)session.getAttribute("userid");
            if(userid==null)
            {
                response.sendRedirect("accessdenied.html");
                return;
            }
            CandidateInfo candidate=(CandidateInfo)session.getAttribute("candidate");
            StringBuffer displayBlock=new StringBuffer();
            displayBlock.append("<div class='sticky'><div class='candidate'>VOTE FOR CHANGE</div><br>");
            displayBlock.append("<div class='logout'><a href='login.html' class='btn btn-outline-danger'>logout</a></div>");
            
             if(candidate==null)
            {
                displayBlock.append("<div class='subcandidate'>Sorry! Your vote could not be casted </div><br><br>");
                displayBlock.append("<div class='logout'><h4 id='logout><a href='LoginControllerServlet?logout=logout'>logout</a></h4></div>");
                out.println(displayBlock);
            }
            else
            {
                String symbol="<img src='data:image/jpg;base64,"+candidate.getSymbol()+"'style='width:275px;height:190px;'/>";
                displayBlock.append("<div class='subcandidate'> Thank you for voting</div></div><br><br>");
                displayBlock.append("<div class='container mt-4'><h5>Your Vote is Added </h5>"
                        + "<div class='card showcandidate_card mt-4'>"+symbol+
                                    "<div class='card-body'><br>Candidate Id:<span>"+candidate.getCandidateId()+"</span><br>"+
                                    "Candidate Name:<span>"+candidate.getCandidateName()+"</span><br>"+
                                    "Candidate Party: <span>"+candidate.getParty()+"</span><br>"+
                                     "</div></div></div>");
                out.println(displayBlock);
            }
        %>
    </body>
</html>