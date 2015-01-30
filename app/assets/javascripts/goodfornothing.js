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

	$(".js-talent-badge").click(function(){
		$(this).toggleClass("talent-badge--filled");
	})
	
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
	var slideDuration = 4000;
	var slideshowRef = window.setInterval(slide, slideDuration);

	$(".js-slideshow").width(100 * slideCount + "%");
	
	$(".js-slideshow-pagination").click(function(e){
		index = $(this).index(".js-slideshow-pagination");
		advanceSlideshow(index);
	})

	function advanceSlideshow(index){
		player.api("paused", function(paused){
			if (paused){
				clearInterval(slideshowRef);
				slideshowRef = window.setInterval(slide, slideDuration);
			}
		});
		$(".js-slideshow-pagination").removeClass("active");
		$(".js-slideshow-pagination").eq(index).addClass("active");
		$(".js-slideshow").css("left", (-100 * index) + "%");
	}

	$(".js-arrow-left, .js-arrow-right").click(function(){
		if ($(this).hasClass("js-arrow-right")){
			index = (index+1)%slideCount;
		} else {
			index--;
			if (index < 0){
				index = -1 + slideCount;
			}
		}
		advanceSlideshow(index);

	});

	function slide(){
		index++;
		advanceSlideshow(index % slideCount);
	}

	//froogaloop
    var iframe = $('#player1')[0];
    player = $f(iframe);

    // When the player is ready, add listeners for pause, finish, and playProgress
    player.addEvent('ready', function() {
    	player.addEvent('play', onPlay);
    	player.addEvent('pause', restartSlideshow);
    	player.addEvent('finish', restartSlideshow);
    });


    function restartSlideshow() {
        slideshowRef = window.setInterval(slide, slideDuration);
    }

    function onPlay(){
    	clearInterval(slideshowRef);
    }

	//Google map
	if ($("#js-map").length){

		(function(){
			var chapterPage;
			var map;
			var markers = [];
			var infoBoxes = [];
			var settings = {
				zoom: 2,
				minZoom:2,
				maxZoom:7,
				center: new google.maps.LatLng(20,0),
				scrollwheel: true,
				streetViewControl: false,
				scrollwheel: false, 
			}
			var locations = [
				{title:"London", slug:"london", lat: 51.507351, lng: -0.127758},
				{title:"Bristol", slug:"bristol", lat: 51.454513, lng: -2.587910},
				{title:"Brighton", slug:"brighton", lat: 50.822530, lng: -0.137163},
				{title:"Manchester", slug:"manchester", lat: 53.480759, lng: -2.242631},
				{title:"Wellington", slug:"wellington", lat: -41.286460, lng: 174.776236},
				{title:"Phnom Penh", slug:"phnom-penh", lat: 11.544873, lng: 104.892167},
				{title:"Cape Town", slug:"cape-town", lat: -33.924869, lng: 18.424055},
				{title:"Singapore", slug:"singapore", lat: 1.352083, lng: 103.819836},
				{title:"Nottingham", slug:"nottingham", lat: 52.954783, lng: -1.158109},
				{title:"Cornwall", slug:"cornwall", lat: 50.503630, lng: -4.652498},
				{title:"Birmingham", slug:"birmingham", lat: 52.486243, lng: -1.890401},
				{title:"Portsmouth", slug:"portsmouth", lat: 50.816667, lng: -1.083333},
				{title:"London Camden", slug:"london-camden", lat: 51.551706, lng: -0.158826},
				{title:"Chester", slug:"chester", lat: 53.193392, lng: -2.893075},
				{title:"Cardiff", slug:"cardiff", lat: 51.481581, lng: -3.17909},
				{title:"Cambridge", slug:"cambridge", lat: 52.204267, lng: 0.114908},
				{title:"Colchester", slug:"colchester", lat: 51.895927, lng: 0.891874},
				{title:"London East", slug:"london-east", lat: 51.561948, lng: -0.013139},
				{title:"Derby", slug:"derby", lat: 52.922530, lng: -1.474619},
				{title:"Leeds", slug:"leeds", lat: 53.800755, lng: -1.549077},
				{title:"Doncaster", slug:"doncaster", lat: 53.522820, lng: -1.128462},
				{title:"Rotterdam", slug:"rotterdam", lat: 51.924420, lng: 4.477733},
				{title:"Edinburgh", slug:"edinburgh", lat: 55.953252, lng: -3.188267},
				{title:"Reading", slug:"reading", lat: 51.454265, lng: -0.97813},
				{title:"Stockholm", slug:"stockholm", lat: 59.329323, lng: 18.068581},
				{title:"Perth", slug:"perth", lat: -31.953513, lng: 115.857047},
				{title:"Sydney", slug:"sydney", lat: -33.867487, lng: 151.20699},
				{title:"Glasgow", slug:"glasgow", lat: 55.864237, lng: -4.251806},
				{title:"Ipswich", slug:"ipswich", lat: 52.056736, lng: 1.14822},
				{title:"Liverpool", slug:"liverpool", lat: 53.408371, lng: -2.991573},
				{title:"Victoria", slug:"victoria", lat: 48.428421, lng: -123.365644},
				{title:"Leicester", slug:"leicester", lat: 52.636878, lng: -1.139759},
				{title:"Montreal", slug:"montreal", lat: 45.501689, lng: -73.567256},
				{title:"Fargo", slug:"fargo", lat: 46.877222, lng: -96.789444},
				{title:"São Paulo", slug:"sao-paulo", lat: -23.55, lng: -46.63}, 
			]

			if ($(".view_chapter").length > 0){
				chapterPage = true;
			} else {
				chapterPage = false;
				settings.navigationControl = false,
				settings.scaleControl = false,
				settings.zoomControl = false,
				settings.draggable = false,
				settings.mapTypeControl = false,
				settings.mapTypeId = google.maps.MapTypeId.ROADMAP,
				settings.panControl = false
			}

			// Google Map
			function initializeMap() {

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
				}));

				if (chapterPage){

					infoBoxes.push(new InfoBox({
						closeBoxURL: "/assets/assets/close-button.png",
						closeBoxMargin: "5px",
						pixelOffset: new google.maps.Size(-50, 0),
						boxStyle: { 
							width: "100px",
							"font-size":"16px",
							background:"white"
						},
						content: "<div style='padding:10px;'><a style='font-family:\"Good for Nothing\"' href='/chapter/"+locations[i].slug+"'>"+locations[i].title+"</a></div>"
					}));

					setupListener(infoBoxes[i],markers[i])
				}

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