class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.string :exercise_name
      t.integer :sets
      t.integer :reps
      t.integer :weight
      t.belongs_to :user #foreign key
      t.belongs_to :exercise #foreign key

      t.timestamps null: false
    end
  end
end
