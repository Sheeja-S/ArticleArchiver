ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)
set(:root, Dir.pwd())
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('./app')

RSpec.configure do |config|
  config.include(Shoulda::Matchers::ActiveModel, type: :model)
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)

  config.after(:each) do
    Article.all.each do |article|
      article.destroy()
    end

    Tag.all.each do |tag|
      tag.destroy()
    end

    User.all.each do |user|
      user.destroy()
    end

    ArticlesUser.all.each do |articles_user|
      articles_user.destroy()
    end

    ArticlesTag.all.each do |articles_tag|
      articles_tag.destroy()
    end

  end
end
