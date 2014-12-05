class CreatePostVotings < ActiveRecord::Migration
  def change
    create_table :post_votings do |t|
      t.belongs_to :post
      t.belongs_to :user
      t.timestamps
    end
  end
end
