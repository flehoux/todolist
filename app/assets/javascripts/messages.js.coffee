$(document).ready ->
  $('#main-content').on 'click', '.message-button', ->
    $this = $(this)
    $container = $this.parent('.message-box')
    $this.unbind('click')
    $container.fadeOut 250, ->
      $container.remove();