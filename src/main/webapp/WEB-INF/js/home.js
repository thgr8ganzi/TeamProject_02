/*!
* Start Bootstrap - Full Width Pics v5.0.4 (https://startbootstrap.com/template/full-width-pics)
* Copyright 2013-2021 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-full-width-pics/blob/master/LICENSE)
*/
// This file is intentionally blank
// Use this file to add JavaScript to your project
function login(job){
	location.href='loginPage?job='+job;
}
//==================== introduce section ===============================
const items = document.querySelectorAll('.question');

function openCloseAnswer() {
  const answerId = this.id.replace('que', 'ans');
  if(document.getElementById(answerId).style.display === 'block') {
    document.getElementById(answerId).style.display = 'none';
    document.getElementById(this.id + '-toggle').textContent = '+';
  } else {
    document.getElementById(answerId).style.display = 'block';
    document.getElementById(this.id + '-toggle').textContent = '-';
  }
}

items.forEach(item => item.addEventListener('click', openCloseAnswer));
//=======================================================================

