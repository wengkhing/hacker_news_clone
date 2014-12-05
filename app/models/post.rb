class Post <ActiveRecord::Base
  has_many :comments
  belongs_to :user
  has_many :post_votings

  validates :title, presence: true
  validates :url, presence: true
end