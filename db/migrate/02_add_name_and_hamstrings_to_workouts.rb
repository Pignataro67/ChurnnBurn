class AddNameAndHamstringsToWorkouts < ActiveRecord::Migration

  def change
    add_column :workouts, :name, :string
    add_column :workouts, :hamstrings, :string
  end
end
