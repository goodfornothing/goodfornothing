/*
 * 	Easy Paginate 1.0 - jQuery plugin
 *	written by Alen Grakalic	
 *	http://cssglobe.com/
 *
 *	Copyright (c) 2011 Alen Grakalic (http://cssglobe.com)
 *	Dual licensed under the MIT (MIT-LICENSE.txt)
 *	and GPL (GPL-LICENSE.txt) licenses.
 *
 *	Built for jQuery library
 *	http://jquery.com
 *
 */

(function($) {
		  
	$.fn.easyPaginate = function(options){

		var defaults = {				
			step: 4,
			delay: 100,
			numeric: true,
			nextprev: true,
			auto:false,
			loop:false,
			pause:4000,
			clickstop:true,
			controls: 'pagination',
			current: 'current',
			startPage: 1,
			callback: function(slide) { },
		}; 
		
		var options = $.extend(defaults, options); 
		var step = options.step;
		var lower, upper;
		var children = $(this).children('fieldset');
		var count = children.length;
		var obj, next, prev;		
		var pages = Math.floor(count/step);
		var page = options.startPage
		var timeout;
		var clicked = false;
		
		function show(page){
			
			clearTimeout(timeout);
			lower = ((page-1) * step);
			upper = lower+step;
			
			$(children).each(function(i){
				
				var child = $(this);
				child.hide();
				
				// Show requested page
				if(i>=lower && i<upper){ 
					options.callback(child);
					setTimeout(function(){ child.show() }, (i-(Math.floor(i/step)*step))*options.delay);	
				}
				
				// Toggle relevant controls
				if(options.nextprev){
					if(upper >= count) { next.hide(); } else { next.show(); };
					if(lower >= 1) { prev.show(); } else { prev.hide(); };
				};
				
			});	
			
			$('li','#'+ options.controls).removeClass(options.current);
			$('li[data-index="'+page+'"]','#'+ options.controls).addClass(options.current);
			
			if(options.auto){
				if(options.clickstop && clicked){}else{ timeout = setTimeout(auto,options.pause); };
			};
			
		};
		
		function auto(){
			if(options.loop) if(upper >= count){ page=0; show(page); }
			if(upper < count){ page++; show(page); }				
		};
		
		this.each(function(){ 
			
			obj = this;
			
			if(count>step){
								
				if((count/step) > pages) pages++;
				
				var ol = $('<ol id="'+ options.controls +'"></ol>').insertAfter(obj);
				
				if(options.nextprev){
					prev = $('<li class="prev">Previous</li>')
						.hide()
						.appendTo(ol)
						.click(function(ev){
							ev.preventDefault();
							ev.stopPropagation();
							clicked = true;
							page--;
							show(page);
						});
				};
				
				if(options.numeric){
					for(var i=1;i<=pages;i++){
					$('<li class="page_links" data-index="'+ i +'">'+ i +'</li>')
						.appendTo(ol)
						.click(function(ev){	
							ev.preventDefault();
							ev.stopPropagation();
							clicked = true;
							page = $(this).attr('data-index');
							show(page);
						});					
					};				
				};
				
				if(options.nextprev){
					next = $('<li class="next">Next</li>')
						.hide()
						.appendTo(ol)
						.click(function(ev){
							ev.preventDefault();
							ev.stopPropagation();
							clicked = true;			
							page++;
							show(page);
							return false;
						});
				};
		
				show(page);
				
			};
		});
		
	};	

})(jQuery);