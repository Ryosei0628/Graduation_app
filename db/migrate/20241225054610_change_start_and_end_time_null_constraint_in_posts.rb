class ChangeStartAndEndTimeNullConstraintInPosts < ActiveRecord::Migration[7.2]
  def change
    change_column_null :posts, :start_time, true
    change_column_null :posts, :end_time, true
  end
end
