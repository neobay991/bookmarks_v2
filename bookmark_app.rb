require 'sinatra/base'
require './lib/bookmark'
require './lib/comment'
require './lib/tag'
require './lib/bookmark_tag'
require 'uri' # this module is required for flash[:notice]
require 'sinatra/flash' # this module is required for flash[:notice]

class BookmarkWeb < Sinatra::Base

  # this enables html forms to use DELETE and PATCH methods
  set :method_override, true

  # this line is required for flash[:notice]
  enable :sessions

  # this line is required for flash[:notice]
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

    p "Form data submitted to the /bookmarks route!"

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
    Comment.create(bookmark_id: params['id'], text: params['text'])

    p params
    p "Form data submitted to the /comments route!"

    redirect '/bookmarks'
  end

  get '/bookmarks/:id/tags/new' do
    p params
    @bookmark = Bookmark.find(params['id'])
    erb :"tags/new"
  end

  post '/bookmarks/:id/tags' do
    tag = Tag.create(tag_content: params['tag_content'])
    BookmarkTag.create(bookmark_id: params['id'], tag_id: tag.id)

    p params
    p "Form data submitted to the /tags route!"

    redirect('/bookmarks')
  end

  run! if app_file == $0
end
