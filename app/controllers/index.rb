get '/' do
  @notlog = params[:notlog]
  erb :index
end


get '/profile' do
  erb :profile
end


get '/signup' do
  erb :signup
end

get '/users/:id' do
    @user = User.find(params[:id])
    #regresa todas las urls del usuario
    
    erb :profile
end


post '/profile' do
  puts "INSIDE PROFILE"
  p params[:password]
  p params[:email]

  if params[:password] == nil && params[:email] == nil
    puts "INSIDE IF"
    redirect to ('/')

  else 
    puts "INSIDE ELSE"
    user = User.authenticate(params[:email], params[:password]) 
    p user
    puts " SESSION ID ANTES #{session[:id]}"
    if user != nil
      session[:id] = user.id
      redirect to ("/users/#{user.id}")
    else
      @falla = true
      erb :index
    end
  end
end