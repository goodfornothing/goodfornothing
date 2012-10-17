//= require jquery

//= require jquery.ui.core
//= require jquery.ui.widget
//= require jquery.ui.mouse
//= require jquery.ui.position
//= require jquery.ui.tabs
//= require jquery.ui.datepicker

//= require jquery_ujs
//= require active_admin/application

//= require sir-trevor
//= require sir-trevor/blocks/heading
//= require sir-trevor/blocks/markdown


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