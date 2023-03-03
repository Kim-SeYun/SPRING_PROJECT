$(document).ready(function() {
    $('.title-link').click(function(e) {
        e.preventDefault();
        var preview = $(this).siblings('.content-preview');
        preview.toggle();
    });
});