//reqToAdmin
				function go(page){
			var data="page="+page;
			ajax(data);
		}
		
		function setPaging(href, digit){
			output +='<li class=page-item>';
			gray="";
			if(href==""){
				gray="gray";
			}
			anchor="<a class='page-link "+gray+"'"+href+">"+digit+"</a></li>";
			output+=anchor;
			
		}
		function ajax(data){
			
			output="";
			$.ajax({
				type:"POST",
				data: data,
				url: "myReqToA",
				dataType: "json",
				cache: false,
				success: function(data){
					if(data.reqlistcount>0){
						
						$('.accordion').empty();
						var myreqlist=$(data.myreqlist);
						console.log(myreqlist);
						$(data.myreqlist).each(
						function(){
							output+='<div class="accordion__item">'
								output+='<h3 class="accordion__title js-title">'+this.reqDate+ '</h3>'
								output+='<div class="accordion__copy accordion__copy--close js-copy">'
								output+='<div><strong>'+this.subject+ '</strong><br>'+this.content+ 
								'</div>'
								output+='<div><hr><i class="fas fa-share fa-flip-vertical"></i>'
								+this.reply +'</div></div></div>'
						}		
						)
						output+='</div>';
						$('.accordion').append(output);
						
						//페이지네이션
						$('.pagination').empty();
						output="";
						digit='<<&nbsp;&nbsp;';
						href='';
						if(data.page>1){
							href='href=javascript:go('+(data.page-1)+')';
							
						}
					
						for(var i=data.startpage; i<=data.endpage; i++){
							digit='&nbsp;'+i+'&nbsp;';
							href="";
							if(i!=data.page){
								href='href=javascript:go('+i+')';
							}
							setPaging(href,digit);
						}
						digit='&nbsp;&nbsp;>>';
						href='';
						if(data.page<data.maxpage){
							href='href=javascript:go('+(data.page+1)+')';
						}
						//setPaging(href,digit);
						$('.pagination').append(output);
					}
					else{
						$('.accordion').empty();
						$('.accordion').append('<font size=5>등록된 글이 없습니다.</font>');
					}
				},
				error:function(){
					console.log('ajax에러');
				}
			})
		}
		
			$('#reqtoA').click(function(){
				go(1);
			})
			$('#reqtoH').click(function(){
				location.href='myqna.net';
			})
			