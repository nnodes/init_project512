module Admin
  class SettingsController < AdminController

    def index
      Setting.load_settings

      @setting = Hash.new
      Setting.integer_accepted_values.each do |setting|
        @setting[setting] = Setting.value(setting)
      end
      Setting.double_accepted_values.each do |setting|
        @setting[setting] = Setting.value(setting)
      end
      Setting.text_accepted_values.each do |setting|
        @setting[setting] = Setting.value(setting)
      end
      Setting.date_accepted_values.each do |setting|
        @setting[setting] = Setting.value(setting)
      end
      respond_to do |format|
        format.html
      end
    end

    def edit
        Setting.load_settings

        @setting = Hash.new
        Setting.integer_accepted_values.each do |setting|
          @setting[setting] = Setting.value(setting)
        end
        Setting.double_accepted_values.each do |setting|
          @setting[setting] = Setting.value(setting)
        end
        Setting.text_accepted_values.each do |setting|
          @setting[setting] = Setting.value(setting)
        end
        Setting.date_accepted_values.each do |setting|
          @setting[setting] = Setting.value(setting)
        end
      end

      def update
        Setting.integer_accepted_values.each do |setting|
          if new_value = params["#{setting}"]
            new_value = new_value.to_i
            if set = Setting.find_by_code(setting)
              if set.number_value != new_value
                set.number_value = new_value
                set.save
              end
            else
              Setting.create(code: setting, number_value: new_value)
            end
          end
        end
        Setting.double_accepted_values.each do |setting|
          if new_value = params["#{setting}"]
            new_value = new_value.sub(",",".").to_d
            if set = Setting.find_by_code(setting)
              if set.number_value != new_value
                set.number_value = new_value
                set.save
              end
            else
              Setting.create(code: setting, number_value: new_value)
            end
          end
        end
        Setting.text_accepted_values.each do |setting|
          if new_value = params["#{setting}"]
            if set = Setting.find_by_code(setting)
              if set.text_value != new_value
                set.text_value = new_value
                set.save
              end
            else
              Setting.create(code: setting, text_value: new_value)
            end
          end
        end
        Setting.date_accepted_values.each do |setting|
          if new_value = params["#{setting}"]
            h = params["#{setting}"]
            year = h[h.keys.find {|k| k.include? "1i"}].to_i
            month = h[h.keys.find {|k| k.include? "2i"}].to_i
            day = h[h.keys.find {|k| k.include? "3i"}].to_i
            hour = h[h.keys.find {|k| k.include? "4i"}].to_i
            min = h[h.keys.find {|k| k.include? "5i"}].to_i
            new_value = DateTime.now.change({ hour: hour, min: min })
            if set = Setting.find_by_code(setting)
              if set.date_value != new_value
                set.date_value = new_value
                set.save
              end
            else
              Setting.create(code: setting, date_value: new_value)
            end
          end
        end


        Setting.load_settings

        respond_to do |format|
          format.html { redirect_to admin_settings_path, notice: "Guardado correctamente" }
        end
      end
  end
end
