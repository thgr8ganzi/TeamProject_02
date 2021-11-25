function check(form) {
	var name = form.name.value.trim().length;
	var sex = form.sex.value.trim().length;
	var password = form.password.value.trim().length;
	var email = form.email.value.trim().length;
	var phone = form.name.value.trim().length;
	if(name != 0 && password != 0 && sex != 0 && email != 0 && phone != 0){
		console.log(name);
		console.log(sex);
		console.log(password);
		console.log(email);
		console.log(phone);
		alert('저장 완료');
		return true;
	}else{
		alert('빈칸을 확인해주세요.');
		return false;
	}
}