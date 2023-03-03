const heart = document.querySelector(".heart");
const animationHeart = document.querySelector(".animation-heart");
var likeVar = $('#likeVar').val();
let seq = $('#seq').val();
let userid = $('#userid').val();

if(likeVar){
	console.log("좋아요 이미 누름");
	console.log(seq);
	console.log(userid);
	console.log(likeVar);
	
	animationHeart.addEventListener('click', function(event){
		$.ajax({
			type: 'post',
			url : '/likeDown.do',
			data: {
				seq : seq,
				userid: userid
				},
			success: function(data){
				animationHeart.classList.remove('animation');
				heart.classList.remove('fill-color');
			}
		
		});	
	});
}else {
	console.log("좋아요 아직 안누름");
	console.log(seq);
	console.log(userid);
	console.log(likeVar);
	
	heart.addEventListener('click', function(event){
		$.ajax({
			type: 'post',
			url : '/likeUp.do',
			data: 	{
						seq : seq,
						userid: userid			
					}
				,
			success:function(data){
				animationHeart.classList.add('animation');
				heart.classList.add('fill-color');
				}
			});	
	});
}

