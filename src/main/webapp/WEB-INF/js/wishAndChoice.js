function wish(grade, name, id, img){
	$.ajax({
		type:'POST',
		url:'wish',
		data:{
			grade:grade,
			itemName:name,
			id:id,
			img:img
		},
		success:function(result){
			if(result==1){
				alert('이미 목록으로 등록된 제품입니다.');
			}else if(result==2){
				alert('현재의 구독권으로는 이용할 수 없는 제품입니다.')
			}else{
				alert('관심 목록으로 추가되었습니다.')
			}
		}
	});
}

function choice(grade, name, id, img){
	$.ajax({
		type:'POST',
		url:'choice',
		data:{
			grade:grade,
			furnitureName:name,
			id:id,
			img:img
		},
		success:function(result){
			if(result==1){
				alert('이미 사용중인 제품입니다.');
			}else if(result==2){
				alert('현재의 구독권으로는 이용할 수 없는 제품입니다.')
			}else if(result==3){
				alert('이미 해당 등급의 상품을 이용 중 이십니다.')
			}else{
				alert('사용 신청이 완료 되었습니다. 감사합니다.')
			}
		}
	})
}