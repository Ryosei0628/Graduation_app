class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :location_name, null: false
      t.string :address, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.string :start_hour, null: true
      t.string :start_minute, null: true
      t.string :end_hour, null: true
      t.string :end_minute, null: true
      t.text :description, null: false
      t.string :wifi
      t.string :electricity
      t.string :site_url
      t.references :user, foreign_key: true


      t.timestamps
    end
  end
end
