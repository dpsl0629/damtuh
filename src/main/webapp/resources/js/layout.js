
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




/* :: gnb s :: */
(function($) {
    $(document).ready(init);

    var $win = $(window),
        $header, $dep1, $dep2, $moveH, $dimed, $depTit,
        $mobBtn, $gnb,
        $winW = $win.outerWidth(),
        $winH = $win.outerHeight();

    function init() {
        $header = $('.header');
        $dep1 = $('.gnb-lst > li');
        $dep2 = $('.gnb-dep2-wrap');
        $dimed = $('.gnb-dimed');
        $depTit = $('.js-gnb-dep-tit');
        $moveH = 310; // 높이값
        $mobBtn = $('.mob-gnb-btn');
        $gnb = $('.gnb');
        $lnb = $(".lnb");

        webGnbFn();
        mobGnbFn();
    }

    $win.on({
        resize : function() {
            var $newWindW = $(this).width();
            $winH = $(this).height();
            if($newWindW !== $winW){
                SetViewSize();
                removeStyleFn($header);
                removeStyleFn($dep1);
                removeStyleFn($dep2);
                removeStyleFn($dimed);
                removeStyleFn($depTit);
                removeStyleFn($mobBtn);
                removeStyleFn($gnb);
                $winW = $newWindW;
            }
        }
    });

    function webGnbFn() {
        $dep1.on({
            mouseenter : function() {
                if(INJEGYM.IS_VIEWTYPE == "web") {
                    var $this = $(this);
                    $(".gnb-dep2-wrap").addClass("active"); 
                    $(".gnb-dimed").addClass("active");
                    $this.addClass("active");
                    $(".main-wrapper").addClass("active");
                    $(".sub-wrapper").addClass("active");
                }
            }
        });

        $dep1.on({
            mouseleave : function() {
                if(INJEGYM.IS_VIEWTYPE == "web") {
                    var $this = $(this);
                    $(".gnb-dep2-wrap").removeClass("active"); 
                    $(".gnb-dimed").removeClass("active");
                    $this.removeClass("active");
                    $(".main-wrapper").removeClass("active");
                    $(".sub-wrapper").removeClass("active");
                }
            }
        });


        $dep2.on({
            mouseenter : function() {
                if(INJEGYM.IS_VIEWTYPE == "web") {
                    var $this = $(this);
                    $this.parent().siblings().removeClass('active');
                    $this.parent().addClass('active');
                    $depTit.text('');
                    $depTit.text($this.parent().find('> a').text());
                }
            }
        });

        $header.on({
            mouseleave : function() {
                if(INJEGYM.IS_VIEWTYPE == "web") {
                    $(this).removeClass('active');
                    $dep1.removeClass('active');
                }
            }
        });
    }

    function mobGnbFn() {
        $mobBtn.mouseenter({
            click: function() {
                if(INJEGYM.IS_VIEWTYPE == "tablet" || INJEGYM.IS_VIEWTYPE == "mobile") {
                    var $this = $(this);
                    $this.toggleClass("active");
                    $gnb.toggleClass("active");
                    $header.toggleClass("active");
                    $dimed.toggleClass("active");
                    removeStyleFn($dep1);
                    console.log("모바일");
                    $(".gnb-dimed").removeClass("active");
                    $(".main-wrapper").toggleClass("active");
                    $(".sub-wrapper").toggleClass("active");
                }
            }
        });

        $dep1.on({
            mouseenter: function(e) {
                if(INJEGYM.IS_VIEWTYPE == "tablet" || INJEGYM.IS_VIEWTYPE == "mobile") {
                    var $this = $(this),
                        $thisParent = $this.parent(),
                        $thisDep2 = $this.find($dep2);
                        $this.addClass("active");
                        $thisDep2.stop().slideDown(); 
                        console.log("모모");
                }
            }
        });

        $dep1.on({
            mouseleave: function(e) {
                if(INJEGYM.IS_VIEWTYPE == "tablet" || INJEGYM.IS_VIEWTYPE == "mobile") {
                    var $this = $(this),
                        $thisParent = $this.parent(),
                        $thisDep2 = $thisParent.find($dep2);
                        $this.removeClass("active");
                        $thisDep2.stop().slideUp();
                        console.log("모모");
                }
            }
        });
    }


    function removeStyleFn($target) {
        $target.removeClass("active").removeAttr("style");
    }
}
)(jQuery);
/* :: gnb e :: */
