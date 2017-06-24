$(document).ready(function(){
	$("#loitendangnhap").hide();
	$("#loimatkhau").hide();
	$("#loihoten").hide();
	$("#loinhaplaimatkhau").hide();
	$("#loinhaplaimatkhausai").hide();
	$("#loimatkhaukhongdu6kitu").hide();
	$("#btnSearch").click(function(){
		if($("#keySearch").val()==""){
			alert("Bạn chưa nhập tên sản phẩm cần tìm");
			$("#keySearch").focus();
		}
		else{
			alert("Tìm thành công");
			$("#keySearch").val('');
		}
	});
	$("#bntdangnhap").click(function(){
		if($("#email").val()==""){
			$("#email").focus();
			$("#loitendangnhap").show(500);
			
		}
		else if($("#password").val()==""){
			$("#password").focus();
			$("#loimatkhau").show(500);
			
		}
		else{
			alert("Đăng nhập thành công");
			window.location.href = '../anhdung/index.html';
		}
	});
	$("#bntdangky").click(function(){
		window.location.href = 'register.html';
	});
		$("#bntregister").click(function(){
		if($("#email").val()==""){
			$("#email").focus();
			$("#loitendangnhap").show(500);
			
		}
		else if($("#hoten").val()==""){
			$("#hoten").focus();
			$("#loihoten").show(500);
			
		}
		else if($("#password").val()==""){
			$("#password").focus();
			$("#loimatkhau").show(500);

		}
		else if($("#password").val().length <6){
			$("#loimatkhaukhongdu6kitu").show(500);
			$("#loimatkhau").hide();
			$("#password").focus();	
		}
		
		else if($("#passwordagain").val()==""){
			$("#passwordagain").focus();
			$("#loinhaplaimatkhau").show(500);	
		}
		else if($("#password").val() != $("#passwordagain").val()){
			$("#loinhaplaimatkhau").hide();
			$("#passwordagain").focus();
			$("#loinhaplaimatkhausai").show(500);
		}
		else{
			alert("Đăng ký thành công");
			window.location.href = '../anhdung/index.html';
		}
	});

});
