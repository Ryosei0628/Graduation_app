class ChangeColumnsToIntegerInPosts < ActiveRecord::Migration[7.2]
  def change
    change_column :posts, :wifi, :integer, using: 'wifi::integer'
    change_column :posts, :electricity, :integer, using: 'electricity::integer'
    change_column :posts, :genre, :integer, null: false, using: 'genre::integer'
  end
end
