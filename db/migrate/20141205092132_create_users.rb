class CreateUsers <ActiveRecord::Migration
  create_table :users do |t|
    t.string :username, null: false, unique: true
    t.string :password, null: false
    t.text :about
    t.integer :karma, default: 0
    t.float :average, default: 0
    t.timestamps
  end
end