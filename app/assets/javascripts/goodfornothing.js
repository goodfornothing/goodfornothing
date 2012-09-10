$(document).ready(function(){
	
	$('.input.smart_label').each(function(i,el){
		
		label = $($(el).find('label')[0]).hide();
		
		if($(el).hasClass('text')) {
			input = $($(el).find('textarea')[0]);
		} else {
			input = $($(el).find('input')[0]);
		}
		
		text = label.text().replace('* ','');
		input.data('placeholder', text);
		
		if(input.val()=='') {
			input.val(text)
		} 
		
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
	
});