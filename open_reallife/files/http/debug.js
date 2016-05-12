/*function format ( d ) {
    // `d` is the original data object for the row
    if(d.traceback.length==0)
    {
      return "No traceback";
    }
    else {
      var content = '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">';

      for (i = 0; i < d.traceback.length; i++) {
          content += '<tr><td>' + d.traceback[i] + "</td></tr>";
      }
      content += '</table>';

      return content;
    }
}*/

$(document).ready(function() {
  console.log("starting");

    var table = $('#example').DataTable( {
        "ajax": "http://127.0.0.1:22005/open_reallife/call/HTTPGetErrorLog",
        "columns": [
            /*{
                "className":      'details-control',
                "orderable":      false,
                "data":           null,
                "defaultContent": ''
            },*/
            { "data": "level" },
            { "data": "message" },
            { "data": "file" },
            { "data": "line" },
            { "data": "timestamp",
            render: function(data, type, row) {
              var d = new Date(data * 1000);
              return d.toLocaleTimeString() + " " + d.toLocaleDateString();
            } }
        ],
        "order": [[1, 'asc']]
    } );
    /*
    // Add event listener for opening and closing details
    $('#example tbody').on('click', 'td.details-control', function () {
        var tr = $(this).closest('tr');
        var row = table.row( tr );

        if ( row.child.isShown() ) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
        }
        else {
            // Open this row
            row.child( format(row.data()) ).show();
            tr.addClass('shown');
        }
    } );*/
} );
