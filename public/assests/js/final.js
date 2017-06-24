$(document).ready(function() {
        var items = $("table tbody tr");

        var numItems = items.length;
        var perPage = 5;

        var pagination_placeholder_selector = ".pagination-page"; 
        var myPageName = "#page-"; 


        items.slice(perPage).hide();

       
        $(pagination_placeholder_selector).pagination({
            items: numItems,
            itemsOnPage: perPage,
            cssStyle: "light-theme",
            hrefTextPrefix: myPageName,
            onPageClick: function(pageNumber) {
                var showFrom = perPage * (pageNumber - 1);
                var showTo = showFrom + perPage;

                items.hide()
                     .slice(showFrom, showTo).show();
            }
        });



       
        var checkFragment = function() {
           
            var hash = window.location.hash || (myPageName+"1");

           
            var re = new RegExp("^"+myPageName+"(\\d+)$");
            hash = hash.match(re);

            if(hash)
               
                $(pagination_placeholder_selector).pagination("selectPage", parseInt(hash[1]));
        };

        
        $(window).bind("popstate", checkFragment);

     
        checkFragment();

        });