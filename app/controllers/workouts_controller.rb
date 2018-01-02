class WorkoutsController < ApplicationController

  get '/workouts' do
    authenticate_user
    @workouts = Workout.all
    erb :'workouts/workouts'
  end

  post '/workouts' do
    authenticate_user
    @workout = current_user.workouts.build(name: params[:name], back: params[:back], legs: params[:legs], chest: params[:chest], shoulders: params[:shoulders], triceps: params[:triceps], biceps: params[:biceps], core: params[:core])
    if @workout.save
      flash[:workout_created] = "Your workout has been created!"
      redirect to '/users/#{current_user.id}'
    else
      flash[:message] = @workout.errors.full_messages.join(', ')
      redirect to '/workouts/new'
    end
  end
end
