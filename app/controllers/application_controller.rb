require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "musclesmarinara"
    register Sinatra::Flash
  end

    get '/' do
    #flash[:notice] = "Hooray, Flash is working!"
    erb :index
  end

  helpers do

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find(session[:user_id])
  end
end

  private

  def authenticate_user

    if !logged_in?
      redirect to '/login'
    end
  end
end
