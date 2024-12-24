class AddStartAndEndTimeToPosts < ActiveRecord::Migration[7.2]
  def up
    add_column :posts, :start_time, :datetime
    add_column :posts, :end_time, :datetime

    Post.reset_column_information

    Post.find_each do |post|
      if post.start_hour && post.start_minute && post.end_hour && post.end_minute
        post.update(
          start_time: Time.zone.parse("#{post.start_hour}:#{post.start_minute}"),
          end_time: Time.zone.parse("#{post.end_hour}:#{post.end_minute}")
        )
      end
    end
  end

  def down
    remove_column :posts, :start_time
    remove_column :posts, :end_time
  end
end
