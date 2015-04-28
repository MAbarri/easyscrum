
/*
 * Editor client script for DB table user
 * Created by http://editor.datatables.net/generator
 */

(function($){

$(document).ready(function() {
	var editor = new $.fn.dataTable.Editor( {
		"ajax": "/api/user",
		"table": "#user",
		"fields": [
			{
				"label": "nom",
				"name": "nom"
			},
			{
				"label": "login",
				"name": "login"
			},
			{
				"label": "pass",
				"name": "pass"
			}
		]
	} );
/*
	$('#user').DataTable( {
		"dom": "Tfrtip",
		"ajax": "/api/user",
		"columns": [
			{
				"data": "nom"
			},
			{
				"data": "login"
			},
			{
				"data": "pass"
			}
		],
		"tableTools": {
			"sRowSelect": "os",
			"aButtons": [
				{ "sExtends": "editor_create", "editor": editor },
				{ "sExtends": "editor_edit",   "editor": editor },
				{ "sExtends": "editor_remove", "editor": editor }
			]
		}
	} );
} );
	*/
	$('#myTable').DataTable( {
	    ajax: '/api/staff',
	    dom:  'Tfrtip',
	    columns: [
	        { data: 'first_name' },
	        { data: 'last_name' },
	        // etc
	    ],
	    tableTools: {
	        sRowSelect: 'os',
	        aButtons: [
	            { sExtends: 'editor_create', editor: editor },
	            { sExtends: 'editor_edit',   editor: editor },
	            { sExtends: 'editor_remove', editor: editor }
	        ]
	    }
	} );
}(jQuery));

