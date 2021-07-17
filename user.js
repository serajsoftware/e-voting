function showusers()
{
   $.post("ShowUsersControllerServlet",null,function (responseText){
      $("#result").html(responseText.trim()); 
   });  
}
function removeForm()
{
    var contdiv=document.getElementById("result");
    var formdiv=document.getElementById("userform");
    if(formdiv!==null)
    {
        $("#userform").fadeOut(3500);
        contdiv.removeChild(formdiv);
    }
}
function deleteuserform()
{
    removeForm();
    var newdiv=document.createElement("div");
    newdiv.setAttribute("id","userform");
    newdiv.setAttribute("float","left");
    newdiv.setAttribute("padding-left","12px");
    newdiv.setAttribute("border","solid 2px red");
    newdiv.innerHTML=newdiv.innerHTML+"<div class='modal fade' id='exampleModalCenter' tabindex='-1' role='dialog' aria-labelledby='exampleModalCenterTitle' aria-hidden='true'>\n\
    <div class='modal-dialog modal-dialog-centered' role='document'>\n\
    <div class='modal-content'>\n\
    <div class='modal-header'>\n\
    <h4 class='modal-title font-weight-bolder text-danger' id='exampleModalLongTitle'>Remove User</h4>\n\
    <button type='button' class='close' data-dismiss='modal' aria-label='Close'>\n\
    <span aria-hidden='true'>&times;</span></button></div>\n\
    <div class='modal-body text-center'>\n\
    <label>Adhar No:</label><select id='uid' class='form-control' style='width:230px; margin-left:180px;'></select>\n\
    <br><span id='addresp'></span>\n\
    </div></div></div></div>";
    var addcand=$("#result")[0];
    addcand.appendChild(newdiv);
    $("#userform").hide();
    $("#userform").fadeIn("3500");   
    data={data:"uid"};
    $.post("GetUserInfoControllerServlet",data,function (responseText){
        var userlist=JSON.parse(responseText);
        $("#uid").append(userlist.uid);
  
    });
    $("#uid").change(function(){
       var uid=$("#uid").val();
       if(uid==='')
       {
           swal("No Choosen!","Please select an id","error");
           return;
       }
        data={data:uid};
        $.post("GetUserInfoControllerServlet",data,function (responseText){
            clearText();
            var details=JSON.parse(responseText);
            $("#addresp").append(details.subdetails);
  
        });
    });
}
function removeuser()
{

    var uid=$("#uid").val();
    var uname=$("#uname").val();
    var pass=$("#pass").val();
    var gender=$("#gender").val();
    var email=$("#email").val();
    var mobile=$("#mobile").val();
    var address=$("#address").val();
    var city=$("#city").val();
    var utype=$("#utype").val();
    var data={
                adhar:uid,
                password:pass,
                username:uname,
                gender:gender,
                email:email,
                mobile:mobile,
                address:address,
                city:city,
                utype:utype
            };
    $.post("DeleteUserControllerServlet",data,function (responseText){
        if(responseText.trim()==="success")
        {
            swal("User Deleted","Successfully","success");
            deleteuserform();
        }
        else
        {
            swal("User Can Not Deleted","Failed to delete","error");
        }
    });
}