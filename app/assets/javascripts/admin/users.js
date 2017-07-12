var adminUsersDatatable;

$(document).on('turbolinks:before-cache', function(){
  if (adminUsersDatatable.length == 1) {
    adminUsersDatatable.fnDestroy();
  }
});

$(document).on('turbolinks:load', function() {
  $('.date-filter').on('change', function(){
    adminUsersDatatable.draw();
  });


  adminUsersDatatable = $('.admin-users-datatable').DataTable({
    sPaginationType: 'full_numbers',
    bSort: true,
    Processing: true,
    bServerSide: true,
    bDestroy: true,
    sAjaxSource: $('.admin-users-datatable').data('source'),
    fnServerData: function (sSource, aoData, fnCallback){
       start_date = $('#f_start_date').val()
       if(start_date != null){
        aoData.push({'name': 'f_start_date', 'value': start_date});
       }
       end_date = $('#f_end_date').val()
       if(end_date != null){
        aoData.push({'name': 'f_end_date', 'value': end_date});
       }
       $.getJSON(sSource, aoData, function(json){
        fnCallback(json);
       });
    },
    aoColumnDefs: [
      {
        bSortable: false,
        aTargets: [5]
      }
    ],
    oLanguage: {
      sProcessing:     'Procesando...',
      sLengthMenu:     'Registros por página : _MENU_',
      sZeroRecords:    'No se encontraron resultados',
      sEmptyTable:     'Ningún dato disponible en esta tabla',
      sInfo:           'Registros del _START_ al _END_ de un total de _TOTAL_ registros',
      sInfoEmpty:      'Registros del 0 al 0 de un total de 0 registros',
      sInfoFiltered:   '',
      sInfoPostFix:    '',
      sSearch:         'Buscador : ',
      sUrl:            '',
      sInfoThousands:  ',',
      sLoadingRecords: 'Cargando...',
      oAria: {
        sSortAscending:  ': Activar para ordenar la columna de manera ascendente',
        sSortDescending: ': Activar para ordenar la columna de manera descendente'
      },
      oPaginate: {
        sFirst: 'Primero',
        sLast: 'Último',
        sNext: 'Siguiente',
        sPrevious: 'Anterior'
      }
    }
  });
});