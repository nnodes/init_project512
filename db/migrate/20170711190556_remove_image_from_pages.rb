class RemoveImageFromPages < ActiveRecord::Migration[5.1]
  def change
    remove_column :pages, :image_file_name, :string
    remove_column :pages, :image_content_type, :string
    remove_column :pages, :image_file_size, :integer
    remove_column :pages, :image_updated_at, :datetime
  end
end
