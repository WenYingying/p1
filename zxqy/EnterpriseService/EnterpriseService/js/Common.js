$(function () {
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
    $(".head li a.end").click(function () {
        $(".head li div.hide").toggle();
    });
    $(".head li div.hide").mouseleave(function () {
        $(this).hide();
    });
    //				左侧列表
    $(".left .list>a").click(function () {
        $(this).addClass("active").siblings("a").removeClass("active");
        $(".recruit_hide").hide();
        $(".account_hide").hide();
    });
    //	招聘管理
    $(".recruit").click(function () {
        $(".recruit_hide").show();
    });
    //				账户设置
    //$(".account").click(function () {
    //    $(".account_hide").show();
    //});
    //				招聘管理/账户设置的子集
    $(".hide>a").click(function () {
        $(this).addClass("red").siblings("a").removeClass("red");
    });
    //cookie 操作
    jQuery.cookie = function (name, value, options) {
        if (typeof value != 'undefined') { // name and value given, set cookie
            options = options || {};
            if (value === null) {
                value = '';
                options.expires = -1;
            }
            var expires = '';
            if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
                var date;
                if (typeof options.expires == 'number') {
                    date = new Date();
                    date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
                } else {
                    date = options.expires;
                }
                expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE
            }
            var path = options.path ? '; path=' + options.path : '';
            var domain = options.domain ? '; domain=' + options.domain : '';
            var secure = options.secure ? '; secure' : '';
            document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
        } else { // only name given, get cookie
            var cookieValue = null;
            if (document.cookie && document.cookie != '') {
                var cookies = document.cookie.split(';');
                for (var i = 0; i < cookies.length; i++) {
                    var cookie = jQuery.trim(cookies[i]);
                    // Does this cookie string begin with the name we want?
                    if (cookie.substring(0, name.length + 1) == (name + '=')) {
                        cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                        break;
                    }
                }
            }
            return cookieValue;
        }
    };

});