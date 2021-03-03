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
        $dep1 = $('.gnb-list > li');
        $dep2 = $('.gnb-dep2-wrap');
        $dimed = $('.gnb-dimed');
        $depTit = $('.js-gnb-dep-tit');
        $moveH = 310; // 높이값
        $mobBtn = $('.mob-gnb-btn');
        $gnb = $('.gnb');

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
        $dep1.find('>a').on({
            mouseenter : function() {
                if(YYFMC.IS_VIEWTYPE == "web") {
                    var $this = $(this);
                    $this.parent().siblings().removeClass('active');
                    $this.parent().addClass('active');
                    $header.addClass('active');
                    $depTit.text('');
                    $depTit.text($this.text());
                    webAnimateFn($dep2, 0, $moveH);
                    webAnimateFn($dimed, 0, $moveH);
                }
            }
        });

        $dep2.on({
            mouseenter : function() {
                if(YYFMC.IS_VIEWTYPE == "web") {
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
                if(YYFMC.IS_VIEWTYPE == "web") {
                    $(this).removeClass('active');
                    $dep1.removeClass('active');
                    webAnimateFn($dep2, 0, 0);
                    webAnimateFn($dimed, 0, 0);
                }
            }
        });
    }

    function mobGnbFn() {
        $mobBtn.on({
            click: function() {
                if(YYFMC.IS_VIEWTYPE == "tablet" || YYFMC.IS_VIEWTYPE == "mobile") {
                    var $this = $(this);
                    $this.toggleClass('active');
                    $gnb.stop().slideToggle().toggleClass('active');
                    $header.toggleClass('active');
                    $dimed.toggleClass('active');
                    removeStyleFn($dep1);
                    $dep2.stop().slideUp().removeClass('active');
                }
            }
        });

        $dep1.find('>a').on({
            click: function(e) {
                if(YYFMC.IS_VIEWTYPE == "tablet" || YYFMC.IS_VIEWTYPE == "mobile") {
                    var $this = $(this),
                        $thisParent = $this.parent(),
                        $thisDep2 = $thisParent.find($dep2);
                    e.preventDefault();
                    $thisParent.siblings().removeClass('active');
                    $thisParent.toggleClass('active');
                    $thisParent.siblings().find($dep2).stop().slideUp().removeClass('active');
                    $thisDep2.stop().slideToggle().toggleClass('active');
                }
            }
        });
    }

    function webAnimateFn($target, $speed, $height) {
        TweenMax.killTweensOf($target);
        TweenMax.to($target, $speed, { height: parseInt($height), ease: Expo.easeOut });
    }

    function removeStyleFn($target) {
        $target.removeClass("active").removeAttr("style");
    }
})(jQuery);
/* :: gnb e :: */