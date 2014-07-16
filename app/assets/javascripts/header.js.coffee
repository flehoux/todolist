$(document).ready ->
  $('#drop-button').click ->
    $dropdown = $('#header-nav')
    if $dropdown.is ':visible'
      $dropdown.slideUp 300
    else
      $dropdown.slideDown 300