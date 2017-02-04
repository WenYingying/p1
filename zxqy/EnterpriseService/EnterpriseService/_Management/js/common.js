$(function(){
	
//=====根据屏幕大小适配字体大小strat
	var docEl = $("html");
    resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize';
    recalc = function () {
        var clientWidth = $(window).width();
//			        console.log($(window).width());
        if (!clientWidth) return;
        if (clientWidth >= 1200) {
            docEl.css("font-size", '100px');
        } else {
            docEl.css("font-size", 100 * (clientWidth / 1200) + 'px');
        }
    };
    window.addEventListener(resizeEvt, recalc, false);
    recalc();
//=====根据屏幕大小适配字体大小end

});