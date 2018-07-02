require 'sinatra/base'


class BookmarkWeb < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/server' do
    erb :server
  end

  run! if app_file == $0
end
