$(document).ready(function(){
    $('.hinhanh a').fancybox();
    
    $('ul.tabs li').click(function(){
        var tab_id = $(this).attr('data-tab');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $(this).addClass('current');
        $("#"+tab_id).addClass('current');
    });

    $('.scrolltop').click(function(event) {
        event.preventDefault();
        $('body').animate({scrollTop:0}, 1000);
    });

         var owl = $("#owl-demo");
 
          owl.owlCarousel({
            navigation : true,
            singleItem : true,
            transitionStyle : "fade"
          });
          
          $("#owl-demo1").owlCarousel({
         
              autoPlay: 3000, //Set AutoPlay to 3 seconds
         
              items : 4,
              itemsDesktop : [1199,3],
              itemsDesktopSmall : [979,3]
         
          });


     $(window).scroll(function() {
    var fixedBottom = $(".scrolltop");
    if ($(window).height() <= $('.scrolltop').offset().top)  {
        fixedBottom.css("opacity", 1 );
    } else {
        fixedBottom.css("opacity", 0 );
    }
  });

});


    function startTime(){
    var a = new Date("May 15, 2017 10:30:00");
    var b = new Date("May 25, 2017 15:30:00");
    var today = new Date();
    var h = parseInt(today.getHours());
    var m = parseInt(today.getMinutes());
    var s = parseInt(today.getSeconds());
    var d = parseInt(today.getDate());

    var h1= parseInt(b.getHours());
    var m1 = parseInt(b.getMinutes());
    var s1 = parseInt(b.getSeconds());
    var d1 = parseInt(b.getDate());
    var s2,m2,h2;
     if(d1 >= d){
       if(h1>=h){
            if(m1>=m){
                if(s1>=s){
                    s2=s1-s;
                    m2=m1-m;
                    h2=h1-h + (d1-d)*24;
                }
                else{
                    s2=s1-s+60;
                    m2=m1-m-1;
                    h2=h1-h + (d1-d)*24;
                }
            }
            else{
                s2=s1-s+60;
                m2=m1-m-1 +60;
                h2=h1-h -1 + (d1-d)*24;
            }
        }
     else{
        s2=s1-s+60;
        m2=m1-m-1 +60;
        h2=h1-h -1 +(d1-d)*24 -1;    
       }
    if(h2>=0){
        m2 = checkTime(m2);
        s2 = checkTime(s2);
        $('#demo').html("Thời gian còn lại: " +h2 + ":" + m2 + ":" + s2);    
        var t = setTimeout(function(){ startTime() }, 500);  
    }
   else{
     $('#demo').html("Đã hết thời gian đặt hàng");   
     $('#dathang').hide();
   }   
    }

    else{
         $('#demo').html("Đã hết thời gian đặt hàng");   
         $('#dathang').hide();
       }
    }


    function checkTime(i) {
        if (i < 10) {
            i = "0" + i;
        }
        return i;
    }
    
	window.onload = startTime;