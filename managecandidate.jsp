<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script src="jsscript/adminoptions.js"></script>
        <script src="jsscript/jquery.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <!--JQuery,Popper,BootStrap CDN-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!--Bootstrap CSS CDN-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="stylesheet/backgroundimage.css" rel="stylesheet">
        <link href="stylesheet/pageheader.css" rel="stylesheet">
        <link href="stylesheet/admin.css" rel="stylesheet">
        <link href="stylesheet/mydesign.css" rel="stylesheet">
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
                "<div class='subcandidate'>Admin Actions Page</div><br><br>");
             displayBlock.append("<div class='logout'><a href='login.html' class='btn btn-outline-danger'>logout</a></div></div>");
             displayBlock.append("<div class='container'>"+
                "<div class='row'>"+
                "<div class='col-3'>"+
                "<div class='card candidate_card'>"+
                 "<div class='card-body' id='dv1' data-toggle='modal' data-target='#exampleModalCenter' onclick='showaddcandidateform()'>"+
                   "<img src='images/addcandidate.png' alt='admin'><br>"+
                     "<a href=''>Add Candidate </a></div></div></div>"+
                "<div class='col-3'>"+
                "<div class='card candidate_card'>"+
                 "<div class='card-body' id='dv2' data-toggle='modal' data-target='#exampleModalCenter' onclick='showupdatecandidateform()'>"+
                  "<img src='images/update1.jpg' alt='admin'><br>"+
                    "<a href=''>Update Candidate</a></div></div></div>"+
               "<div class='col-3'>"+
               "<div class='card candidate_card'>"+
                "<div class='card-body' id='dv3' data-toggle='modal' data-target='#exampleModalCenter' onclick='showcandidate()'>"+
                  "<img src='images/candidate.jpg' alt='admin'><br>"+
                   "<a href=''>Show Candidate</a></div></div></div>"+
               "<div class='col-3'>"+
               "<div class='card candidate_card'>"+
                "<div class='card-body' id='dv4' data-toggle='modal' data-target='#exampleModalCenter' onclick='deletecandidateform()'>"+
                  "<img src='images/update3.jpg' alt='admin'><br>"+
                   "<a href=''>Remove Candidate</a></div></div></div>"+      
              "</div></div>");
            displayBlock.append("<br><br><div align='center' id='result'></div>");
            out.println(displayBlock);
        %>

    </body>
</html>
