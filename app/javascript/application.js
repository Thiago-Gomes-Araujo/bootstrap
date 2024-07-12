$(document).ready(function() {
  $('.text_summary').on('input', function() {
    var currentLength = $(this).val().length;
    $('#current').text(currentLength);

    // Adicionar a classe 'text-danger' se exceder o limite
    if (currentLength > maxLength) {
      $('#current').addClass('text-danger');
    } else {
      $('#current').removeClass('text-danger');
    }
  });
});
