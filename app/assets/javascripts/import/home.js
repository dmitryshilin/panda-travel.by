$(function(){
      var $container = $('#hits_of_sales');
      $container.imagesLoaded( function() {
          $container.masonry({
              isFitWidth: true,
              columnWidth: 260,
              itemSelector: '.hit-item'
          });
      });
  });

$(function(){
        var $container = $('#articles');
      $container.imagesLoaded( function() {
          $container.masonry({
              isFitWidth: true,
              columnWidth: 260,
              itemSelector: '.art-item'
          });
      });

});
