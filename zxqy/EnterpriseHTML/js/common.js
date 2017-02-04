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

//头部退出
	$(".head li a.end").click(function(){
		$(".head li div.hide").toggle();
	});
//				左侧列表
	$(".left .list>a").click(function(){
		$(this).addClass("active").siblings("a").removeClass("active");
		$(".recruit_hide").hide();
		$(".account_hide").hide();
	});
//	招聘管理
	$(".recruit").click(function(){
		$(".recruit_hide").show();
	});
//				账户设置
	$(".account").click(function(){
		$(".account_hide").show();
	});
//				招聘管理/账户设置的子集
	$(".hide>a").click(function(){
		$(this).addClass("red").siblings("a").removeClass("red");
	});
});
//上传图片
	$(".content_center li .tit").click(function(){
		$(this).siblings(".tip").toggleClass("tipshow");
	});
	$(".content_center li .tit").click(function(){
		$(this).siblings(".tit_hide").toggleClass("tipshow");
	});