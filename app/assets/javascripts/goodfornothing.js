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
		
		input.bind('focus',function(ev){ $($(this).siblings('label')[0]).hide();  });
		
		input.bind('blur',function(ev){
			if($(this).val()=='') {
				$($(this).siblings('label')[0]).show()
			}
		});
		
		if(input.val()!='') { $(input.siblings('label')[0]).hide(); }
		
	});
	
	$('.field_with_errors input, .field_with_errors textarea').bind('focus',function(ev){
		$(this).siblings('.error').hide();
	});

	// Smooth scroll inline links
	$('a[href*=#]').click(function() {
	  scrollToElement(this.hash)
	  return false;   
	});
	
	// Range sliders
	$('.range_slider input[type="range"]').rangeinput();
	
	// Skill filtering
	var skill_filter = {}
	$('.skill_filter input[type="range"]').each(function(i,el){
		skill = $(el).attr('name');
		skill_filter[skill] = $(el).val();
	});
	
	$('.skill_filter input[type="range"]').rangeinput({
		change: function(ev, val)  {
			skill_filter[$(this.getInput()).attr('name')] = val
			$('.skilled').each(function(i,block){
				talented = true				
		  	for(skill in skill_filter) {
					block_skill = $(block).attr('data-'+skill)
					if(skill_filter[skill] > 0 && (block_skill < skill_filter[skill] || block_skill == undefined)) {
						$(block).hide();
						talented = false
					}
				}
				if (talented) $(block).show()
			});
		},
		progress: true
	});
	
	// Select boxes
	$('form.primary_panel select').selectBox();
	$('form.primary_panel .input.select label').hide();
	
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
	
	// Avatar file upload
	$('#profile_avatar form').each(function(i,el){
		$(el).find('input[type="submit"]').hide();
		$(el).find('label').hide();
		$($(el).find('input[type="file"]')[0]).change(function(ev){
			$($(this).parents('form')[0]).submit();
		});
	});
		
	// Tips
	$(".hint a[title]").tooltip({offset: [-1, 22]	});
	$(".hint span[title]").tooltip({offset: [-2,-50],tipClass: 'tooltip_large'});
	$(".avatar .tip[title]").tooltip({ offset: [-3, 40] });
	$(".cta .tip[title]").tooltip({ offset: [3, 100] });
	$(".icon_crew .tip[title]").tooltip({ offset: [-5, 45] });
	$(".range_slider .details[title]").tooltip({ offset: [0, -50],tipClass: 'tooltip_large' });
	$('.avatar.tip').tooltip({ offset: [-4, -12] });
	$('.splodge_list .tip').tooltip({ offset: [175, 0],tipClass: 'tooltip_small' });
	$('.warbling .tip').tooltip({ offset: [195, 0],tipClass: 'tooltip_small' });
	$('.issue_tip').tooltip({ offset: [105, 0],tipClass: 'tooltip_small' });
	$(".grow_tip").tooltip({offset: [-1, 22]	});
	
	// Inputs that grow...
	$(".grow_tip input").on('focus',function(ev){ $(this).parents('.input').addClass('full');});
	$(".grow_tip input").on('blur',function(ev){ $(this).parents('.input').removeClass('full');});
	
	// Check for errors then paginate forms
	page = 1;
	$('form.slides .fields fieldset').each(function(i,el){
		if($(el).find('.field_with_errors').length>0){
			page = i+1;
			return false;
		}
	});
	
	$('form.slides .fields').easyPaginate({ 
			step: 1, 
			startPage: page,
			callback: function(slide) {
				if(slide.hasClass('similar')) {
					
					data = {}
					
					loc = $('#user_location').val();
					if(loc.length>0) data.loc = loc
		
					issues = Array()
					$('input:checkbox[name="user[issue_ids][]"]:checked').each(function(i,el){	
						issues.push($(el).val())
					});
					if(issues.length>0) data.issues = issues
					
					chapter = $('input:radio[name="user[chapter_id]"]:checked').val();
					if(typeof(chapter)!=undefined) data.chapter = chapter
					
					$.ajax({ 
						url: "/members/find/similar/",
						method: 'post',
						data: data
					})
				}
			}
	});
	
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
	  length: 4, // The length of each line
	  width: 3, // The line thickness
	  radius: 6, // The radius of the inner circle
	  corners: 0, // Corner roundness (0..1)
	  rotate: 22, // The rotation offset
	  color: '#085156', // #rgb or #rrggbb
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
	
	// Stick stuff to the top
	$('#collaborators div').stickyScroll({ container: $('#collaborators') })
	$('#warble_filters').stickyScroll({ container: $('#main') })
	$('#wiki_navigation ul').stickyScroll({ container: $('#wiki_navigation') })


	//Home page slideshow
	var slideCount = $(".js-slide").length;
	var index = 0;
	$(".js-slideshow").width(100 * slideCount + "%");
	
	$(".js-slideshow-pagination").click(function(e){
		index = $(this).index(".js-slideshow-pagination");
		advanceSlideshow(index);	
	})

	function advanceSlideshow(index){
		$(".js-slideshow-pagination").removeClass("active");
		$(".js-slideshow-pagination").eq(index).addClass("active");
		$(".js-slideshow").css("left", (-100 * index) + "%");
	}

	$(".js-arrow-right").click(function(){
		index = (index+1)%slideCount;
		advanceSlideshow(index);
	});

	$(".js-arrow-left").click(function(){
		index--;
		if (index < 0){
			index = -1 + slideCount;
		}
		advanceSlideshow(index);
	});

	//Uncomment to autoplay
	// window.setInterval(function(){
	// 	index++;
	// 	advanceSlideshow(index % slideCount);
	// }, 10000);



	//Google map
	if ($("#js-map").length){
		(function(){
			var map;
			var markers = [];
			var infoBoxes = [];
			var locations = [
				{
					title: "",
					desc: "Manchester",
					lat: 53.482035,
					lng: -2.234324
				},
				{
					title: "",
					desc: "Cape Town",
					lat: -33.925278,
					lng: 18.423889
				},
				{
					title: "",
					desc: "Phnom Penh",
					lat: 11.55,
					lng: 104.916667
				}
			];

			// Google Map
			function initializeMap() {
				var settings = {
					zoom: 2,
					minZoom:2,
					maxZoom:7,
					center: new google.maps.LatLng(20,0),
					scrollwheel: true,
					navigationControl: false,
					scaleControl: false,
					streetViewControl: false,
					draggable: true,
					scrollwheel: false, 
					mapTypeControl: false,
					mapTypeId: google.maps.MapTypeId.ROADMAP,
					panControl: false

				};

				map = new google.maps.Map(document.getElementById('js-map'), settings);
			
				var map_styles = [
				  {
				    featureType: "all",
				    stylers: [
				      { saturation: -100 }
				    ]
				  }
				];
				
				map.setOptions({styles: map_styles});
				
			}

			function setupListener(infoBubble,marker){
				google.maps.event.addListener(marker, 'click', function() {
				  infoBubble.open(map,marker);
				});
			}

			initializeMap();

			for (var i = 0 ; i < locations.length ; i++){

				markers.push(new google.maps.Marker({
					map: map,
					position: new google.maps.LatLng(locations[i].lat, locations[i].lng),
					title: locations[i].desc
				}));

				infoBoxes.push(new InfoBox({
				     closeBoxURL: "/assets/assets/close-button.png",
				     closeBoxMargin: "5px",
				     pixelOffset: new google.maps.Size(-50, 0),
				     boxStyle: { 
	     				width: "100px",
	     				"font-size":"16px",
	     				background:"white"
				     },
				     content: "<div style='padding:10px;'>"+locations[i].desc+"</div>"
				 }));

				setupListener(infoBoxes[i],markers[i])

			}
		})();
	}
});

function scrollToElement(element) {
	var targetPosition=$(element).offset().top-10;
  $('html:not(:animated),body:not(:animated)').animate({ scrollTop: targetPosition }, {
    duration: 500, 
    easing:'swing'
  });
}