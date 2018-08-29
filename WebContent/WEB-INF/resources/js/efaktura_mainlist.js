  //this variable is a global jQuery var instead of using "$" all the time. Very handy
  var jq = jQuery.noConflict();
  var counterIndex = 0;
  
  
  jq(function() {
	  jq("#from").datepicker({ 
		  dateFormat: 'yymmdd'
	  });
	  jq("#to").datepicker({ 
		  dateFormat: 'yymmdd'
	  });

  });
  
  
  
  //-------------------
  //Datatables jquery
  //-------------------
  //private function
  function filtersInit () {
    jq('#logRecords').DataTable().search(
    		jq('#openOrders_filter').val()
    ).draw();
  }

  jq(document).ready(function() {
    //init table (no ajax, no columns since the payload is already there by means of HTML produced on the back-end)
	var lang = jq('#language').val();
	  
	jq('#logRecords').dataTable( {
	  "jQueryUI": false,
	  "dom": '<"top"f>t<"bottom"lip><"clear">',
	  "order": [[ 4, "desc" ]],
	  "lengthMenu": [ 50, 75, 100],
	  "language": {
   		  "url": getLanguage(lang)
	  },
	  "fnDrawCallback": function( oSettings ) {
		  jq('.dataTables_filter input').addClass("inputText12LightYellow");
	  }
	} );
	//css styling
    //jq('.dataTables_filter input').addClass("inputText12LightYellow");
   
    //event on input field for search
    jq('input.logRecords_filter').on( 'keyup click', function () {
    		filtersInit();
    } );
  } );
  
  
	 


  
  