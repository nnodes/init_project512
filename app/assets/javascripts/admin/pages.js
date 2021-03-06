$(document).on("turbolinks:load", function() {
  $('#page_title').on('keyup', function(){
    var invalids = {' ': '-', 'á': 'a','é': 'e','í': 'i','ó': 'o','ú': 'u',
                    'Á': 'A','É': 'E','Í': 'I','Ó': 'O','Ú': 'U','ñ': 'n',
                    'Ñ': 'N', 'Ç': 'C', 'ç': 'c' }
    var url = $(this).val().replace(/[`~!@#$%^&*()_|+\-=?;:'",.<>¿¡\{\}\[\]\\\/]/gi, '');
    var re = new RegExp(Object.keys(invalids).join("|"),"gi");
    url = url.replace(re, function(matched){
      return invalids[matched.toLowerCase()];
    });
    var parseUrl = encodeURIComponent(url);
    $("#page_url").val(parseUrl);
  });

  $("form").validate({
    rules: {
      'page[title]': {
        required: true,
      },
      'page[url]': {
        required: true,
        url: false
      }
    }
  });
});
