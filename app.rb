require 'sinatra/base'
 require 'sinatra/reloader'
require './lib/messages.rb'
class Chitter < Sinatra::Base
  configure :development do
  register Sinatra::Reloader
end
  get '/test' do
    'Test page'
  end

  get '/' do
    erb :screen1
  end
 
  post '/' do
    #p params[:post]
    #p 'before messages'
    @messages = Messages.create(post: params[:post])
    erb :screen1
  end 

  run! if app_file == $0
end
