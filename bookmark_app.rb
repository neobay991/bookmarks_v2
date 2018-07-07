require 'sinatra/base'
require './lib/bookmarks'

class BookmarkWeb < Sinatra::Base

  get '/' do
    'hello world'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb :index
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    Bookmarks.create(url: params['url'])
    # p "Form data submitted to the /bookmarks route!"
    redirect '/bookmarks'
  end





  run! if app_file == $0
end
