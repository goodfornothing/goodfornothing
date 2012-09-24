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
	$('form.primary select').selectBox();
	$('form.primary .input.select label').hide();
	
	// Checkboxes
	$(".checkbox").addClass('js');
	$(".checkbox input").each(function(index,input){
		
		checked = $(input).attr('checked')?true:false;
		if(checked) $($(input).parents('label')[0]).addClass('checked');
		
		$(input).change(function(ev){
			checked = $(this).attr('checked')?true:false;
			if(checked){
				$($(this).parents('label')[0]).addClass('checked');
			} else {
				$($(this).parents('label')[0]).removeClass('checked');
			}
		});
		
	});
	
	// Radios
	$(".slide .radio").addClass('js');
	$(".slide .radio input").each(function(index,input){

		checked = $(input).attr('checked')?true:false;
		if(checked) $($(input).parents('label')[0]).addClass('checked');
		
		$(input).change(function(ev){			
			checked = $(this).attr('checked')?true:false;
			if(checked){
				$($(this).parents('.radio_buttons')[0]).find('.radio').removeClass('checked');
				$($(this).parents('label')[0]).addClass('checked');
			} else {
				$($(this).parents('label')[0]).removeClass('checked');
			}
		});
		
	});
		
	// Tips
	$(".hint a[title]").tooltip({offset: [-1, 22]	});
	$(".hint span[title]").tooltip({offset: [-2,-50],tipClass: 'tooltip_large'});
	$(".avatar .tip[title]").tooltip({ offset: [-3, 40] });
	$(".cta .tip[title]").tooltip({ offset: [3, 100] });
	$(".icon_crew .tip[title]").tooltip({ offset: [-5, 45] });
	$(".range_slider .details[title]").tooltip({ offset: [0, -50],tipClass: 'tooltip_large' });
	$('.challenge_panel .tip').tooltip({ offset: [-3, 55] });
	
	// Registration form
	$('form.slides').easyPaginate({ step: 1 });
	$('form.slides').append($('#pagination'))
	$('#pagination li').not('.next, .prev').addClass('page_links')
	
	// Section panels
	$('.section_panel').each(function(i,el){
		$(el).find('p').hide();
		$(el).bind('mouseover',function(ev){
			$(this).find('p').slideDown('fast');
		});
		$(el).bind('mouseleave',function(ev){
			$(this).find('p').slideUp('fast');
		});
		
		$(el).click(function(ev){
			ev.preventDefault();
			ev.stopPropagation();
			window.location = $($(this).find('h2 a')[0]).attr('href')
		})
		
	});
	
	// Ajaxy pants	
	var opts = {
	  lines: 9, // The number of lines to draw
	  length: 3, // The length of each line
	  width: 2, // The line thickness
	  radius: 5, // The radius of the inner circle
	  corners: 0, // Corner roundness (0..1)
	  rotate: 22, // The rotation offset
	  color: '#D0122D', // #rgb or #rrggbb
	  speed: 1.3, // Rounds per second
	  trail: 60, // Afterglow percentage
	  shadow: false, // Whether to render a shadow
	  hwaccel: false, // Whether to use hardware acceleration
	  className: 'spinner', // The CSS class to assign to the spinner
	  zInde0x: 2e9, // The z-index (defaults to 2000000000)
	  top: '0', // Top position relative to parent in px
	  left: '0', // Left position relative to parent in px
	};
	
	var target = document.getElementById('spinmerightround');
	var spinner = new Spinner(opts).spin(target);
	
	$('#spinmerightround')
	    .hide()
	    .ajaxStart(function() {
	        $(this).show();
	    })
	    .ajaxStop(function() {
	        $(this).hide();
	    })
	;
	
});