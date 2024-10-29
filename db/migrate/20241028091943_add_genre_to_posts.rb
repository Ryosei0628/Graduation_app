class AddGenreToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :genre, :string, null: false
  end
end
