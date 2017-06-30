$(document).ready(function(){

    var p = $(".priceNow").text();
    var q = parseFloat(p);
    var h = q * 10 / 100;
    $("#txtPrice").val(q+h); 
    
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
    var c = $('#timefinish').val();
    var a = new Date("May 15, 2017 10:30:00");
    var b = new Date(c);
    var today = new Date();
    var m = b-today;
    console.log(m);
      if(m>0){
      var v = m/1000;
      var seconds = parseInt(v); 
      var hours   = Math.floor(seconds / 3600);
      var minutes = Math.floor((seconds - (hours * 3600)) / 60);
      var seconds = seconds - (hours * 3600) - (minutes * 60);
      if (hours   < 10) {hours   = "0"+hours;}
      if (minutes < 10) {minutes = "0"+minutes;}
      if (seconds < 10) {seconds = "0"+seconds;}

      $('#demo').html("Thời gian còn lại: " +hours +":" + minutes +":" + seconds);    
        var t = setTimeout(function(){ startTime() }, 500);
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