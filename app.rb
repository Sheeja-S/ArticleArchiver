require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
also_reload("lib/*.rb")


# log in page
get('/') do
  erb(:index)
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
