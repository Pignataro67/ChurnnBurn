class CreateWorkouts < ActiveRecord::Migration

  def change
    create_table :workouts do |t|
      t.string :back
      t.string :legs
      t.string :chest
      t.string :shoulders
      t.string :triceps
      t.string :biceps
      t.string :core
      t.integer :user_id
    end
  end
end
