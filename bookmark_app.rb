require 'sinatra/base'
require './lib/bookmarks'

class BookmarkWeb < Sinatra::Base

  get '/' do
    'hello world'
    p ENV['RACK_ENV']
  end

  get '/bookmarks' do
    p ENV['RACK_ENV']
    @bookmarks = Bookmarks.all

    erb :index
  end

  # useful to check which env is running
  get '/server' do
    p ENV['RACK_ENV']
    
  end


  run! if app_file == $0
end
