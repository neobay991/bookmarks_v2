require 'sinatra/base'
require './lib/bookmarks'

class BookmarkWeb < Sinatra::Base

  get '/' do
    @bookmarks = Bookmarks.new
    erb :index
  end

  get '/server' do
    erb :server
  end

  run! if app_file == $0
end
