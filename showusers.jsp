<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,evoting.dto.UserInfo"%>
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
        
         <script src="jsscript/user.js"></script>
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
             ArrayList<UserInfo> userList=(ArrayList)request.getAttribute("userlist");
             displayBlock.append("<div class='float-center mb-4'><table class='table table-hover table-striped table-borderless bg-info'>");
             displayBlock.append("<tr class='bg-dark'><th>Adhar No</th> <th>Username</th> <th>Gender</th> <th>Email Id</th> <th>Mobile No</th> <th>Address</th> <th>City</th> </tr>");
             for(UserInfo user:userList)
             {
                 displayBlock.append("<tr class='bg-danger'><td> "+user.getAdharNo()+"</td> <td> "+user.getUserName()+"</td><td> "+user.getGender()+"</td><td> "+user.getEmailId()+"</td><td> "+user.getMobileNo()+"</td><td> "+user.getAddress()+"</td><td> "+user.getCity()+"</td></tr>");
             }
             displayBlock.append("</table></div>");
              out.println(displayBlock);      
        %>
    </body>
</html>
