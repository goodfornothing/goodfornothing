//= require active_admin/base
//= require sir-trevor
//= require sir-trevor/blocks/heading

$(document).ready(function(){
		
		$(function(){
						
			if($('.sir-trevor-area').length> 0) {
		  	
				var editor = new SirTrevor.Editor({ 
					el: $('.sir-trevor-area'),
					blockTypes: ["Text", "Heading", "Quote", "Ul", "Tweet", "Image", "Video"]
				});
								
			}
			
		});
		
});