class UsersController < ApplicationController

  get '/users/:id' do
    authenticate_user
    @user = User.find(params[:id])
    if @user && @user == current_user
      erb :'users/show'
    else
      redirect '/workouts'
    end
  end

  get '/signup' do
    if !session[:user_id]
      erb :'users/create_user'
    else
      redirect to '/workouts'
    end
  end

  post '/signup' do
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect '/workouts'
    else
      flash[:message] = @user.errors.full_messages.join(', ')
      redirect to '/signup'
    end
  end

  get '/login' do
    if !session[:user_id]
      erb :'users/login'
    else
      redirect '/workouts'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/workouts'
    else
      flash[:message] = "Sorry, that Username/password does not match any of our records!"
      redirect to '/signup'
    end
  end

  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      flash[:message] = "You are now logged out."
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end
