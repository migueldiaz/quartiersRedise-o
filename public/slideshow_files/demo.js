var App = new Class({
	
	initialize: function(){
		this.initSlideShows()
			.attach()
			.initNavFx()
			.initHistory()
		;
	},
	
	initSlideShows: function(){
		
		// this site has tons of slide shows
		// they are all instantiated here
		// the events are all added in `attach`
		
		// this whole site's navigation is a slideshow
		this.mainTabs = new SlideShow('main-show',{
			transition: 'fadeThroughBackground'
		});
		
		// feature list on introduction page
		this.introShow = new SlideShow('intro-show', {
			transition: 'pushLeft',
			delay: 3500,
			autoplay: true
		});
		

		
		// navigation demo with numbered labels
		this.navigationShow = new SlideShow('navigation-show', {
			transition: 'pushLeft'
		});
		
		
		// Transitions are just simple functions
		// add one to the slideshow API with SlideShow.add(name, fn)
		SlideShow.add('fall', function(previous, next, duration, instance){
			var distance = instance.element.getSize().y;
			next.setStyle('top', -distance);
			new Fx.Elements([previous, next], {
				transition: 'bounce:out',
				duration: duration
			}).start({
				0: { top: [distance] },
				1: { top: [0] }
			});
			return this;
		});
		
	

		
		return this;
	},
	
	attach: function(){
		return this.attachMainTabs().attachNavigationDemo();	
	},
	
	attachMainTabs: function(){
		var navs = $('nav').getElements('li');
		this.mainTabs.addEvent('show', function(slideData){
			// stop the intro show if it's not the intro slide
			if (slideData.next.index == 0) {
				this.introShow.play();
			} else {
				this.introShow.pause();
			}
			// same as above, but ecma-riff-script!
			
			// change class of current tab
			navs.removeClass('current');
	//		navs[slideData.next.index].addClass('current');
		}.bind(this));
		return this;
	},
	
	attachNavigationDemo: function(){
		var self = this;

		// these will control the slideshow
		var navs = $('navigation-demo').getElements('.nav li');

		// add click events to the elements
		navs.each(function(element, index){
			element.addEvent('click', function(){
				// going to figure the current index of the slideshow
				// and change the transition to go the "right" way
				// so it feels like a typical "panel" kind of widget
				var currentIndex = self.navigationShow.slides.indexOf(self.navigationShow.current);
				var transition = (currentIndex < index) ? 'pushLeft' : 'pushRight';
				// ignoring the last two lines this is really
				// quite simple, the indicies of the nav elements
				// and the slide elements match ... so just show the index
				self.navigationShow.show(index, { transition: transition });
			});
		});
		
		// morph the style of the nav elements
		this.navigationShow.addEvent('show', function(slideData){
			navs[slideData.previous.index].morph('.normal');
			navs[slideData.next.index].morph('.current');
		});
		
		// set the initial slide to current
		navs[0].morph('.current');
		
		// add Keyboard
		$(document).addEvent('keyup', function(event){
			// couldn't be any easier!
			if (event.key == 'left')
				self.navigationShow.showPrevious({ transition: 'pushRight' });
			else if (event.key == 'right')
				self.navigationShow.showNext({ transition: 'pushLeft' });
		});
		
		return this;
	},
	
	initHistory: function(){
		var self = this;
		this.history = new HashEvents().addEvents({
			// using my history manager to control the main tab slideshw
			'':                   function(){ self.mainTabs.show(1) }
		}).check();
		return this;
	},
	
	// irrelevant to the slideshows, but interesting nonetheless I hope :D
	initNavFx: function(){
		this.nav = $('nav');
		var navHideAmount = this.nav.getSize().y + 20;
		this.nav.setStyle('top', -navHideAmount);
		// aparece el menu superior
		this.nav.tween.delay(1500, this.nav, ['top', 0]);
		return this;
	}
	
});

var app;
window.addEvent('domready', function(){
	$$('html')[0].removeClass('notready').addClass('ready');
	app = new App;
});
