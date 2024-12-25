class ChangeStartAndEndTimeToNotNullInPosts < ActiveRecord::Migration[7.2]
  def change
        change_column_null :posts, :start_time, false
        change_column_null :posts, :end_time, false  
  end
end
