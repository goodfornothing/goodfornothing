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
	
	// Checkboxes
	$(".slide .checkbox").addClass('js');
	$(".slide .checkbox input").each(function(index,input){
		
		checked = $(input).attr('checked')?true:false;
		if(checked){
			$($(input).parents('label')[0]).addClass('checked');
		} else {
			$($(input).parents('label')[0]).removeClass('checked');
		}
		
		$(input).change(function(ev){
			checked = $(this).attr('checked')?true:false;
			if(checked){
				$($(this).parents('label')[0]).addClass('checked');
			} else {
				$($(this).parents('label')[0]).removeClass('checked');
			}
		});
		
	});
	
	// Max lengths
	$(".single form [maxlength]").each(function(index,input) { $(input).limit_chars(); });
	
	// Tips
	$(".hint a[title]").tooltip({offset: [-1, 22]	});
	$(".avatar .tip[title]").tooltip({ offset: [-3, 40] });
	$(".cta .tip[title]").tooltip({ offset: [3, 100] });
	
	$('#new_user.slides').easyPaginate({ step: 1 });
	$('#new_user.slides').append($('#pagination'))
	$('#pagination li').not('.next, .prev').addClass('page_links')
	
});