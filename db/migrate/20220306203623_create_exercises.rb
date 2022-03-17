class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :exercise_name
      t.string :video_link
      t.string :description
      t.belongs_to :trainer #foreign key
      t.belongs_to :user #foreign key

      t.timestamps null: false
    end
  end
end
