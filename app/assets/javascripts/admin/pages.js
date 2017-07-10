//= require ckeditor/init

var root = location.origin;

ready = function() {
    $('.ckeditor-form').each(function() {
        CKEDITOR.replace( $(this).attr('id'),{
          filebrowserImageBrowseUrl: root + "/ckeditor/pictures",
          filebrowserImageUploadUrl: root + "/ckeditor/pictures",
          filebrowserBrowseUrl: root + '/ckeditor/attachment_files',
          filebrowserUploadUrl: root + '/ckeditor/attachment_files',
          allowedContent: true,
          extraAllowedContent: 'p(*)[*]{*};div(*)[*]{*};li(*)[*]{*};ul(*)[*]{*}',
          toolbar: [
                    	{ name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [ 'Source' ] },
                    	{ name: 'clipboard', groups: [ 'clipboard', 'undo' ], items: [ 'Cut', 'Copy', 'Paste','-', 'Undo', 'Redo' ] },
                    	{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ], items: [ 'Find', 'Replace', '-', 'SelectAll', '-', 'Scayt' ] },
                    	{ name: 'forms', items: [ 'Form', 'Checkbox', 'Radio', 'Select', 'Button', 'ImageButton' ] },
                    	'/',
                    	{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript' ] },
                    	{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ] },
                    	{ name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
                      '/',
                    	{ name: 'insert', items: [ 'Image', 'Smiley', 'Table', 'HorizontalRule', 'SpecialChar' ] },
                    	{ name: 'styles', items: [ 'Styles', 'Format'] },
                    	{ name: 'colors', items: [ 'TextColor', 'BGColor' ] },
                    	{ name: 'others', items: [ '-' ] },
                    	{ name: 'about', items: [ 'About' ] }
                    ],
        removeDialogTabs: 'image:Link;image:advanced;link:advanced',
      });
    });
};

$(document).on('turbolinks:load', ready)
