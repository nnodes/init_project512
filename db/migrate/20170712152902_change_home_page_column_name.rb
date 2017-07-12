class ChangeHomePageColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :pages, :home_page, :destroyable
  end
end
