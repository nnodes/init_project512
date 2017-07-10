class AddActiveToSlides < ActiveRecord::Migration[5.1]
  def change
    add_column :slides, :active, :boolean
  end
end
