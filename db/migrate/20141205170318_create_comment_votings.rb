class CreateCommentVotings < ActiveRecord::Migration
  def change
    create_table :comment_votings do |t|
      t.belongs_to :comment
      t.belongs_to :user
      t.timestamps
    end
  end
end
