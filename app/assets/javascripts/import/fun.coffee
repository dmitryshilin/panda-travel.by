$doc = $(document)

$ ->
  setOnAjaxRemote()

  $doc.on "click", ".b-modal", ->
    sendModal($(this).attr("href"))
    false

  $doc.on "pageshow", ->
    log 1
    Gmaps.loadMaps()


@sendModal = (url) ->
  $ajax_modal = $("#ajax-modal")
  $.ajax
    url: url
    method: "get"
    success: (data) ->
      $ajax_modal.html data
      $ajax_modal.modal()
    beforeSend: (data) ->
    complete: (data) ->
      Gmaps.triggerOldOnload()
      Gmaps.loadMaps()
    error: (data) ->
      console.log "Error send modal"
  false


@setOnAjaxRemote = () ->
  $doc
  .on "ajax:beforeSend", "form[data-remote='true']", (evt, data, status, xhr) ->
    $form = $(this)

  .on "ajax:success", "form[data-remote='true']", (evt, data, status, xhr) ->
    $form = $(this)
    $form.find(".form-inputs").hide()
    $form.find(".order-submit").hide()
    $form.find(".alert").addClass("alert-success").text(data.success).removeClass("hide")

  .on "ajax:complete", "form[data-remote='true']", (evt, data, status, xhr) ->
    $form = $(this)

  .on "ajax:error", "form[data-remote='true']", (evt, data, status, xhr) ->
    $form = $(this)
    $form.find(".alert").addClass("alert-danger").text(data).removeClass("hide")
