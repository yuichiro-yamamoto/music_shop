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

    $(function() {
        let classCount = $(".y_disc").length;
        for (let i = 0 ; i < classCount; i++){
            $('.y_disc > input').eq(i).val(i+1)
            $('.y_disc_num').eq(i).text(i+1)
        }

        for (let i = 0 ; i < classCount; i++){
            let music_form_count = $('.y-nest').eq(i).find(".form-inline").length

            for (let j = 0 ; j < music_form_count; j++){
                $('.y-nest').eq(i).find('.y_music > input').eq(j).val(j+1)
                $('.y-nest').eq(i).find('.y_music_order').eq(j).text(j+1)
            }
        }

        $('.discs').on('cocoon:after-insert', function(e) {
            let classCount = $(".y_disc").length;
            for (let i = 0 ; i < classCount; i++){
                $('.y_disc > input').eq(i).val(i+1)
                $('.y_disc_num').eq(i).text(i+1)
            }

            for (let i = 0 ; i < classCount; i++){
                let music_form_count = $('.y-nest').eq(i).find(".form-inline").length

                for (let j = 0 ; j < music_form_count; j++){
                    $('.y-nest').eq(i).find('.y_music > input').eq(j).val(j+1)
                    $('.y-nest').eq(i).find('.y_music_order').eq(j).text(j+1)
                }
            }

        })

        $('.discs').on('cocoon:after-remove', function(e) {
            let classCount = $(".y_disc").length;
            for (let i = 0 ; i < classCount; i++){
                $('.y_disc > input').eq(i).val(i+1)
                $('.y_disc_num').eq(i).text(i+1)
            }

            for (let i = 0 ; i < classCount; i++){
                let music_form_count = $('.y-nest').eq(i).find(".form-inline").length

                for (let j = 0 ; j < music_form_count; j++){
                    $('.y-nest').eq(i).find('.y_music > input').eq(j).val(j+1)
                    $('.y-nest').eq(i).find('.y_music_order').eq(j).text(j+1)
                }
            }
        })

    })

    $(function(){
        //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
        $('form').on('change', 'input[type="file"]', function(e) {
            let file = e.target.files[0],
                reader = new FileReader(),
                $upload_view = $(".y_upload_view")

            if(file.type.indexOf("image") < 0){
                return false;
            }



            reader.onload = (function(file) {
                return function(e) {
                    $(".y_image_file_name").text(file.name)
                    $upload_view.empty()
                    $upload_view.append($('<img>').attr({
                        src: e.target.result,
                        width: "256px",
                        height:"256px",
                        class: "upload_view",
                        title: file.name
                    }))
                }
            })(file)

            reader.readAsDataURL(file)
        })
    })

    $(function(){

        $('.input_number_only').on('input', function(e) {

            let value = $(e.currentTarget).val().substr(0,7);
            value = value
                .replace(/[０-９]/g, function(s) {
                    return String.fromCharCode(s.charCodeAt(0) - 65248);
                })
                .replace(/[^0-9]/g, '');


            if (value.length === 1) {
                if (value.match(/[0]/g)) {
                    $(e.currentTarget).val("")
                } else {
                    $(e.currentTarget).val(Number(value))
                    $(".y_task_price").text(Math.ceil(Number(value)*1.08))
                }
            }else{
                $(e.currentTarget).val(Number(value))
                $(".y_task_price").text(Math.ceil(Number(value)*1.08))
            }



        });

    });

})

