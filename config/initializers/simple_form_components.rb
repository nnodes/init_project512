module SimpleForm
  module Components
    module Icons
      def glyphicon(wrapper_options = nil)
        return glyphicon_class unless options[:glyphicon].nil?
      end

      def glyphicon_class
        template.content_tag(
          :i, '', class: 'glyphicon glyphicon-' + options[:glyphicon]
        )
      end

      def icon(wrapper_options = nil)
        return icon_class unless options[:icon].nil?
      end

      def icon_class
        template.content_tag(:i, '', class: options[:icon])
      end
    end
  end
end

SimpleForm::Inputs::Base.send(:include, SimpleForm::Components::Icons)