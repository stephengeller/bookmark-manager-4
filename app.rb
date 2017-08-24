ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './models/link'

class BookmarkManager < Sinatra::Base

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :newlink
  end

  post '/links' do
    @links = Link.all
    Link.create(:title=>params[:title], :url=>params[:url])
    erb :links
  end

  run! if app_file == $PROGRAM_NAME
end
