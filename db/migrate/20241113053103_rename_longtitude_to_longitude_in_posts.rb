class RenameLongtitudeToLongitudeInPosts < ActiveRecord::Migration[7.2]
  def change
    rename_column :posts, :longtitude, :longitude
  end
end
