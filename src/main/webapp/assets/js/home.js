$(document)
.ready(function() {

    // fix menu when passed
    $('.masthead')
    .visibility({
        once: false,
        onBottomPassed: function() {
            $('.fixed.menu').transition('fade in');
            changeActiveItem('#about-segment');
        },
        onBottomPassedReverse: function() {
            $('.fixed.menu').transition('fade out');
        }
    })
    ;
    
    $('#about-segment').visibility({
        once : false,
        onBottomPassed : function() {
            changeActiveItem('#education-segment');
        },
        onBottomPassedReverse : function() {
            changeActiveItem('#about-segment');
        }
    });
    
    $('#education-segment').visibility({
        once : false,
        onBottomPassed : function() {
            changeActiveItem('#skill-segment');
        },
        onBottomPassedReverse : function() {
            changeActiveItem('#education-segment');
        }
    });
    
    $('#skill-segment').visibility({
        once : false,
        onBottomPassed : function() {
            changeActiveItem('#project-segment');
        },
        onBottomPassedReverse : function() {
            changeActiveItem('#skill-segment');
        }
    });
    
    $('#project-segment').visibility({
        once : false,
        onBottomPassed : function() {
            changeActiveItem('#contact-segment');
        },
        onBottomPassedReverse : function() {
            changeActiveItem('#project-segment');
        }
    });
    
    $('#contact-segment').visibility({
        once : false,
        onBottomPassed : function() {
            
        },
        onBottomPassedReverse : function() {
            changeActiveItem('#contact-segment');
        }
    });
    
    // $('[role="nav-item"]').click(function() {
    //     var item = $(this).attr('href');
    //     changeActiveItem(item);
    // });
    
    $('[role="read-more"]').click(function() {
        window.location.href="#about-segment";
    });
    
    // setInterval(function readmoreBounce() {
    //     $('[role="read-more"]').transition('pulse');
    // },1000);
    
    function changeActiveItem(item) {
        $('.active.item').removeClass('active');
        $('[href="'+item+'"]').addClass('active');
    };

    // create sidebar and attach to menu open
    $('.ui.sidebar')
    .sidebar('attach events', '.toc.item')
    ;
    
    //skills progress
    $('#html5-progress')
    .progress({
        percent : 90,
        label : 'ratio'
    });
    
    $('#css3-progress')
    .progress({
        percent : 90,
        label : 'ratio'
    });
    
    $('#js-progress')
    .progress({
        percent : 90,
        label : 'ratio'
    });
    
    $('#java-progress')
    .progress({
        percent : 90,
        label : 'ratio'
    });
    
    $('#sql-progress')
    .progress({
        percent : 90,
        label : 'ratio'
    });
    
    $('#php-progress')
    .progress({
        percent : 60,
        label : 'ratio'
    });
    
    $('#android-progress')
    .progress({
        percent : 30,
        label : 'ratio'
    });
    
    $('#linux-progress')
    .progress({
        percent : 30,
        label : 'ratio'
    });

})
;