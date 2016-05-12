function updateRadarPosition(x, y, rotation)
{
  var mapX = 3072;
  var mapY = 3072;
  var sizeX = 250;
  var sizeY = 250;
  var border = 10;
  var mapSize = 2950;

  x = x + mapSize;
  y = (mapSize*2) - (y + mapSize);

  var radarX = mapX * (x / (mapSize*2));
  var radarY = mapY * (y / (mapSize*2));

  $("#player").css('transform','rotate(' + rotation + 'deg)');

  $("#map").animate({
    left: -1*(radarX - sizeX / 2),
    top: -1*((radarY - sizeY / 2))
  }, 100);
}

function updateLoginFrameSize()
{
  if($("#login").contents().get(0).location.href=="http://mta/open_reallife/files/html/login.html")
  {
    $("#login").css("height", "365px");
  }
  else if($("#login").contents().get(0).location.href=="http://mta/open_reallife/files/html/register.html") {
    $("#login").css("height", "515px");
  }
  else{
    $("#login").contents().get(0).location.href = "http://mta/open_reallife/files/html/login.html";
    $("#login").css("height", "365px");
  }
}
