function translate(object)
{
  $.ajax({
    url: "http://mta/local/ajax.htm?translate=" + $(object).text(),
    success: function(result){
      $(object).text(result);
    }
  });
}

$(document).ready(function(){
  $(".translate").each(function( key, value ) {
    $.ajax({
      url: "http://mta/local/ajax.htm?translate=" + $(value).text(),
      success: function(result){
        $(value).text(result);
      }
    });
  });
});
