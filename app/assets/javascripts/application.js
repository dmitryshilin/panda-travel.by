// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.datepicker
//= require jquery.ui.slider
//= require_tree ./import


// $('#myTab a').click(function (e) {
//     e.preventDefault();
//     $(this).tab('show');
// })

$(document).ready(function(){

    $('.also-slider').bxSlider({
        slideWidth: 320,
        minSlides: 3,
        maxSlides: 3,
        captions: true,
        controls: false,
        pager: false
    });
});


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
        }

    });
});

$(function () {
    $('.search-link').click(function () {
        $('.search form').submit();
    });
    $('.date-pick').click(function () {
        $('.datepicker').datepicker('show');
    });
    $('.country-pick').click(function () {
        $('.countries-select').removeClass('hidden');
        $(document).on("click", function(e) {
        if (!$(e.target).closest(".country-pick").size()) {
            return $(".countries-select").addClass("hidden");
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
//    $(document).on("click", function(e) {
//        if (!$(e.target).closest(".countries-select").size()) {
//            return $(".countries-select").removeClass("hidden");
//        }
//    });
});

$(document).ready(function(){
    $('.some-slider').bxSlider({
        slideWidth: 468,
        minSlides: 3,
        maxSlides: 3,
        captions: true,
        controls: false,
        pager: false
    });
});
