/* :: responsive s :: */
var DAMTUH = DAMTUH || {};
DAMTUH.UI = DAMTUH.UI || {};
DAMTUH.VIEWPORT_WIDTH = null;
DAMTUH.VIEWPORT_HEIGHT = null;
DAMTUH.IS_MOBILE = false;
DAMTUH.IS_VIEWTYPE = null;
DAMTUH.IS_SIZE = DAMTUH.IS_SIZE || {};
DAMTUH.IS_SIZE.MAXMOBILE = 768;
DAMTUH.IS_SIZE.MAXTABLET = 1023;
DAMTUH.IS_TABLET = false;
DAMTUH.FOCUS_ELEM = null;

DAMTUH.DELAY_FUNC = (function(){
    var timer = 0;
    return function(callback, ms){
        clearTimeout (timer);
        timer = setTimeout(callback, ms);
    };
})();

var SetViewSize = function(){
    DAMTUH.VIEWPORT_WIDTH = Math.max(document.documentElement.clientWidth, window.innerWidth || 0);
    DAMTUH.VIEWPORT_HEIGHT = Math.max(document.documentElement.clientHeight, window.innerHeight || 0);
};

var CheckMobile = function(){
    var mobileInfo = ['Android', 'iPhone', 'iPod', 'iPad', 'BlackBerry', 'Windows CE', 'SAMSUNG', 'LG', 'MOT', 'SonyEricsson'];
    $.each(mobileInfo, function(index){
        if (navigator.userAgent.match(mobileInfo[index]) != null){
            DAMTUH.IS_MOBILE = true;
        }
    });
};

var DeivceChkFn= function() {
    if(DAMTUH.VIEWPORT_WIDTH < DAMTUH.IS_SIZE.MAXMOBILE && DAMTUH.IS_MOBILE){
        DAMTUH.IS_VIEWTYPE = 'mobile';
    } else if(DAMTUH.VIEWPORT_WIDTH <= DAMTUH.IS_SIZE.MAXTABLET && DAMTUH.IS_MOBILE){
        DAMTUH.IS_VIEWTYPE = 'tablet';
    } else {
        if(DAMTUH.VIEWPORT_WIDTH < DAMTUH.IS_SIZE.MAXMOBILE ) {
            DAMTUH.IS_VIEWTYPE = 'mobile';
        } else if (DAMTUH.VIEWPORT_WIDTH <= DAMTUH.IS_SIZE.MAXTABLET ) {
            DAMTUH.IS_VIEWTYPE = 'tablet';
        } else {
            DAMTUH.IS_VIEWTYPE = 'web';
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
        $dep1 = $('.gnb-lst > li');
        $dep2 = $('.gnb-dep2-wrap');
        $dimed = $('.gnb-dimed');
        $depTit = $('.js-gnb-dep-tit');
        $mobBtn = $('.mob-gnb-btn');
        $gnb = $('.gnb');
        $lnb = $(".lnb");
        $mainWrapper = $(".main-wrapper");
        $subWrapper = $(".sub-wrapper");

        scrollFunc($win);
        mobGnbFn();
        webGnbFn();
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
    
     function webGnbFn() {
        $dep1.on({
            mouseenter : function() {
                if(DAMTUH.IS_VIEWTYPE == "web") {
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
                if(DAMTUH.IS_VIEWTYPE == "web") {
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
                if(DAMTUH.IS_VIEWTYPE == "web") {
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
                if(DAMTUH.IS_VIEWTYPE == "web") {
                    $(this).removeClass('active');
                    $dep1.removeClass('active');
                }
            }
        });
    }


    function mobGnbFn() {
        $mobBtn.on({
            click: function() {
                if(DAMTUH.IS_VIEWTYPE == "tablet" || DAMTUH.IS_VIEWTYPE == "mobile") {
                     var $this = $(this);
                    $this.toggleClass("active");
                    $gnb.toggleClass("active");
                    $header.toggleClass("active");
                    $dimed.toggleClass("active");
                    removeStyleFn($dep1);
                    console.log("모바일");
                    $dimed.removeClass("active");
                    $mainWrapper.toggleClass("active");
                    $subWrapper.toggleClass("active");
                }
            }
        });
        
      $dep1.on({
        mouseenter: function(e) {
            if(DAMTUH.IS_VIEWTYPE == "tablet" || DAMTUH.IS_VIEWTYPE == "mobile") {
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
                if(DAMTUH.IS_VIEWTYPE == "tablet" || DAMTUH.IS_VIEWTYPE == "mobile") {
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
})(jQuery);
/* :: header e :: */