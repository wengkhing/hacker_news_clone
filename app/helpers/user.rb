def login?
  if session[:user].nil?
    false
  else
    true
  end
end

def username
  session[:user]
end