class AddAttachmentImageToPages < ActiveRecord::Migration[5.1]
  def self.up
    change_table :pages do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :pages, :image
  end
end
