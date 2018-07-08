require 'sinatra/base'
require './lib/bookmark'
require './lib/comment'
require 'uri' # this module is required for flash[:notice]
require 'sinatra/flash' # this module is required for flash[:notice]

class BookmarkWeb < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    flash[:notice] = "You must submit a valid URL" unless Bookmark.create(url: params['url'], title: params['title'])
    p "Form data submitted to the /Bookmark route!"

    redirect '/bookmarks'
  end

  post '/bookmarks/:id/delete' do
    # p params # e.g. {"id"=>"1"}
    Bookmark.delete(id: params['id'])
    redirect '/bookmarks'
  end

  post '/bookmarks/:id/edit' do
    # p params
    @bookmark_id = params['id'] # required for form action path
    @bookmark = Bookmark.find(params['id'])
    erb :"bookmarks/edit"
    # redirect('/Bookmark')
  end

  post '/bookmarks/:id/edit/confirm' do
    Bookmark.update(params['id'], params)

    p params
    p "Form data submitted to the /bookmarks route!"

    redirect '/bookmarks'
  end

  get '/bookmarks/:id/comments/new' do
    p params
    @bookmark = Bookmark.find(params['id'])
    erb :"comments/new"
  end

  post '/bookmarks/:id/comments/confirm' do
    p params

    Comment.create(bookmark_id: params['id'], text: params['text'])

    p "Form data submitted to the /comments route!"

    redirect '/bookmarks'
  end


  run! if app_file == $0
end
