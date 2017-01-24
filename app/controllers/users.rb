get '/profile' do
  erb :profile  
end

get '/signup' do
  erb :signup
end

get '/users/:id' do
  @user = User.find(params[:id])
  @tags = Tag.all
  @user_post = @user.posts 
  erb :profile
end

post '/signup' do
  p params
  @user = User.new(name: params[:name], email: params[:email], password: params[:password])
  if @user.save
    @falla = false
    session[:id] = @user.id
    redirect to ("/users/#{@user.id}")
  else
    @falla = true
    erb :signup
  end
end


post '/logout' do
  session.clear
  redirect to ('/')
end