puts "🌱 Seeding spices..."

User.destroy_all
Exercise.destroy_all
Workout.destroy_all

#Users

User.create(name: "Matt", password_digest: "$2a$10$H2xzgSc6iBg7Qp6BDyJ0peE4k4bSYhm7nJiTN7rda6uchD/1Pmg8i", email: "dayclawtel@gmail.com", age: 29, weight: 173)
User.create(name: "Kimmy", password_digest: "$2a$10$8wuwzlpj.F.m9kJBbLJtdecikonfwBj3D3dZj27z72dfNzE5HUNoa", email: "kimmy@gmail.com", age: 28, weight: 133)

#Exercises

Exercise.create(exercise_name: "Bicep Curl", video_link: "in7PaeYlhrM", description: "Curls and stuff.")
Exercise.create(exercise_name: "Lunges", video_link: "wrwwXE_x-pQ", description: "Lunges for balance.")
Exercise.create(exercise_name: "Push Ups", video_link: "tWjBnQX3if0", description: "Workout that chest.")
Exercise.create(exercise_name: "Squats", video_link: "QifjltKUMCk", description: "Get low and feel the burn.")
Exercise.create(exercise_name: "Standing overhead dumbbell presses", video_link: "OOe_HrNnQWw", description: "Shoulders get big.")


#Trainer

Workout.create(exercise_name: "Bicep Curl", sets: 3, reps: 12, weight: 35, user_id: 2, exercise_id: 1)
Workout.create(exercise_name: "Lunges", sets: 3, reps: 12, weight: 100, user_id: 2, exercise_id: 2)
Workout.create(exercise_name: "Push Ups", sets: 2, reps: 6, weight: 15, user_id: 2, exercise_id: 3)
# Workout.create(exercise_name: "Standing overhead dumbbell presses", sets: 2, reps: 6, weight: 20, user_id: 1, exercise_id: 5)

puts "✅ Done seeding!"