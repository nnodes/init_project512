class AddOrderToSlides < ActiveRecord::Migration[5.1]
  def change
    add_column :slides, :position, :integer
  end
end
