<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="jsscript/adminoptions.js"></script>
        <script type="text/javascript" src="jsscript/jquery.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
         <!--Bootstrap CSS CDN-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="stylesheet/backgroundimage.css" rel="stylesheet">
        <link href="stylesheet/pageheader.css" rel="stylesheet">
        <link href="stylesheet/admin.css" rel="stylesheet">
        <link href="stylesheet/result.css" rel="stylesheet">
        <link href="stylesheet/mydesign.css" rel="stylesheet">
        <title>show result</title>
    </head>

    <body>
        <%
            String userid=(String)session.getAttribute("userid");
            if(userid==null)
                    {
                       response.sendRedirect("accessdenied.html");
                       return;                       
                    }
            StringBuffer displayBlock=new StringBuffer("<div class='sticky'><div class='candidate'>VOTE FOR CHANGE</div><br>"
            +"<div class='subcandidate'>Admin Options Page</div>"
            + "<div class='logout'><a href='login.html' class='btn btn-outline-danger'>logout</a></div></div>" );
            displayBlock.append("<div class='container'>"+
                "<div class='row'>"+
                "<div class='col-4'>"+
                "<div class='card admin_card'>"+
                "<div class='card-body' id='dv1' onclick='partyresult()'>"+
                 "<img src='images/partywin.jpg' alt='admin'><br>"+
                 "<a href=''>Winner By Party </a></div></div></div>"+
                "<div class='col-4'>"+ 
                "<div class='card admin_card'>"+   
                "<div class='card-body' id='dv2' onclick='electionresult()'>"+   
                "<img src='images/votingimage.jpg' alt='admin'><br>"+
                "<a href=''>Winner By Candidate </a></div></div></div>"+
                "<div class='col-4'>"+
                "<div class='card admin_card'>"+   
                "<div class='card-body' id='dv3' onclick='gendervotes()'>"+   
                "<img src='images/gvote.jpg' alt='admin' class=''><br>"+
                "<a href=''>Gender Votes %</a></div></div></div>"+
                "</div></div>");          
            displayBlock.append("<div align='center' id='result'></div>");            
            out.println(displayBlock);%>
    </body>
    </html>