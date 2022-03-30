$('#textBox').keyup(function(e){
	let content = $(this).val();
	
	// 글자수 세기
	if(content.length == 0 || content == ''){
		$('.textCount').text('0');
	} else{
		$('.textCount').text(content.length);
	}
	
	// 글자수 제한
	if(content.length > 300){
		// 300자 부터는 타이핑이 되지 않도록
		$('.textCount').text('300');
		$(this).val($(this).val().substring(0, 300));
		// 300자 넘으면 알림창 뜨도록
		alert('글자수는 300자까지 입력 가능합니다.');
	};
});



