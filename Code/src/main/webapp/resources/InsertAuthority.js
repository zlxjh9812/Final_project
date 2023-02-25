  $( document ).ready( function() {
    	  
    	
    	  
        $( '.slider' ).slick( {
          autoplay: true,
          autoplaySpeed: 5000,
          slidesToShow: 5,
          slidesToScroll: 3,
        } );
        
        $("#write").on("click", function(e) {
			$.ajax({
				url : "write.do",
				data : {
					"UserId" : $('#UserId').val()
				},
				success : function(data) {
					if (data === '1') {
						
						
						alert("권한이 존재하지 않습니다. 로그인 후 다시 시도해 주세요.");
						return false;
					} else if(data === '2'){
						alert("현재 제재중인 아이디 입니다. 자세한 내용은 FAQ 페이지 에서 확인해 주세요")
						return false;
					}else{
						return location.href='writeGo.do';
					}
				},
				error : function(req, status, err) {
					console.log(req);
				}
			}); //ajax
		});// idCheck

      } );