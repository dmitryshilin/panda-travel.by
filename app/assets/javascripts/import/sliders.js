// $('#myTab a').click(function (e) {
//     e.preventDefault();
//     $(this).tab('show');
// })

$(document).ready(function () {
    $('.also-slider').bxSlider({
        slideWidth: 320,
        minSlides: 3,
        maxSlides: 3,
        captions: true,
        controls: false,
        pager: false
    });
});

$(document).ready(function () {
    $('.some-slider').bxSlider({
        slideWidth: 468,
        minSlides: 3,
        maxSlides: 3,
        captions: true,
        controls: false,
        pager: false
    });
});
