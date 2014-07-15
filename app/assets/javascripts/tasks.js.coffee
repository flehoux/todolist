$(document).ready ->
  expandTasks()
  removeLinks()
  addLinks()
  return


# Expands a task on click
expandTasks = ->
  $('#column1, #column2, #column3').on 'click', '.task-content', ->
    $hidden = $(this).children('.hidden')

    if $hidden.is(':visible')
      $('.hidden').slideUp 200
    else
      $('.hidden').slideUp 200
      $hidden.slideDown 200

# Remove link field from task form
removeLinks = ->
  $('.form-inputs').on 'click', '.link-remove', ->
    $(this).prev("input[type=hidden]").val("1")
    $(this).closest(".action-row").fadeOut(150)

# Add link field to task form
addLinks = ->
  $('.small-text').on 'click', '.link-add', ->
    if $('.link-remove:visible').length < 3
      association = $(this).data("association")
      content = $(this).data("fields")

      new_id = new Date().getTime()
      regexp = new RegExp("new_" + association, "g")
      $(this).parent().before(content.replace(regexp, new_id))