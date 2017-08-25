ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

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
    link = Link.new(title: params[:title], url: params[:url])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    @links = Link.all
    redirect to 'links'
  end

  get '/tags/:name' do
    @tag_name = params[:name]
    @links = Link.all
    erb :tag
  end

  run! if app_file == $PROGRAM_NAME
end
