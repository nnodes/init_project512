class EnableUnaccentExtension < ActiveRecord::Migration[5.1]
  def change
    execute 'create extension unaccent'
  end
end
