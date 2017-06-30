$( document ).ready(function() {
	$("#duasplen").click(function() {
		window.location.assign("/product/add");
	});

	
    $("#hotrokh").click(function() {
        $('body').animate({scrollTop: $('.footer').offset().top}, 1000);
    });


    $(".bid").click(function() {
    	window.location.assign("productDetail.html");
    });

    $(".product-item").hover(
	  function() {
	    $(".bid",this ).css("opacity", "1");
	  }, function() {
	    $(".bid",this ).css("opacity", "0");
	  }
	);
});
