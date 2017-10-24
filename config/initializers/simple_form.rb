# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  # Wrappers are used by the form builder to generate a
  # complete input. You can remove any component from the
  # wrapper, change the order or even add your own to the
  # stack. The options given below are used to wrap the
  # whole input.
  config.error_notification_class = 'alert alert-danger'
  config.button_class = 'btn btn-primary pull-right'
  config.boolean_label_class = nil

  config.wrappers :vertical_form, tag: 'div', class: 'form-group', error_class: 'has-error', success_class: 'has-success' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :icon
    b.optional :glyphicon
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: 'control-label'

    b.use :input, class: 'form-control'
    b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  end

  config.wrappers :vertical_addon, tag: 'div', class: "form-group", error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, class: 'control-label'
    b.wrapper tag: 'div', class: 'input-group' do |ba|
      ba.use :input, class: 'form-control'
    end
    b.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
    b.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
  end

  config.wrappers :vertical_prepend, tag: 'div', class: "form-group", error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, class: 'control-label'
    b.wrapper tag: 'div', class: 'input-group' do |ba|
      ba.use :icon, wrap_with: {tag: 'span', class: 'input-group-addon'}
      ba.use :input, class: 'form-control'
    end
    b.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
    b.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
  end

  config.wrappers :vertical_append, tag: 'div', class: "form-group", error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, class: 'control-label'
    b.wrapper tag: 'div', class: 'input-group' do |ba|
      ba.use :input, class: 'form-control'
      ba.use :icon, wrap_with: {tag: 'span', class: 'input-group-addon'}
    end
    b.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
    b.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
  end

  config.wrappers :vertical_file_input, tag: 'div', class: 'form-group', error_class: 'has-error', success_class: 'has-success' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :readonly
    b.use :label, class: 'control-label'

    b.use :input
    b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  end

  config.wrappers :vertical_boolean, tag: 'div', class: 'form-group', error_class: 'has-error', success_class: 'has-success' do |b|
    b.use :html5
    b.optional :readonly

    b.wrapper tag: 'div', class: 'checkbox' do |ba|
      ba.use :label_input
    end

    b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  end

  config.wrappers :vertical_radio_and_checkboxes, tag: 'div', class: 'form-group', error_class: 'has-error', success_class: 'has-success' do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: 'control-label'
    b.use :input
    b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  end

  config.wrappers :horizontal_form, tag: 'div', class: 'form-group row', error_class: 'has-error', success_class: 'has-success' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :icon
    b.optional :glyphicon
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: 'col-sm-3 control-label'

    b.wrapper tag: 'div', class: 'col-sm-9' do |ba|
      ba.use :input, class: 'form-control'
      ba.use :glyphicon
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block nn-msg form-control-feedback-msg' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :horizontal_addon, tag: 'div', class: "form-group row", error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, class: 'control-label col-sm-3'
    b.wrapper tag: 'div', class: 'col-sm-9' do |ba|
      ba.wrapper tag: 'div', class: 'input-group' do |bb|
        bb.use :input, class: 'form-control'
      end
      ba.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
    end
  end

  config.wrappers :horizontal_prepend, tag: 'div', class: "form-group row", error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, class: 'control-label col-sm-3'
    b.wrapper tag: 'div', class: 'col-sm-9' do |ba|
      ba.wrapper tag: 'div', class: 'input-group' do |bb|
        bb.use :icon, wrap_with: {tag: 'span', class: 'input-group-addon'}
        bb.use :input, class: 'form-control'
      end
      ba.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
    end
  end

  config.wrappers :horizontal_append, tag: 'div', class: "form-group row", error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, class: 'control-label col-sm-3'
    b.wrapper tag: 'div', class: 'col-sm-9' do |ba|
      ba.wrapper tag: 'div', class: 'input-group' do |bb|
        bb.use :input, class: 'form-control'
        bb.use :icon, wrap_with: {tag: 'span', class: 'input-group-addon'}
      end
      ba.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
    end
  end

  config.wrappers :horizontal_file_input, tag: 'div', class: 'form-group row', error_class: 'has-error', success_class: 'has-success' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :readonly
    b.use :label, class: 'col-sm-3 control-label'

    b.wrapper tag: 'div', class: 'col-sm-9' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :horizontal_boolean, tag: 'div', class: 'form-group row', error_class: 'has-error', success_class: 'has-success' do |b|
    b.use :html5
    b.optional :readonly

    b.wrapper tag: 'div', class: 'col-sm-offset-3 col-sm-9' do |wr|
      wr.wrapper tag: 'div', class: 'checkbox' do |ba|
        ba.use :label_input
      end
      wr.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      wr.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :horizontal_radio_and_checkboxes, tag: 'div', class: 'form-group row', error_class: 'has-error', success_class: 'has-success' do |b|
    b.use :html5
    b.optional :readonly

    b.use :label, class: 'col-sm-3 control-label'

    b.wrapper tag: 'div', class: 'col-sm-9' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :inline_form, tag: 'div', class: 'form-group', error_class: 'has-error', success_class: 'has-success' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :icon
    b.optional :glyphicon
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: 'sr-only'

    b.use :input, class: 'form-control'
    b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  end
  config.wrappers :multi_select, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: 'control-label'
    b.wrapper tag: 'div', class: 'form-inline' do |ba|
      ba.use :input, class: 'form-control'
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end
  # Wrappers for forms and inputs using the Bootstrap toolkit.
  # Check the Bootstrap docs (http://getbootstrap.com)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :vertical_form
  config.wrapper_mappings = {
    check_boxes: :vertical_radio_and_checkboxes,
    radio_buttons: :vertical_radio_and_checkboxes,
    file: :vertical_file_input,
    boolean: :vertical_boolean,
    datetime: :multi_select,
    date: :multi_select,
    time: :multi_select
  }
  # Wrappers for forms and inputs using the Bootstrap toolkit.
  # Check the Bootstrap docs (http://getbootstrap.com)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.

  # Define the way to render check boxes / radio buttons with labels.
  # Defaults to :nested for bootstrap config.
  #   inline: input + label
  #   nested: label > input
  config.boolean_style = :nested

  # Method used to tidy up errors. Specify any Rails Array method.
  # :first lists the first message for each field.
  # Use :to_sentence to list all errors for each field.
  # config.error_method = :first

  # Default tag used for error notification helper.
  config.error_notification_tag = :div


  # Tell browsers whether to use the native HTML5 validations (novalidate form option).
  # These validations are enabled in SimpleForm's internal config but disabled by default
  # in this configuration, which is recommended due to some quirks from different browsers.
  # To stop SimpleForm from generating the novalidate option, enabling the HTML5 validations,
  # change this configuration to true.
  config.browser_validations = false
end

# Override file input
# module SimpleForm
#   module Inputs
#     class FileInput < Base
#       def input(wrapper_options = nil)
#         merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
#         template.content_tag(:div, class: 'input-group') do
#           template.content_tag(:span, class: 'input-group-btn') do
#             template.content_tag(:span, class: 'btn btn-primary btn-file btn-add') do
#               raw('Examinar' + @builder.file_field(attribute_name, merged_input_options))
#             end
#           end
#           # template.tag(:input, id: 'nn-image-name', class: 'form-control', type: 'text')
#         end
#       end
#     end
#   end
# end