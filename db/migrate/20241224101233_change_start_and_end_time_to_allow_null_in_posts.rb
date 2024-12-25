class ChangeStartAndEndTimeToAllowNullInPosts < ActiveRecord::Migration[7.2]
  def change
    def change
      change_column :posts, :start_time, :time, null: true
      change_column :posts, :end_time, :time, null: true
    end
  end
end
