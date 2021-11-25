function job(job){
	if(job=="join"){
		document.getElementById('join').style="display:block";
		document.getElementById('login').style.display="none";
		document.getElementById('checkMessage').style.display="none";
		document.getElementById('pwFind').style.display="none";
	}else if(job=='login'){
		document.getElementById('join').style="display:none";
		document.getElementById('login').style.display="block";
		document.getElementById('checkMessage').style.display="none";
		document.getElementById('pwFind').style.display="none";
	}else if(job == 'pwFind'){
		document.getElementById('join').style="display:none";
		document.getElementById('login').style.display="none";
		document.getElementById('checkMessage').style.display="none";
		document.getElementById('pwFind').style.display="block";
	}else{
		document.getElementById('join').style="display:none";
		document.getElementById('login').style.display="none";
		document.getElementById('checkMessage').style.display="block";
		document.getElementById('pwFind').style.display="none";
	}
}
function idCheck(){
	var id=document.getElementById('id').value
	fetch('idCheck?id='+id,{
		method:'get'
	}).then(response=>{
		if(response.status==200){
			response.text().then(text=>{
				if(text==1){
					document.getElementById('idCheck').innerHTML='<br/>이미 사용중인 아이디입니다.';
					document.getElementById('idCheck2').value=1;
				}else if(text==0){
					document.getElementById('idCheck').innerHTML='<br/>사용 가능한 아이디입니다.';
					document.getElementById('idCheck2').value=0;
				}
			});
		}
	});
}
function idCheck2(){
	document.getElementById('idCheck2').value=2;
}


function passwordPattenCheck(){ 
	var patten= new RegExp('^(?=.*[!@#$%^&])(?=.*[0-9])(?=.*[A-Za-z])[!@#$%^&0-9A-Za-z]{10,15}$');
	if(patten.test(document.getElementsByName('password')[1].value)){
		document.getElementById('password1').innerHTML='';
		return true;
	}else{
		document.getElementById('password1').innerHTML='<br/>특수문자, 영문자, 숫자를 조합한 10~15자의 패스워드를 입력해주세요';
		return false;
	}
}

function passwordPattenCheck2(){ 
	var patten= new RegExp('^(?=.*[!@#$%^&])(?=.*[0-9])(?=.*[A-Za-z])[!@#$%^&0-9A-Za-z]{10,15}$');
	if(patten.test(document.getElementsByName('newPW')[0].value)){
		document.getElementById('password3').innerHTML='';
		return true;
	}else{
		document.getElementById('password3').innerHTML='<br/>특수문자, 영문자, 숫자를 조합한 10~15자의 패스워드를 입력해주세요';
		return false;
	}
}

function passwordCheck(){
	if(document.getElementsByName('password')[1].value!=document.getElementsByName('password2')[0].value&&passwordPattenCheck()){
		document.getElementById('password2').innerHTML='<br/>패스워드가 다릅니다. 다시 한번 확인해주세요.';
		return false;
	}else if(!passwordPattenCheck()){
		document.getElementById('password2').innerHTML='<br/>패턴에 맞게 입력해주세요.';
		return false;
	}else if(document.getElementsByName('password')[1].value==document.getElementsByName('password2')[0].value&&passwordPattenCheck()){
		document.getElementById('password2').innerHTML='';
		return true;
	}
}

function passwordCheck2(){
	if(document.getElementsByName('newPW')[0].value!= document.getElementsByName('newPW2')[0].value && passwordPattenCheck2()){
		document.getElementById('password4').innerHTML='<br/>패스워드가 다릅니다. 다시 한번 확인해주세요.';
		return false;
	}else if(!passwordPattenCheck2()){
		document.getElementById('password4').innerHTML='<br/>패턴에 맞게 입력해주세요.';
		return false;
	}else if(document.getElementsByName('newPW')[0].value==document.getElementsByName('newPW2')[0].value&&passwordPattenCheck2()){
		document.getElementById('password4').innerHTML='';
		return true;
	}
}

function join(){
	var id=document.getElementsByName('id')[1].value.trim();
	var password=document.getElementsByName('password')[1].value.trim();
	var name=document.getElementsByName('name')[0].value.trim();
	var addr=document.getElementsByName('addr')[0].value.trim();
	var phone=document.getElementsByName('phone')[1].value.trim();
	var email=document.getElementsByName('email')[0].value.trim();
	var sex=document.getElementsByName('sex')[0].value.trim();
	if(id.length==0||password.length==0||document.getElementsByName('password2')[0].value.trim().length==0||name.length==0||addr.length==0||phone.length==0||email.length==0||sex.length==0){
		alert('전화번호를 제외한 항목은 모두 입력해주세요.');
		return false;
	}else if(document.getElementById('idCheck2').value==2){
		alert('아이디 중복 검사를 해주세요.')
		return false;	
	}else if(document.getElementById('idCheck2').value==1){
		alert('이미 사용중인 아이디입니다.')
		return false;	
	}else if(!passwordCheck()||!passwordPattenCheck()){
		alert('패스워드를 확인해주세요.')
		return false;
	}
	fetch('create?id='+id+'&password='+password+'&name='+name+'&addr='+addr+'&phone='+phone+'&email='+email,{
		method:'get',
	}).then(response=>{
		if(response.status==200){
			response.text().then(text=>{
				location.href="homePage";
			});
		}
	});
}
function login(form){
	var id=document.getElementsByName('id')[0].value;
	var password=document.getElementsByName('password')[0].value;
				console.log(id+" "+password);
	fetch('login?id='+id+'&password='+password,{
		method:'get'
	}).then(response=>{
		if(response.status==200){
			response.text().then(text=>{
				console.log(text);
				console.log(1);
				if(text==1){
				console.log(2);
					location.href="homePage";
				console.log(3);
				}else if(text==0){
					alert('잘못된 정보입니다.');
				}
			});
		}
	});
}

function logout(){
	location.href='logout';
}

function numCheck(){
	if(document.getElementsByName('num')[0].value==document.getElementById('messageNum').value){
		document.getElementById('true').style.display="inline";
		document.getElementById('true').innerHTML=document.getElementById('hiddenId').value;
	}else{
		alert('인증번호가 잘못됐습니다.');
	}
}

function message(){
	fetch('findingID?phoneNum='+document.getElementById('phoneNum').value,{
		method:'get'
	}).then(response=>{
		if(response.status==200){
			response.text().then(text=>{
				console.log(text);
				if(text==2){
					alert('등록되지 않은 정보입니다.');
				}else if(text==1){
					alert('잘못된 번호입니다.')
				}else{
					alert('인증번호 발송')
					var texts=text.split(' ');
					document.getElementById('messageNum').value=texts[0];
					document.getElementById('hiddenId').value=texts[1];
				}
			});
		}
	});
}

// PW 찾기////////////////////////////////
function pw_message(){
	/*
	let phone=document.getElementById('pwFind_phoneNum').value;
	$.ajax({
		type:'POST',
		url:'phoneNumCheck',
		data:{
			phone:phone
		},
		success:function(result){
			if(result==1){
				alert('없는 번호입니다.');
			}else{
				alert('인증 번호 발송 중');
				document.getElementById('phoneCheckNum').value=result;
				document.getElementById('phoneNumBtn').style='display:block';
				document.getElementById('joinPhoneCheck').style='display:block';
			}
		},
		error:function(){
			alert('시스템 오류');
		}
	});*/
	fetch('findingPW?phoneNum='+document.getElementById('pwFind_phoneNum').value + '&id=' + document.getElementById('pwFind_id').value,{
		method:'get'
	}).then(response=>{
		if(response.status==200){
			response.text().then(text=>{
				console.log(text);
				if(text==2){
					alert('잘못된 정보입니다.');
				}else if(text==1){
					alert('발신오류입니다.')
				}else{
					document.getElementById('newPwCheck').value = text;
					alert('인증번호가 발송되었습니다.')
				}
			});
		}
	});
}
////////////////////////////////////////////

function checked(label){
	labels=document.querySelectorAll('.ChoiceGender');
	for(var la of labels){
		la.className="gender";
	}
	label.className="ChoiceGender";
}

function newPW(){
	if (passwordCheck2() && passwordPattenCheck2()){
		location.href = "updatePW?password=" + document.getElementsByName('newPW')[0].value + '&id=' + document.getElementById('pwFind_id').value;
	} else {
		alert('패스워드를 확인해주세요.')
	}
}

function numCheck2(){
	if(document.getElementsByName('num2')[0].value == document.getElementById('newPwCheck').value){
		document.getElementById('newPW').style.display = "block";
	}else{
		alert('인증번호가 잘못됐습니다.');
	}
}

function joinPhoneCheck(){
	if(document.getElementById('pass').value=="0"){
		var phone=document.getElementsByName('phone')[1].value;
		console.log(phone);
		$.ajax({
			type:'POST',
			url:'phoneNumCheck',
			data:{
				phone:phone
			},
			success:function(result){
				if(result==1){
					alert('없는 번호입니다.');
				}else{
					alert('인증 번호 발송 중');
					document.getElementById('phoneCheckNum').value=result;
					document.getElementById('phoneNumBtn').style='display:block';
					document.getElementById('joinPhoneCheck').style='display:block';
				}
			},
			error:function(){
				alert('시스템 오류');
			}
		});
	}else{
		alert('이미 인증 된 번호입니다.');
	}
}

function joinPhoneCheck2(){
	if(document.getElementById('joinPhoneCheck').value==document.getElementById('phoneCheckNum').value){
		document.getElementById('phoneNumBtn').style='display:none';
		document.getElementById('joinPhoneCheck').style='display:none';
		document.getElementById('pass').value="1";
 	}
}
