class AddHomePageToPages < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :home_page, :boolean, default: true
  end
end
