class ChangeStartAndEndTimeToTimeInPosts < ActiveRecord::Migration[7.2]
  def change
    # datetime から time 型に変更
    change_column :posts, :start_time, :time, null: true
    change_column :posts, :end_time, :time, null: true
  end
end
