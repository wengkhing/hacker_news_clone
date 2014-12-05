require 'faker'

if User.all.count == 0
  20.times do
    User.create(username: Faker::Internet.user_name, password: SecureRandom.urlsafe_base64(6), about: Faker::Lorem.paragraph)
  end
end

if Post.all.count == 0
  User.all.each do |u|
    (1 + rand(3)).times do
      Post.create(user: u, title: Faker::Lorem.sentence, url: Faker::Internet.url)
    end
  end
end

if Comment.all.count == 0
  Post.all.each do |p|
    (rand(11)).times do
      Comment.create(user: User.find(1+ rand(User.count)), post: p, body: Faker::Lorem.paragraph)
    end
  end
end