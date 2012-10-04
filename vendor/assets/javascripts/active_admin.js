//= require active_admin/base
//= require markitup/jquery.markitup
//= require markitup/sets/default/set
//= require sir-trevor

$(document).ready(function(){
		
		$('.dashboard_section').each(function(i,el){
			
			$(el).hide();
			content = $(el).html();
						
			panel = $('<div class="panel">');
			panel.html(content)
			
			$($(el).parents('#main_content')[0]).append(panel)
			
		});
		
		$('.dashboard').hide();
		
		$(function(){
		  var editor = new SirTrevor.Editor({ el: $('.sir-trevor-area') });
		});
		
});