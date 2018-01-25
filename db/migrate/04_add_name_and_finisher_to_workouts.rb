class AddNameAndFinisherToWorkouts < ActiveRecord::Migration

  def change
    add_column :workouts, :namee, :string
    add_column :workouts, :finisher, :string
  end
end
