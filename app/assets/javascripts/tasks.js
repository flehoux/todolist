$(document).ready(function() {

  $('#c1, #c2, #c3').on('click', '.task-content', function() {
    
    $current = $(this).children('.hidden');

    if($current.is(":visible")) {
      $('.hidden').slideUp(200);
      $(this).parent('.task-row').children('a').children('.previous-cat').hide();
      $(this).parent('.task-row').children('a').children('.next-cat').hide();
    }
    else{
      $('.previous-cat').hide();
      $('.next-cat').hide();
      $('.hidden').slideUp(200);
      $current.slideDown(200);
      $(this).parent('.task-row').children('a').children('.previous-cat').show();
      $(this).parent('.task-row').children('a').children('.next-cat').show();
    }
  });
});