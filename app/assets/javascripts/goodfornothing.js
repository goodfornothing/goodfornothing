$(document).ready(function(){
	
	// Smart Labels
	$('.input.smart_label').each(function(i,el){
		
		label = $($(el).find('label')[0]).addClass('js');
		
		label.text(label.text().replace('*',''))
		
		if($(el).hasClass('text')) {
			input = $($(el).find('textarea')[0]);
		} else {
			input = $($(el).find('input')[0]);
		}
		
		input.bind('focus',function(ev){
			$($(this).siblings('label')[0]).hide()
		});
		
		input.bind('blur',function(ev){
			if($(this).val()=='') {
				$($(this).siblings('label')[0]).show()
			}
		});
		
		if(input.val()!='') {
			$(input.siblings('label')[0]).hide()
		}
		
	});
	
	// Range sliders
	$('input[type="range"]').rangeinput();
	
	// Select boxes
	$('.single form select').selectBox();
	$('.single form .input.select label').hide();
	
	// Max lengths
	$(".single form [maxlength]").each(function(index,input) { $(input).limit_chars(); });
	
	// Tips
	$(".hint a[title]").tooltip({offset: [-1, 22]	});
	$(".tip[title]").tooltip({ offset: [-3, 40] });

	
});