class Slide < ApplicationRecord
  has_attached_file :image,
                    styles: { original: {} },
                    path: ":rails_root/public/slide_images/:style/:id/:filename",
                    url: "/slide_images/:style/:id/:filename"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
