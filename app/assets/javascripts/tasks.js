$(document).ready(function() {

  expandTasks();
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