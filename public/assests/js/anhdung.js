$( document ).ready(function() {
	$("#duasplen").click(function() {
		window.location.assign("/product/add");
	});

	$("#spdone").click(function() {
		window.location.assign("/product/result");
	});
	
    $("#hotrokh").click(function() {
        $('body').animate({scrollTop: $('.footer').offset().top}, 1000);
    });

    $("#mylist").click(function() {
        window.location.assign("/account/mylist");
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
