function createWindow(template, id)
{
  $("#windows").append(template);
  $("#" + id).dialog();
}
