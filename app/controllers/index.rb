get '/' do
  @notlog = params[:notlog]
  erb :index
end

get '/signup' do
  erb :signup
end