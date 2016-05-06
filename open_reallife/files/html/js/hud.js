function updateRadarPosition(x, y, rotation)
{
  var mapX = 3072;
  var mapY = 3072;
  var sizeX = 250;
  var sizeY = 250;
  var border = 10;
  var mapSize = 2940;

  x = x + mapSize;
  y = (mapSize*2) - (y + mapSize);

  var radarX = mapX * (x / (mapSize*2));
  var radarY = mapY * (y / (mapSize*2));
/*
  $(".radar").css('left', sizeX/2 + mapX+(-1*mapX+10) +'px');
  $(".radar").css('bottom', sizeY/2 + mapY-(mapY+10) +'px');
  $(".radar").css('clip', 'rect('+ (radarX - sizeX / 2) +'px, '+ (radarX + sizeX / 2) +'px, '+ (radarY + sizeY / 2) +'px, '+ (radarY - sizeY / 2) +'px)')
*/

  //$("#player").css({left: -1*(radarX), top: -1*(radarY)});

  //$("#radar").css({left: 100, top: 100});
  //$("#player").css({left: (sizeX / 2 - 64 / 2), top: (sizeY / 2 - 64 / 2)});
  //$("#player").css({left: (sizeX / 2 - 64 / 2), top: (sizeY / 2 - 64 / 2)});
  /*
  $("#player").animate({
                '-webkit-transform': 'rotate(' + rotation + 'deg)',
                '-moz-transform': 'rotate(' + rotation + 'deg)',
                '-ms-transform': 'rotate(' + rotation + 'deg)',
                '-o-transform': 'rotate(' + rotation + 'deg)',
                'transform': 'rotate(' + rotation + 'deg)',
            }, 100);
  console.log(rotation);*/


  $("#player").css('-webkit-transform','rotate(' + rotation + 'deg)');
  $("#player").css('-moz-transform','rotate(' + rotation + 'deg)');
  $("#player").css('transform','rotate(' + rotation + 'deg)');


  $("#map").animate({
    left: -1*(radarX - sizeX / 2),
    top: -1*((radarY - sizeY / 2))
  }, 100);


}
