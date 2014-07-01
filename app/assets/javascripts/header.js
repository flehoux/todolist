$(document).ready(function() {

    $('#header-name').click(function() {
        var $dropdown = $('#dropdown-box');
        if ($dropdown.is(':visible')) {
            $dropdown.slideUp(300);
            $('#dropdown-arrow').removeClass('rotate-down');
        }
        else{
            $dropdown.slideDown(300);
            $('#dropdown-arrow').addClass('rotate-down');
        }
    });
});