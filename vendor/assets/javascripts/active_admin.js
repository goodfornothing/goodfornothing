//= require active_admin/base
//= require sir-trevor

$(document).ready(function(){
		
		$(function(){
			if($('.sir-trevor-area').length> 0) {
		  	var editor = new SirTrevor.Editor({ el: $('.sir-trevor-area') });
			}
		});
		
});