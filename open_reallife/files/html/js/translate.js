function translate(value)
{
    var text = $(value).text();

    if($(value).is("input"))
    {
      if($(value).attr("placeholder"))
      {
        text = $(value).attr("placeholder");
      }
      else {
        text = $(value).attr("value");
      }
    }

    $.ajax({
      url: "http://mta/local/ajax.htm?translate=" + text,
      success: function(result){
        if($(value).is("input"))
        {
          if($(value).attr("placeholder"))
          {
            $(value).attr("placeholder", result);
          }
          else {
            $(value).attr("value", result);
          }
        }
        else {
          $(value).text(result);
        }
      }
    });
}

$(document).ready(function(){
  $(".translate").each(function( key, value ) {
    translate(value);
  });
});
