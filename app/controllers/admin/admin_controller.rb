module Admin
  class AdminController < ApplicationController
    layout 'admin/application'

    private

    def is_number?(value)
      true if Float(value) rescue false
    end

    def image_edit(object)
      object[:crop_x] && is_number?(object[:crop_x]) && !object[:image]
    end
  end
end
