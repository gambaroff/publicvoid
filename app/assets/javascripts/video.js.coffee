# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
(($) ->
  $.event.fix = ((originalFix) ->
    (event) ->
      event = originalFix.apply(this, arguments)

      if event.type.indexOf('drag') == 0 || event.type.indexOf('drop') == 0
        event.dataTransfer = event.originalEvent.dataTransfer

      event

  )($.event.fix)

  $.fn.dropImageReader = (callback) ->
    stopFn = (event) ->
      event.stopPropagation()
      event.preventDefault()

    this.each () ->
      element = this
      $this = $(this)

      $this.bind 'dragenter dragover dragleave', stopFn

      $this.bind 'drop', (event) ->
        stopFn(event)

        Array.prototype.forEach.call event.dataTransfer.files, (file) ->
          imageType = /image.*/
          if !file.type.match(imageType)
            return

          reader = new FileReader()

          reader.onload = (evt) ->
            callback.call(element, file, evt)

          reader.readAsDataURL(file)

)(jQuery)
$(".dragaccept").dropImageReader (file, event) ->
  img = $ "<img/>",
    alt: file.name
    src: event.target.result
    title: file.name

  $(this).append img
