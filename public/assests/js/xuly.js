$(document).ready(function(){
	$("#loitendangnhap").hide();
	$("#loimatkhau").hide();
	$("#loihoten").hide();
	$("#loinhaplaimatkhau").hide();
	$("#loinhaplaimatkhausai").hide();
	$("#loimatkhaukhongdu6kitu").hide();
});
function checkEmail(email) {
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (!filter.test(email)) {
        
        return false;
    }
    else
    {
        return true;
    }
}
function valadateFormLogin(){
	if($("#email").val()==""){
			$("#email").focus();
			$("#loitendangnhap").show(500);
			
		}
		else if(checkEmail($("#email").val())==false){
			alert('Địa chỉ Email không hợp lệ.\nVd: Example@gmail.com');
			$("#email").focus();

		}
		else if($("#password").val()==""){
			$("#loitendangnhap").hide(500);
			$("#password").focus();
			$("#loimatkhau").show(500);
			
		}
		else{
			return true;
		}
		return false;
}

function validateFormRegister(){
		var v = grecaptcha.getResponse();
		if($("#email").val()==""){
			$("#email").focus();
			$("#loitendangnhap").show(500);
			
		}
		else if(checkEmail($("#email").val())==false){
			alert('Địa chỉ Email không hợp lệ.\nVd: Example@gmail.com');
			$("#email").focus();
		}
		else if($("#hoten").val()==""){
			$("#loitendangnhap").hide(500);
			$("#hoten").focus();
			$("#loihoten").show(500);
			
		}
		else if($("#password").val()==""){
			$("#loihoten").hide(500);
			$("#password").focus();
			$("#loimatkhau").show(500);

		}
		else if($("#password").val().length <6){
			$("#loimatkhaukhongdu6kitu").show(500);
			$("#loimatkhau").hide();
			$("#password").focus();	
		}
		
		else if($("#passwordagain").val()==""){
			$("#loimatkhaukhongdu6kitu").hide(500);
			$("#loimatkhau").hide(500);
			$("#passwordagain").focus();
			$("#loinhaplaimatkhau").show(500);	
		}
		else if($("#password").val() != $("#passwordagain").val()){
			$("#loinhaplaimatkhau").hide();
			$("#passwordagain").focus();
			$("#loinhaplaimatkhausai").show(500);
		}
		else if(v.length == 0){
			$("#captcha").html("You can't leave Captcha Code empty");
		}
		else{
			$("#captcha").hide();
			$("#loinhaplaimatkhausai").hide(500);
	        return true;
		}
	 
	    return false;
	}


