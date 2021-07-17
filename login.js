let userid,password;
function connectUser(){
    userid=$("#username").val();
    password=$("#password").val();
    if(validateUser())
    {
        let data={
            userid:userid,
            password:password
        };
        let xhr=$.post("LoginControllerServlet",data,processResponse);
        xhr.fail(handleError);
        
    }
    
}
function processResponse(responseText,textStatus,xhr)
{

    if(responseText.trim()==="error")
    {
        swal("Access Denied!","Invalid userid/password","error");
    }
    else if(responseText.trim().indexOf("jsessionid")!==-1)
    {
        swal("Success!","Login Accepted!","success").then((value)=>{
             window.location=responseText.trim();
        });
    }
    else{
        swal("Error!","Some problem occured!","error");
    }
}

function handleError(xhr){
    swal("Error!","Problem in server communication :"+xhr.statusText,"error");
}
function validateUser(){
    if(userid===""|| password==="")
    {
        swal("Error!","Please fill all fields","error");
        return false;
    }
    return true;
}

