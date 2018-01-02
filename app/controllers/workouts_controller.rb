class WorkoutsController < ApplicationController

  get '/workouts' do
    authenticate_user
    @workouts = Workout.all
    erb :'workouts/workouts'
  end

  get '/workouts/new' do
    authenticate_user
    erb :'/workouts/create_workout'
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

  get '/workouts/:id' do
    authenticate_user
    @workout = Workout.find(params[:id])
    erb :'/workouts/show_workout'
  end

  post '/workouts/:id' do
    authenticate_user
    @workout = Workout.find(params[:id])
    if params[:name] == ""
      flash[:workout_name_at_update] = "Your workout must have a name!"
      redirect to 'workouts/#{@workout.id}/edit'
    end
    @workout.update(name: params[:name], back: params[:back], legs: params[:legs], chest: params[:chest], shoulders: params[:shoulders], triceps: params[:triceps], biceps: params[:biceps], core: params[:core])
    flash[:workout_updated] = "Your workout has been updated!"
    redirect to "users/#{current_user.id}"
  end


end
