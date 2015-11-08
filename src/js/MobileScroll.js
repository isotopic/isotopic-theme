function IsotopicMobileScroller(options){

	var element = options.element; 

	var maxScroll = 1000;
	var curScroll = 0;
	var newY = 0;
	var oldY = 0;
	var deltaY = 0;
	var friction = 0.95;
	var inertiaInterval;

	function inertia() {
		addAndSetRatio();
		deltaY*=friction;
		if(deltaY>-1&&deltaY<1){
			clearInterval(inertiaInterval);
		}
	}

	setup =  function(){
		element.addEventListener('touchstart', onStart, false);
		element.addEventListener('touchmove', onMove, false);
		element.addEventListener('touchend', onEnd, false);
		element.addEventListener('touchleave', onEnd, false);
	};

	onStart = function(event){
		newY = event.touches[0].pageY;
		event.preventDefault();
	};

	onMove = function(event){
		oldY = newY;
		newY = event.touches[0].pageY;
		deltaY = -(newY-oldY);
		addAndSetRatio();
	};

	onEnd = function(event){
		if(Math.abs(deltaY)>1){
			clearInterval(inertiaInterval);
			inertiaInterval = setInterval(function(){
				inertia();
			}, 10);
		}
	};

	addAndSetRatio = function(){
		curScroll += deltaY;
		if(curScroll>maxScroll){
			curScroll=maxScroll;
		}
		if(curScroll<0){
			curScroll=0;
		}
		window.ratio = ((curScroll)/maxScroll);
	};

	setup();

	return {};

}
