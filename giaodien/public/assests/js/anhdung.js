$( document ).ready(function() {
	$("#duasplen").click(function() {
		window.location.assign("addProduct.html");
	});

	$("#spdone").click(function() {
		window.location.assign("final.html");
	});
	
    $("#hotrokh").click(function() {
        $('body').animate({scrollTop: $('.footer').offset().top}, 1000);
    });

    $("#mylist").click(function() {
        window.location.assign("myListProduct.html");
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
