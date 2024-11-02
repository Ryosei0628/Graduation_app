class AddQuietLevelToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :quiet_level, :integer, null:false
  end
end
