require 'sinatra/base'
require './lib/bookmarks'
require 'uri' # this module is required for flash[:notice]
require 'sinatra/flash' # this module is required for flash[:notice]

class BookmarkWeb < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb :index
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    flash[:notice] = "You must submit a valid URL" unless Bookmarks.create(url: params['url'], title: params['title'])
    p "Form data submitted to the /bookmarks route!"

    redirect '/bookmarks'
  end

  post '/bookmarks/:id/delete' do
    # p params # e.g. {"id"=>"1"}
    Bookmarks.delete(id: params['id'])
    redirect '/bookmarks'
  end

  post '/bookmarks/:id/edit' do
    # p params
    @bookmark_id = params['id'] # required for form action path

    erb :"bookmarks/edit"
    # redirect('/bookmarks')
  end

  post '/bookmarks/:id/edit/confirm' do
    Bookmarks.update(params['id'], params)

    p params
    p "Form data submitted to the /bookmarks route!"

    redirect '/bookmarks'
  end


  run! if app_file == $0
end
