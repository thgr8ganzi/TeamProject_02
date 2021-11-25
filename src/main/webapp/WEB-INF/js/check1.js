function check(){
	fetch("test",
		method=get
	).then(response=>{
		response.text().then(text=>{
			document.getElementById('num').value=num;
			document.getElementById('id').value=id;
		})
	})
}
function check2(){
	if(document.getElementById('num').value==document.getElementById('memberNum').value){
		document.getElementById('idid').style='display:block;'
		document.getElementById('idid').value="아이디 : "+document.getElementById('id').value;
	}
}
