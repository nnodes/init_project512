module Paperclip
  class Cropper < Thumbnail
    def initialize(file, options = {}, attachment = nil)
      super
      if target.crop_w && target.crop_x
        @current_geometry.width  = target.crop_w
        @current_geometry.height = target.crop_h
      end
    end

    def target
      @attachment.instance
    end

    def transformation_command
      # call crop processing only if user inputs are there
      if target.crop_w && target.crop_x
        crop_command = [
          "-crop",
          "#{target.crop_w}x" \
            "#{target.crop_h}+" \
            "#{target.crop_x}+" \
            "#{target.crop_y}",
          "+repage"
        ]
        crop_command + super
      else
        super
      end
    end
  end
end
