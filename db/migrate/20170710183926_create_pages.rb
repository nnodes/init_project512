class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :content
      t.boolean :active
      t.string :url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
