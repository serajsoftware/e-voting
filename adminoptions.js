function redirectadministratorpage()
{
    swal("Admin!","Redirecting To Admin Actions Page!","success").then(value=>{
        window.location="adminactions.jsp";
    });
}
function redirectvotingpage()
{
    swal("Admin!","Redirecting To Voting Controller Page!","success").then(value=>{
        window.location="VotingControllerServlet";
    });
}
function redirectshowresult()
{
    swal("Admin!","Redirecting Result Section","success").then(value=>{
        window.location="showresultoptions.jsp";
    });
}
function manageuser()
{
    swal("Admin!","Redirecting To User Management Page!","success").then(value=>{
        window.location="manageuser.jsp";
    });
}
function managecandidate()
{
    swal("Admin!","Redirecting To Candidate Management Page!","success").then(value=>{
        window.location="managecandidate.jsp";
    });
}
function electionresult()
{
    $.post("ElectionResultControllerServlet",null,function (responseText){
       $("#result").html(responseText.trim());
    });
}
function partyresult()
{
    $.post("PartyResultControllerServlet",null,function (responseText){
       $("#result").html(responseText.trim());
    });
}
function gendervotes()
{
    $.post("GetGenderVotesControllerServlet",null,function (responseText){
    $("#result").html(responseText.trim());
    }); 
}
function showaddcandidateform()
{
removecandidateForm();
var newdiv=document.createElement("div");
newdiv.setAttribute("id","candidateform");
newdiv.setAttribute("float","left");
newdiv.setAttribute("padding-left","12px");
newdiv.setAttribute("border","solid 2px red");
newdiv.innerHTML=newdiv.innerHTML+"<div class='modal fade' id='exampleModalCenter' tabindex='-1' role='dialog' aria-labelledby='exampleModalCenterTitle' aria-hidden='true'>\n\
<div class='modal-dialog modal-dialog-centered' role='document'>\n\
<div class='modal-content'>\n\
<div class='modal-header'>\n\
<h5 class='modal-title labelheader' id='exampleModalLongTitle'>Add New Candidate</h5>\n\
<button type='button' class='close' data-dismiss='modal' aria-label='Close'>\n\
<span aria-hidden='true'>&times;</span></button></div>\n\
<div class='modal-body text-center'>\n\
<form method='POST' enctype='multipart/form-data' id='fileUploadForm'>\n\
<table><tr><th class='labelText'>Candidate Id:</th><td><input type='text' id='cid' class='form-control'></td></tr>\n\
<tr><th class='labelText'>User Id:</th><td><select class='form-control mt-2' id='uid'><option selected>Choose User Id</option></select></td></tr>\n\
<tr><th class='labelText'>Candidate Name:</th><td><input type='text' id='cname' class='form-control mt-2'></td></tr>\n\
<tr><th class='labelText'>City:</th><td><select class='form-control mt-2' id='city'><option selected>Choose city</option></select></td></tr>\n\
<tr><th class='labelText'>Party:</th><td><input type='text' id='party' class='form-control mt-2'></td></tr>\n\
<tr><td colspan='2'><input type='file' name='files' class='form-control-file mt-2 ml-4' value='Select Image'></td></tr>\n\
<tr><th><input type='button' value='Add Candidate' class='btn btn-outline-success mt-2 ml-4' onclick='addcandidate()' id='addcnd'></th>\n\
<th><input type='reset' value='Clear' class='btn btn-outline-secondary mt-2' onclick='clearText()'></th></tr>\n\
</table></form></div></div></div></div>";
newdiv.innerHTML=newdiv.innerHTML+"<br><span id='addresp'></span>";
var addcand=$("#result")[0];
addcand.appendChild(newdiv);
$("#candidateform").hide();
$("#candidateform").fadeIn("3500");
data={id:"getid"};   
 $.post("AddCandidateControllerServlet",data,function(responseText){
     let details=JSON.parse(responseText);
     let cid=details.cid;
     let adhar_no=details.adhar;
     $("#cid").val(cid);
     $('#cid').prop("disabled",true);
     $("#uid").append(adhar_no)});
$("#uid").change(function(){
     data={uid:$("#uid").val()};
        $.post("AddCandidateControllerServlet",data,function(responseText){
           let details=JSON.parse(responseText);
           let city=details.city;
           let uname=details.username;
           if(uname==="wrong")
               swal("Wrong Adhaar No","Adhaar No not present","error");
           else
           {
               $("#cname").val(uname);
               $("#city").empty();
               $("#city").append(city);
               $("#cname").prop("disabled",true);
           }
        } );
 });
}

//function getdetails(e){
//    if(e.keyCode===13)
//    {
//        data={uid:$("#uid").val()};
//        $.post("AddCandidateControllerServlet",data,function(responseText){
//           let details=JSON.parse(responseText);
//           let city=details.city;
//           let uname=details.username;
//           if(uname==="wrong")
//               swal("Wrong Adhaar No","Adhaar No not present","error");
//           else
//           {
//               $("#cname").val(uname);
//               $("#city").empty();
//               $("#city").append(city);
//               $("#cname").prop("disabled",true);
//           }
//        } );
//    }
//}

function removecandidateForm()
{
    var contdiv=document.getElementById("reult");
    var formdiv=document.getElementById("candidateform");
    if(formdiv!==null)
    {
        $("#candidateform").fadeOut(3500);
        contdiv.removeChild(formdiv);
    }
}
function addcandidate()
{
    var form=$("#fileUploadForm")[0];
    var data=new FormData(form);
    var cid=$("#cid").val();
    var cname=$("#cname").val()
    var city=$("#city").val();
    var party=$("#party").val();
    var uid=$("#uid").val();
    data.append("cid",cid);
    data.append("uid",uid);
    data.append("cname",cname);
    data.append("party",party);
    data.append("city",city);
    $.ajax({
        type:"POST",
        enctype:'multipart/form-data',
        url:"AddNewCandidateControllerServlet",
        data:data,
        processData:false,
        contentType:false,
        cache:false,
        timeout:600000,
        success:function (data){
          if(data.trim()==="error")
          {
              swal("Admin","Candidate Already Present from this city","error");
              return;
          }
          else
          {
            str=data+"....";
            swal("Admin!",str,"success").then((value)=>{
                showaddcandidateform();
            });
          }
        },
        error:function(e){
           
           swal("Admin!","Registration failed","error");
        }
    });
}
function clearText()
{
    $("#addresp").html("");
}
function showcandidate()
{
    removecandidateForm();
    var newdiv=document.createElement("div");
    newdiv.setAttribute("id","candidateform");
    newdiv.setAttribute("float","left");
    newdiv.setAttribute("padding-left","12px");
    newdiv.setAttribute("border","solid 2px red");
    newdiv.innerHTML=newdiv.innerHTML+"<div class='modal fade' id='exampleModalCenter' tabindex='-1' role='dialog' aria-labelledby='exampleModalCenterTitle' aria-hidden='true'>\n\
    <div class='modal-dialog modal-dialog-centered' role='document'>\n\
    <div class='modal-content'>\n\
    <div class='modal-header'>\n\
    <h5 class='modal-title labelheader' id='exampleModalLongTitle'>Show Candidate</h5>\n\
    <button type='button' class='close' data-dismiss='modal' aria-label='Close'>\n\
    <span aria-hidden='true'>&times;</span></button></div>\n\
    <div class='modal-body text-center'>\n\
    <div style='color:white;font-weight:bold'>Candidate Id:</div><div><select id='cid'></select>\n\
    <br><span id='addresp'></span>\n\
    </div></div></div></div>";
    var addcand=$("#result")[0];
    addcand.appendChild(newdiv);
    $("#candidateform").hide();
    $("#candidateform").fadeIn("3500");   
    data={data:"cid"};
    $.post("ShowCandidateControllerServlet",data,function (responseText){
        var candidlist=JSON.parse(responseText);
        $("#cid").append(candidlist.cid);
  
    });
    $("#cid").change(function(){
       var cid=$("#cid").val();
       if(cid==='')
       {
           swal("No Choosen!","Please select an id","error");
           return;
       }
        data={data:cid};
        $.post("ShowCandidateControllerServlet",data,function (responseText){
            clearText();
            var details=JSON.parse(responseText);
            $("#addresp").append(details.subdetails);
  
        });
    });
}
function showupdatecandidateform()
{
    removecandidateForm();
    var newdiv=document.createElement("div");
    newdiv.setAttribute("id","candidateform");
    newdiv.setAttribute("float","left");
    newdiv.setAttribute("padding-left","12px");
    newdiv.setAttribute("border","solid 2px red");
    newdiv.innerHTML=newdiv.innerHTML+"<div class='modal fade' id='exampleModalCenter' tabindex='-1' role='dialog' aria-labelledby='exampleModalCenterTitle' aria-hidden='true'>\n\
    <div class='modal-dialog modal-dialog-centered' role='document'>\n\
    <div class='modal-content'>\n\
    <div class='modal-header'>\n\
    <h5 class='modal-title labelheader' id='exampleModalLongTitle'>Update Candidate</h5>\n\
    <button type='button' class='close' data-dismiss='modal' aria-label='Close'>\n\
    <span aria-hidden='true'>&times;</span></button></div>\n\
    <div class='modal-body text-center'>\n\
    <div style='color:white;font-weight:bold'>Candidate Id:</div><div><select id='cid'></select>\n\
    <br><span id='addresp'></span>\n\
    </div></div></div></div>";
    var addcand=$("#result")[0];
    addcand.appendChild(newdiv);
    $("#candidateform").hide();
    $("#candidateform").fadeIn("3500");   
    data={data:"cid"};
    $.post("UpdateCandidateControllerServlet",data,function (responseText){
        var candidlist=JSON.parse(responseText);
        $("#cid").append(candidlist.cid);
  
    });
    $("#cid").change(function(){
      var cid=$("#cid").val();
       if(cid==='')
       {
           swal("No Choosen!","Please select an id","error");
           return;
       }
       data={data:cid};
        $.post("UpdateCandidateControllerServlet",data,function (responseText){
            clearText();
            var details=JSON.parse(responseText);
            $("#addresp").append(details.subdetails);
  
        });
    
    });
}
function updatecandidate()
{
    var form=$("#fileUploadForm")[0];
    var data=new FormData(form);
    var cid=$("#cid").val();
    var city=$("#city").val();
    var party=$("#party").val();
    data.append("cid",cid);
    data.append("party",party);
    data.append("city",city);
    $.ajax({
        type:"POST",
        enctype:'multipart/form-data',
        url:"UpdateNewCandidateControllerServlet",
        data:data,
        processData:false,
        contentType:false,
        cache:false,
        timeout:600000,
        success:function (data){
          str=data+".....";
          swal("Admin!",str,"success").then((value)=>{
              showupdatecandidateform();
          });
        },
        error:function(e){
           swal("Admin!",e,"error");
        }
    });   
}
function deletecandidateform()
{
    removecandidateForm();
    var newdiv=document.createElement("div");
    newdiv.setAttribute("id","candidateform");
    newdiv.setAttribute("float","left");
    newdiv.setAttribute("padding-left","12px");
    newdiv.setAttribute("border","solid 2px red");
    newdiv.innerHTML=newdiv.innerHTML+"<div class='modal fade' id='exampleModalCenter' tabindex='-1' role='dialog' aria-labelledby='exampleModalCenterTitle' aria-hidden='true'>\n\
    <div class='modal-dialog modal-dialog-centered' role='document'>\n\
    <div class='modal-content'>\n\
    <div class='modal-header'>\n\
    <h5 class='modal-title labelheader' id='exampleModalLongTitle'>Remove Candidate</h5>\n\
    <button type='button' class='close' data-dismiss='modal' aria-label='Close'>\n\
    <span aria-hidden='true'>&times;</span></button></div>\n\
    <div class='modal-body text-center'>\n\
    <div style='color:white;font-weight:bold'>Candidate Id:</div><div><select id='cid'></select>\n\
    <br><span id='addresp'></span>\n\
    </div></div></div></div>";
    var addcand=$("#result")[0];
    addcand.appendChild(newdiv);
    $("#candidateform").hide();
    $("#candidateform").fadeIn("3500");   
    data={data:"cid"};
    $.post("RemoveCandidateControllerServlet",data,function (responseText){
        var candidlist=JSON.parse(responseText);
        $("#cid").append(candidlist.cid);
  
    });
    $("#cid").change(function(){
       var cid=$("#cid").val();
       if(cid==='')
       {
           swal("No Choosen!","Please select an id","error");
           return;
       }
        data={data:cid};
        $.post("RemoveCandidateControllerServlet",data,function (responseText){
            clearText();
            var details=JSON.parse(responseText);
            $("#addresp").append(details.subdetails);
  
        });
    });
}
function removecandidate()
{
    var form=$("#fileUploadForm")[0];
    var data=new FormData(form);
    var cid=$("#cid").val();
    var city=$("#city").val();
    var party=$("#party").val();
    var uid=$("#uid").val();
    data.append("cid",cid);
    data.append("uid",uid);
    data.append("party",party);
    data.append("city",city);
    $.ajax({
        type:"POST",
        enctype:'multipart/form-data',
        url:"RemovedCandidateServlet",
        data:data,
        processData:false,
        contentType:false,
        cache:false,
        timeout:600000,
        success:function (data){
          str=data+".....";
          swal("Admin!",str,"success").then((value)=>{
              deletecandidateform();
          });
        },
        error:function(e){
           swal("Admin!",e,"error");
        }
    });
}