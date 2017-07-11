class Slide < ApplicationRecord
  has_attached_file :image,
                    styles: { original: {},
                              cropped: { processors: [:cropper] } },
                    path: ":rails_root/public/slide_images/:style/:id/:filename",
                    url: "/slide_images/:style/:id/:filename"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_presence_of :image, unless: :video_url?
  validates_presence_of :video_url, unless: :image?, message: 'Debe ingresar una imagen o video'

  before_save :save_youtube_id, if: :video_url?

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  def save_youtube_id
    self.video_id = video_url.split("=").last
  end
end
