//= require jquery
//= require rails-ujs
//= require bootstrap-sprockets
//= require jasny-bootstrap.min
//= require dataTables/jquery.dataTables
//= require bootstrap-datepicker
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es.js
//= require turbolinks

$(document).on("turbolinks:load", function() {
  $('.default-datatable').dataTable({
    "aaSorting": [[ 0, "asc" ]],
    "bSort": true,
    "oLanguage": {
      "sProcessing":     "Procesando...",
      "sLengthMenu":     "Registros por página : _MENU_",
      "sZeroRecords":    "No se encontraron resultados",
      "sEmptyTable":     "Ningún dato disponible en esta tabla",
      "sInfo":           "Registros del _START_ al _END_ de un total de _TOTAL_ registros",
      "sInfoEmpty":      "Registros del 0 al 0 de un total de 0 registros",
      "sInfoFiltered":   "",
      "sInfoPostFix":    "",
      "sSearch":         "Buscador : ",
      "sUrl":            "",
      "sInfoThousands":  ",",
      "sLoadingRecords": "Cargando...",
      "oAria": {
        "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
      },
      "oPaginate": {
        "sFirst": "Primero",
        "sLast": "Último",
        "sNext": "Siguiente",
        "sPrevious": "Anterior"
      }
    },
    "iDisplayLength": 25,
    "sPaginationType": "full_numbers"
  });

  $('.datepicker').datepicker({
    format: 'dd/mm/yyyy',
    language: 'es'
  });
});
