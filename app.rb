require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
also_reload("lib/*.rb")

configure do
  enable :sessions unless test?
  set :session_secret, "jesus"
end

get('/') do
  erb(:home)
end

get '/registrations/signup' do
  erb :'/signup'
end

post ('/registrations') do
  user = User.create(:name => params[:name], :email => params[:email], :password => params[:password])
  if user.valid?
    redirect "/login"
  else
    redirect "/failure"
  end
end

get '/sessions/logout' do
  session.clear
  redirect '/'
end

get '/login' do
  erb (:login)
end

post "/login" do
  user = User.find_by(:email => params[:email])
  if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/user/home"
  else
      redirect "/failure"
  end
end

get ('/user/home') do
  @user = User.find(session[:user_id])
  erb(:users_home)
end

get ('/failure') do
  erb (:failure)
end
