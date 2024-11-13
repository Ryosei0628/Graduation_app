class RenameLongitudeToLongtitudeInPosts < ActiveRecord::Migration[7.2]
  def change
    rename_column :posts, :longitude, :longtitude
  end
end
