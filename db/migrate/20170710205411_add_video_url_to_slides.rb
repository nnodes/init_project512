class AddVideoUrlToSlides < ActiveRecord::Migration[5.1]
  def change
    add_column :slides, :video_url, :string
    add_column :slides, :video_id, :string
  end
end
