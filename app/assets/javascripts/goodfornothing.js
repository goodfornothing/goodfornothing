$(document).ready(function(){
	
	// Smart Labels
	$('.input.smart_label').each(function(i,el){
		
		label = $($(el).find('label')[0]).hide();
		
		if($(el).hasClass('text')) {
			input = $($(el).find('textarea')[0]);
		} else {
			input = $($(el).find('input')[0]);
		}
		
		text = label.text().replace('* ','');
		input.data('placeholder', text);
		
		if(input.val()=='') { input.val(text); } 
		
		input.bind('focus',function(ev){
			if($(this).val()==$(this).data('placeholder')) {
				$(this).val('')
			}
		});
		
		input.bind('blur',function(ev){
			if($(this).val()=='') {
				$(this).val($(this).data('placeholder'));
			}
		});
		
	});
	
	$('form').each(function(i,el){

		$(el).bind('submit',function(ev){
			$(el).find('.smart_label input, .smart_label textarea').each(function(i,input) {
				if($(input).val()==$(input).data('placeholder')) {
					$(input).val('');
				}
			})
		})
		
	})
	
	// Range sliders
	$('input[type="range"]').rangeinput();
	
	// Select boxes
	$('.single form select').selectBox();
	$('.single form .input.select label').hide();
	
	// Max lengths
	$(".single form [maxlength]").each(function(index,input) { $(input).limit_chars(); });
	
	// Tips
	$(".tip[title], .hint a[title]").tooltip({
		offset: [2, 20]
	});
	
});