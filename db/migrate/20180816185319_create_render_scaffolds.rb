class CreateRenderScaffolds < ActiveRecord::Migration[5.1]
  def change
    create_table :render_scaffolds do |t|
      t.string :titulo
      t.string :contenido
      t.integer :user_id

      t.timestamps
    end
  end
end
