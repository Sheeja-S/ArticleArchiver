require 'sinatra/base'

module SlackJesusbot
  class Web < Sinatra::Base
    get '/' do
      'Math is good for you.'
    end
  end
end
