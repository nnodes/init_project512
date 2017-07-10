$(document).on("turbolinks:load", function() {
  $('.admin-users-datatable').DataTable({
    sPaginationType: "full_numbers",
    bSort: true,
    Processing: true,
    bServerSide: true,
    bDestroy: true,
    sAjaxSource: $('.admin-users-datatable').data('source'),
    oLanguage: {
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
    }
  });
});