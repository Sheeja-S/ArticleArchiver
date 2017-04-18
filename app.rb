require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
also_reload("lib/*.rb")

configure do
  enable :sessions unless test?
  set :session_secret, "jesus"
end

get('/') do
  @articles = Article.all
  erb(:index)
  erb(:home)
end

get '/registrations/signup' do
  erb :'/signup'
end

post ('/registrations') do
  @user = User.create(:name => params[:name], :email => params[:email], :password => params[:password])
  if @user.valid?
    @signup_success = true
    redirect "/login"
  else
    erb (:signup_error)
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
      erb (:logon_error)
  end
end

get ('/user/home') do
  @user = User.find(session[:user_id])
  erb(:users_home)
end

get('/search') do
  @articles = Article.all
if params[:search]
  @articles = Article.search(params[:search])
else
  @articles = Article.all
end
  erb(:results)
end

post("/articles") do
  title = params.fetch("title")
  article = Article.new({:title => title, :link => "placeholder", :shared_by => "placeholder", :like => 0, :id => nil})
  article.save()
  redirect("/")
end

# sign up form for log in
get("/sign_up_form") do
  erb(:sign_up_form)
end

# the main page where search and list of all bookmark are shown
get('/main') do
  erb(:main)
end

# route to here after a successful sign up as a new user
get('/sign_up_form/success') do
  erb(:success)
end

#search method
get('/search') do
  erb(:main)
end

#access tag from the nav bar
get('/tags/:id') do
  erb(:tag)
end

#after enter the book mark
get('/bookmark') do
  redirect back
end

# access favorite from the nav bar
get('/favorites/:id') do
  erb(:favorite)
end
