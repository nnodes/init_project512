class Page < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_attached_file :image,
                    styles: { original: {} },
                    path: ":rails_root/public/images/:style/:id/:filename",
                    url: "/images/:style/:id/:filename"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :title, presence: true
  validates :url, :title, uniqueness: true
end
