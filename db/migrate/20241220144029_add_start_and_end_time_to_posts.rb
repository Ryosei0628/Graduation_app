class AddStartAndEndTimeToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :start_time, :datetime
    add_column :posts, :end_time, :datetime
  end
end
