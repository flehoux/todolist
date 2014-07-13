$(document).ready(function() {

  expandTasks();
  removeLinks();
  addLinks();
});

// Expands a task on click
function expandTasks() {
  $('#column1, #column2, #column3').on('click', '.task-content', function() {
    
    $hidden = $(this).children('.hidden');

    // Click on already expanded task
    if($hidden.is(":visible")) {
      $('.hidden').slideUp(200);
    }
    // Click on another one
    else{
      $('.hidden').slideUp(200);
      $hidden.slideDown(200);
    }
  });
}

function removeLinks() {
  $('.form-inputs').on('click', '.link-remove', function() {
    $(this).prev("input[type=hidden]").val("1");
    $(this).closest(".action-row").fadeOut(150);
  });
}

function addLinks() {
  $('.small-text').on('click', '.link-add', function() {
    if ($('.link-remove:visible').length < 3) {
      association = $(this).data("association");
      content = $(this).data("fields");

      var new_id = new Date().getTime();
      var regexp = new RegExp("new_" + association, "g")
      $(this).parent().before(content.replace(regexp, new_id));
    };
  });
}