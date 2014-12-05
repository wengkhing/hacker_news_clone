class CreateComments <ActiveRecord::Migration
  create_table :comments do |t|
    t.belongs_to :user
    t.belongs_to :post
    t.text :body, null: false
  end
end