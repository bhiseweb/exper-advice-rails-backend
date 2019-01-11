class RenameOldTableToNewTable < ActiveRecord::Migration[5.2]
  def change
    remove_index :posts_tags, :post_id
    remove_index :posts_tags, :tag_id
    rename_table :posts_tags, :post_tags
    add_index :post_tags, :post_id
    add_index :post_tags, :tag_id
  end
end
