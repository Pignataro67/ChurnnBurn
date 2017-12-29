class UsersController < ApplicationController

  get '/signup' do
    if !session[:user_id]
      erb :'/users/create_user'
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
      flash[:message] = @user.errors.full_messages.join(',')
      redirect to '/signup'
    end
  end
end
