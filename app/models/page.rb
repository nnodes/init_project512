class Page < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  validates :url, :title, presence: true
  validates :url, :title, uniqueness: true

  before_save :add_url, unless: :url?

  before_destroy :check_destroyable

  def add_url
    invalids = ['?', ';', '&', '.', '=', ':', '"', "'", '#', '[', ']', '/', '$',
                '+', '@', ')', '(', '*', '!', '¡']
    self.url = title.strip.tr(' áéíóúÁÉÍÓÚñÑ', '-aeiouAEIOUnN')
                    .gsub(Regexp.union(invalids), '')
  end

  def check_destroyable
    destroyable
  end
end
