function addvote()
{
    var cid=$('input[type=radio][name=flat]:checked').attr('id');
    var data={candidateid:cid};
    $.post("AddVoteControllerServlet",data,processresponse);
}
function processresponse(responseText)
{
    if(responseText.trim()==="success")
    {
        swal("Success","Voting Done !","success").then((value)=>{
           window.location="votingresponse.jsp"; 
        });
    }
    else
    {
         swal("Failed","Voting Failed !","error").then((value)=>{
           window.location="votingresponse.jsp"; 
        });
    }
}

