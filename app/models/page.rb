class Page < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  validates :title, presence: true
  validates :url, :title, uniqueness: true

  before_save :add_url, unless: :url?

  def add_url
    invalids = ['?', ';', '&', '.', '=', ':', '"', "'", '#']
    self.url = title.strip.tr(' áéíóúÁÉÍÓÚ', '-aeiouAEIOU')
                    .gsub(Regexp.union(invalids), '')
  end
end
