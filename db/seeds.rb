puts "🌱 Seeding spices..."

User.destroy_all
Exercise.destroy_all
Trainer.destroy_all

#Users

User.create(username: "Matt", password_digest: "password", email: "dayclawtel@gmail.com", age: 29, weight: 173)
User.create(username: "Kimmy", password_digest: "password", email: "kimmy@gmail.com", age: 28, weight: 133)

#Exercises

Exercise.create(exercise_name: "Bicep Curl", video_link: "in7PaeYlhrM", description: "Curls and stuff.")
Exercise.create(exercise_name: "Lunges", video_link: "wrwwXE_x-pQ", description: "Lunges for balance.")
Exercise.create(exercise_name: "Push Ups", video_link: "tWjBnQX3if0", description: "Workout that chest.")
Exercise.create(exercise_name: "Squats", video_link: "QifjltKUMCk", description: "Get low and feel the burn.")
Exercise.create(exercise_name: "Standing overhead dumbbell presses", video_link: "OOe_HrNnQWw", description: "Shoulders get big.")


#Trainer

Trainer.create(trainer_name: "Matt's Trainer")


puts "✅ Done seeding!"