class CreateSlides < ActiveRecord::Migration[5.1]
  def change
    create_table :slides do |t|
      t.string :title
      t.string :caption

      t.timestamps
    end
  end
end
