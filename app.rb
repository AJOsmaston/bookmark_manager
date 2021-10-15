require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'
require './database_connection_setup'
require 'uri'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :home
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    flash[:notice] = "Invalid URL" unless Bookmark.create(
      url: params[:bm_address], title: params[:title]
      )
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(
      id: params[:id], url: params[:bm_address], title: params[:title]
      )
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end
end
