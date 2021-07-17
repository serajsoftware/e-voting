let adhar,username,password,cpassword,email,mobile,address,city,gender;

function addUser(){
    username=$("#username").val();
    city=$("#city").val();
    password=$("#password").val();
    cpassword=$("#cpassword").val();
    email=$("#email").val();
    mobile=$("#mobile").val();
    adhar=$("#adhar").val();
    address=$("#address").val();
    gender = $("input[type='radio']:checked").val();
    if(validateUser())
    {
        if(password!==cpassword)
        {
            swal("Error!","Password doesn't match!","error");
            return;
        }
        else
        {
            if(checkEmail()===false)
                return;
           if(checkMobile()===false)
                return;
            let data={
                username:username,
                password:password,
                city:city,
                address:address,
                userid:adhar,
                email:email,
                mobile:mobile,
                gender:gender
            };
            let xhr=$.post("RegistrationControllerServlet",data,processResponse);
            xhr.fail(handleError);
        }
    }
}
function processResponse(responseText,textStatus,xhr)
{
    let str=responseText.trim();
    if(str==="success")
    {
        swal("Success!","Registration Successful!! Login Now","success");
        setTimeout(redirectUser,3000);
    }  
    else if(str==="uap")
        swal("Error!","User Is Already Present","error");
    else
        swal("Error!","Registration Failed! Try Again","error");
}
function handleError(xhr)
{
    swal("Error!","Problem in server communication :"+xhr.statusText,"error");
}
function validateUser(){
    if(username===""||city===""||password===""||cpassword===""||email===""||mobile===""||adhar===""||address==="")
    {
        swal("Error!","All Fields should be filled","error");
        return false;
    }
    return true;
}

function checkEmail(){
    let attheratepos=email.indexOf("@");
    let dotpos=email.indexOf(".");
    if(attheratepos <1 || dotpos<attheratepos+2 || dotpos+2>=email.length)
    {
        swal("Error!","Pleaase enter a valid email","error");
        return false;
    }
    return true;
}
function checkMobile(){
    if(isNaN(mobile)||mobile.indexOf(" ")!=-1 || mobile.length>10 ||mobile.length<10)
           {
             swal("Error!","Mobile number is not valid","error");
              return false; 
           }
           return true;
       }
function redirectUser(){
    window.location="login.html";
}