class Page < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_attached_file :image,
                    styles: { original: {},
                              cropped: { processors: [:cropper] } },
                    path: ":rails_root/public/images/:style/:id/:filename",
                    url: "/images/:style/:id/:filename"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :title, presence: true
  validates :url, :title, uniqueness: true

  before_save :add_url, unless: :url?

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  def add_url
    invalids = ['?', ';', '&', '.', '=', ':', '"', "'", '#']
    self.url = title.strip.tr(' áéíóúÁÉÍÓÚ', '-aeiouAEIOU')
                    .gsub(Regexp.union(invalids), '')
  end
end
