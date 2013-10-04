$doc = $(document)
#addSlider = ->
  # перезагружаю карту при нажатии на табу
  $("#map-tab").on "click", ->
    $("#tour-map").css("display", "block")
    # google.maps.event.trigger map, "resize"
    Gmaps.loadMaps()