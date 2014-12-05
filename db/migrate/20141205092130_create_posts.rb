class CreatePosts <ActiveRecord::Migration
  create_table :posts do |t|
    t.belongs_to :user
    t.string :title, null: false
    t.string :url, null: false

    t.timestamps
  end
end