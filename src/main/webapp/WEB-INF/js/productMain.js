/*!
* Start Bootstrap - Shop Homepage v5.0.4 (https://startbootstrap.com/template/shop-homepage)
* Copyright 2013-2021 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-shop-homepage/blob/master/LICENSE)
*/
// This file is intentionally blank
// Use this file to add JavaScript to your project

function searchCheck(form){
	if(form.search.value==null || form.search.value.trim().length==0){
		alert('검색어를 입력해주세요.');
		return false;
	}
	return true;
}