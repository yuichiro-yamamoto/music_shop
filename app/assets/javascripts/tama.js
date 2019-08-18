$(document).on("turbolinks:load", function() {
    $(function() {
        $('.y_select select').change(function() {
            $(".y_search_item_name, .y_search_item_stock, .y_search_item_condition").css({
                "display":"none"
            });

            switch( $('.y_select select').val() ) {
                case "0":
                    $(".y_search_item_name").css({
                        "display":"block"
                    });

                    break
                case "1":
                    $(".y_search_item_stock").css({
                        "display":"block"
                    });
                    break
                case "2":
                    $(".y_search_item_condition").css({
                        "display":"block"
                    });
            }
        })

    })

    $(".y_search_item_name, .y_search_item_stock, .y_search_item_condition").css({
        "display":"none"
    });

    switch( $('.y_select select').val() ) {
        case "0":
            $(".y_search_item_name").css({
                "display":"block"
            });

            break
        case "1":
            $(".y_search_item_stock").css({
                "display":"block"
            });
            break
        case "2":
            $(".y_search_item_condition").css({
                "display":"block"
            });
    }


})