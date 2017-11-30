//= require jquery
//= require rails-ujs
//= require bootstrap-sprockets
//= require jasny-bootstrap.min
//= require datatables-bootstrap
//= require dataTables/jquery.dataTables
//= require bootstrap-datepicker
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es.js
//= require turbolinks
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require jquery.validate.localization/messages_es


var defaultDatatable;

$(document).on('turbolinks:before-cache', function(){
  if (defaultDatatable) {
    defaultDatatable.destroy();
  }
});

$(document).on('turbolinks:load', function() {
  defaultDatatable = $('.nn-default-datatable').DataTable({
    aaSorting: [[ 0, 'asc' ]],
    bSort: true,
    bDestroy: true,
    retrieve: true,
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
        sSortAscending:  'Activar para ordenar la columna de manera ascendente',
        sSortDescending: 'Activar para ordenar la columna de manera descendente'
      },
      oPaginate: {
        sFirst: 'Primero',
        sLast: 'Último',
        sNext: 'Siguiente',
        sPrevious: 'Anterior'
      }
    },
    iDisplayLength: 25,
    sPaginationType: 'full_numbers'
  });

  $('.alert' ).delay(2000).fadeOut(3000);

  $('.datepicker').datepicker({
    format: 'dd/mm/yyyy',
    language: 'es'
  });

  $.validator.setDefaults({
    highlight: function (element, errorClass, validClass) {
      if (element.type === "radio") {
        this.findByName(element.name).addClass(errorClass).removeClass(validClass);
      } else {
        $(element).closest('.form-group').removeClass('has-success has-feedback').addClass('has-error has-feedback');
        $(element).closest('.form-group .form-control').after('<span class="glyphicon"></span>')
        $(element).closest('.form-group').find('span.glyphicon').removeClass('glyphicon-ok form-control-feedback').addClass('glyphicon-remove form-control-feedback');
      }
    },
    unhighlight: function (element, errorClass, validClass) {
      if (element.type === "radio") {
        this.findByName(element.name).removeClass(errorClass).addClass(validClass);
      } else {
        $(element).closest('.form-group').removeClass('has-error has-feedback').addClass('has-success has-feedback');
        $(element).closest('.form-group .form-control').after('<span class="glyphicon"></span>')
        $(element).closest('.form-group').find('span.glyphicon').removeClass('glyphicon-remove form-control-feedback').addClass('glyphicon-ok form-control-feedback');
      }
    },
    errorPlacement: function(error, element) {
      error.appendTo($(element).closest('.form-group').find('.nn-msg').addClass('text-danger'));
    }
  });

  jQuery.extend(jQuery.validator.messages, {
    require_from_group: "Debes ingresar al menos {0} de estos campos.",
    accept: 'La extensión del archivo ingresada no es válida'
  });

  $(window).scroll(function(){
    if($(window).scrollTop() <= 200 ){
      $('.home-nav').removeClass('affix');
      $('.home-nav').addClass('affix-top');
    }
    else{
      $('.home-nav').removeClass('affix-top');
      $('.home-nav').addClass('affix');
    }
  });
});
