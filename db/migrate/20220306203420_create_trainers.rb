class CreateTrainers < ActiveRecord::Migration[5.2]
  def change
    create_table :trainers do |t|
      t.string :trainer_name
      t.integer :sets
      t.integer :reps
      t.integer :weight
      t.boolean :false

      t.timestamps null: false
    end
  end
end
