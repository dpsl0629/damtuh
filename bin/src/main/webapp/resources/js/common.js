
/* :: responsive s :: */
var INJEGYM = INJEGYM || {};
INJEGYM.UI = INJEGYM.UI || {};
INJEGYM.VIEWPORT_WIDTH = null;
INJEGYM.VIEWPORT_HEIGHT = null;
INJEGYM.IS_MOBILE = false;
INJEGYM.IS_VIEWTYPE = null;
INJEGYM.IS_SIZE = INJEGYM.IS_SIZE || {};
INJEGYM.IS_SIZE.MAXMOBILE = 768;
INJEGYM.IS_SIZE.MAXTABLET = 1023;
INJEGYM.IS_TABLET = false;
INJEGYM.FOCUS_ELEM = null;

INJEGYM.DELAY_FUNC = (function(){
    var timer = 0;
    return function(callback, ms){
        clearTimeout (timer);
        timer = setTimeout(callback, ms);
    };
})();

var SetViewSize = function(){
    INJEGYM.VIEWPORT_WIDTH = Math.max(document.documentElement.clientWidth, window.innerWidth || 0);
    INJEGYM.VIEWPORT_HEIGHT = Math.max(document.documentElement.clientHeight, window.innerHeight || 0);
};

var CheckMobile = function(){
    var mobileInfo = ['Android', 'iPhone', 'iPod', 'iPad', 'BlackBerry', 'Windows CE', 'SAMSUNG', 'LG', 'MOT', 'SonyEricsson'];
    $.each(mobileInfo, function(index){
        if (navigator.userAgent.match(mobileInfo[index]) != null){
            INJEGYM.IS_MOBILE = true;
        }
    });
};

var DeivceChkFn= function() {
    if(INJEGYM.VIEWPORT_WIDTH < INJEGYM.IS_SIZE.MAXMOBILE && INJEGYM.IS_MOBILE){
        INJEGYM.IS_VIEWTYPE = 'mobile';
    } else if(INJEGYM.VIEWPORT_WIDTH <= INJEGYM.IS_SIZE.MAXTABLET && INJEGYM.IS_MOBILE){
        INJEGYM.IS_VIEWTYPE = 'tablet';
    } else {
        if(INJEGYM.VIEWPORT_WIDTH < INJEGYM.IS_SIZE.MAXMOBILE ) {
            INJEGYM.IS_VIEWTYPE = 'mobile';
        } else if (INJEGYM.VIEWPORT_WIDTH <= INJEGYM.IS_SIZE.MAXTABLET ) {
            INJEGYM.IS_VIEWTYPE = 'tablet';
        } else {
            INJEGYM.IS_VIEWTYPE = 'web';
        }
    }
};

$(window).resize(function(){
    SetViewSize();
    CheckMobile();
    DeivceChkFn();
});

$(document).ready(function(){
    SetViewSize();
    CheckMobile();
    DeivceChkFn();
});
/* :: responsive e :: */


/* :: dotline s :: */
function dotLineFunc() {
    if($('.js-dotline').length){
        var $dotline = $('.js-dotline');
        $dotline.dotdotdot({
            watch:true
        });
    }
}

$(document).ready(dotLineFunc);
/* :: dotline e :: */




/* :: header s :: */
(function($) {
    $(document).ready(init);

    var $win = $(window),
        $header, $svg,
        $mobBtn, $gnb,
        $winW = $win.outerWidth();

    function init() {
        $header = $('.header');
        $svg = $('.header-logo-svg');
        $mobBtn = $('.mob-gnb-btn');
        $gnb = $('.gnb');

        scrollFunc($win);
        mobGnbFn();
    }

    $win.on({
        resize : function() {
            var $newWindW = $(this).width();
            if($newWindW !== $winW){
                SetViewSize();
                removeStyleFn($header);
                removeStyleFn($mobBtn);
                removeStyleFn($gnb);
                $svg.contents().find('g').removeClass('active');
                $winW = $newWindW;
            }
        },
        scroll : function() {
            scrollFunc($(this));
        }
    });

    function scrollFunc($target) {
        var st = $target.scrollTop(),
            $header = $('.header');

        if (st > 50) $header.addClass('scroll');
        else $header.removeClass('scroll');
    }


    function mobGnbFn() {
        $mobBtn.on({
            click: function() {
                if(INJEGYM.IS_VIEWTYPE == "tablet" || INJEGYM.IS_VIEWTYPE == "mobile") {
                    $(this).toggleClass('active');
                    $header.toggleClass('active');
                    $gnb.toggleClass('active');
                }
            }
        });
    }

    function removeStyleFn($target) {
        $target.removeClass("active").removeAttr("style");
    }
})(jQuery);
/* :: header e :: */