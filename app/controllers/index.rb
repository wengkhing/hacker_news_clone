enable :sessions
set :protection, except: :session_hijacking

get '/' do
    @posts = Post.all
    erb :index
end

get '/profile/:u_id' do
  @user = User.find(params[:u_id])

  erb :profile
end

get '/profile/:id/post' do
end

get '/signin' do
  erb :signin
end

post '/signin' do
  session[:user] = params[:username]
  redirect '/'
end

post '/signup' do
  User.create(params[:user])
  redirect '/signup'
end

get '/signup' do
  erb :signup
end

get '/signout' do
  session[:user] = nil
  redirect '/'
end

get '/comment/:id' do
  @post = Post.find(params[:id])
  erb :comment
end

post '/comment/:id' do
  Comment.create(body: params[:body], post: Post.find(params[:id]), user: User.where(username: session[:user]).first)
  redirect "/comment/#{params[:id]}"
end

get '/upvote/post/:id' do
  post = Post.find(params[:id])
  PostVoting.create(post: post, user: User.where(username: session[:user]).first)
  redirect '/'
end

get '/unvote/post/:id' do
  post = Post.find(params[:id])
  pv = PostVoting.where(post_id: post.id, user_id: User.where(username: session[:user]).first.id).first
  pv.destroy
  redirect '/'
end

get '/upvote/comment/:id' do
  comment = Comment.find(params[:id])
  CommentVoting.create(comment: comment, user: User.where(username: session[:user]).first)
  redirect "/comment/#{params[:id]}"
end
