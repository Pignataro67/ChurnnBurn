require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "musclesmarinara"
    #register Sinatra::Flash
  end

  get "/" do
    erb :index
  end
