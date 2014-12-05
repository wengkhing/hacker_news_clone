class User <ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :comment_votings
  has_many :post_votings

  validates :username, uniqueness: true, presence: true
  validates :password, presence: true
end