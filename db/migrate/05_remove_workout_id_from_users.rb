class RemoveWorkoutIdFromUsers < ActiveRecord::Migration

  def change
    remove_column :users, :workout_id, :integer
  end
end
