require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
also_reload("lib/*.rb")


# store side
get('/') do
  @articles = Article.all
  erb(:index)
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
