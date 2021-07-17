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
        <link href="stylesheet/mydesign.css" rel="stylesheet">
        <title>Admin Options</title>
    </head>

    <body>
        <%
            String userid=(String)session.getAttribute("userid");
            if(userid==null)
                    {
                       response.sendRedirect("accessdenied.html");
                       return;                       
                    }
            StringBuffer displayBlock=new StringBuffer("<div class='sticky'><div class='candidate'>VOTE FOR CHANGE</div>"
            +"<div class='subcandidate'>Admin Actions Page</div>"
            + "<div class='logout'><a href='login.html' class='btn btn-outline-danger'>logout</a></div></div>" );
            displayBlock.append("<div class='container'>"+
                "<div class='row'>"+
                "<div class='col-4'>"+
                "<div class='card admin_card'>"+
                 "<div class='card-body' id='dv1' onclick='manageuser()'>"+
                   "<img src='images/manageuser.jpg' alt='admin'><br>"+
                     "<a href=''>Manage Users </a></div></div></div>"+
                "<div class='col-4'>"+
                "<div class='card admin_card'>"+
                 "<div class='card-body' id='dv2' onclick='managecandidate()'>"+
                  "<img src='images/managecandidate.jpg' alt='admin'><br>"+
                    "<a href=''>Manage Candidate</a></div></div></div>"+
               "<div class='col-4'>"+
               "<div class='card admin_card'>"+
                "<div class='card-body' id='dv3' onclick='redirectshowresult()'>"+
                  "<img src='images/resultgraph.jpg' alt='admin'><br>"+
                   "<a href=''>See Results</a></div></div></div>"+
              "</div></div>");
            displayBlock.append("<div align='center' id='result'></div>");              
            out.println(displayBlock);%>
    </body>

    </html>

