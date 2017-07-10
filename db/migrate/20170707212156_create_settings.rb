class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.string :code
      t.decimal :number_value
      t.text :text_value
      t.datetime :date_value

      t.timestamps
    end
  end
end
