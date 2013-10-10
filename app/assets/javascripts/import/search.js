$(function () {
    $('.datepicker').datepicker({
        dateFormat: "dd-mm-yy",
        regional: 'ru',
        monthNames: ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'],
        monthNamesShort: ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'],
        dayNamesMin: ['Вс', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб'],
        firstDay: 1,
        changeMonth: true,
        altFormat: 'dd MM',
        altField: '.current-date',
        onSelect: function (dateText, inst) {
            console.log(inst);
//            //gets your desired format
//            var altFormat = $(this).datepicker('option', 'altFormat');
//            //get current date in user format
//            var currentDate = $(this).datepicker('getDate');
//            //format from user format to desired format
//            var formatedDate = $.datepicker.formatDate(altFormat, currentDate);
//            //set data-* attribute to formatedDate
//            $('.datepicker').data('altformat', formatedDate);
//            $('.current-date').text(formatedDate);
            $('.date-title').text(dateText);
            $('input[name="[search]start"]').val(dateText);
            $('.date-pick').removeClass('country-focus');
        }

    });
});

$(function () {
    $('.search-link').click(function () {
        $('input[name="[search]min"]').val($(".price-slider").slider("values", 0));
        $('input[name="[search]max"]').val($(".price-slider").slider("values", 1));
        $('.search form').submit();
    });
    $('.date-pick').click(function () {
        $('.datepicker').datepicker('show');
        $('.date-pick').addClass('country-focus');
        $(document).on("click", function (e) {
            if (!$(e.target).closest(".date-pick").size()) {
                $('.date-pick').removeClass('country-focus');
            }
        });
    });
    $('.country-pick').click(function () {
        $('.country-pick').addClass('country-focus');
        $('.countries-select').removeClass('hidden');
        $(document).on("click", function (e) {
            if (!$(e.target).closest(".country-pick").size()) {
                $(".countries-select").addClass("hidden");
                $('.country-pick').removeClass('country-focus');
            }
        });
    });
    $('.countries-select li.btn-link').click(function () {
        var country = $(this).text();
        $('input[name="[search]countries"]').val(country);
        $('.country-title').text(country);
        $('.countries-select').addClass('hidden');
    });
});

$(function () {
    if ($('input[name="[search]countries"]').val() != '') {

        $('.country-title').text($('input[name="[search]countries"]').val());
    }

    if ($('input[name="[search]start"]').val() != '') {
//        var altFormat = $.datepicker('option', 'altFormat');
//        //get current date in user format
//        var currentDate = input[name="[search]start"] ;
//        //format from user format to desired format
//        var formatedDate = $.datepicker.formatDate(altFormat, currentDate);
        $('.date-title').text($('input[name="[search]start"]').val());
    }



});

$(document).ready(function () {
    $(".price-slider").slider({
        range: true,
        min: 0,
        max: 1000,
        values: [ 200, 800 ],
        slide: function (event, ui) {
            $(".price-text").text("$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ]);
        }
    });
    if ($('input[name="[search]min"]').val() != '' && $('input[name="[search]max"]').val() != '') {
        $(".price-slider").slider("values", [$('input[name="[search]min"]').val(), $('input[name="[search]max"]').val()]);
    }
    $(".price-text").text("$" + $(".price-slider").slider("values", 0) +
        " - $" + $(".price-slider").slider("values", 1));
});