class ChangeLongitudeToBeNullableInPosts < ActiveRecord::Migration[7.2]
  def change
    change_column_null :posts, :longitude, true
  end
end
