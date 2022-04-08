require "pry"

class WorkoutsController < ApplicationController

  # GET: /workouts
  get "/workouts" do
    Workout.all.to_json
  end

  # POST: /workouts
  post "/workouts/:user_id" do
    @current_user = User.find_by(params[:user_id])
    @workout = Workout.create(
      exercise_id: (params[:exercise_id]), 
      user_id: (params[:user_id]),
      exercise_name: (params[:exercise_name]),
      sets: (params[:sets]),
      reps: (params[:reps]),
      weight: (params[:weight])).to_json
 
      #   binding.pry

      #   @workout.destroy
      
  end

  # GET: /workouts/5 
  get "/workouts/:user_id" do
    @current_user = User.find_by(params[:user_id])
    if @current_user
      Workout.where(user_id: params[:user_id]).to_json
    else
      {errors: "Record not found with id#{params['id']}"}.to_json
    end
  end

  # PATCH: /workouts/5
  patch "/workouts/:id" do
    # find_workout
    Workout.where(id: params[:id]).update(params)
    

    # if @workout 
    #   @workout.update(params)
    #   binding.pry

      serialized_workout
    # elsif !@workout
    #   {errors: "Record not found with id #{params['id']}"}.to_json
    # else
    #   {errors: @workout.errors.full_messages.to_sentence}.to_json
    # end
  end

  # DELETE: /workouts/5/delete
  delete "/workouts/:user_id/:exercise_id" do
    find_workout
    if @workout&.destroy
      {messages: "Record successfully destroyed"}.to_json
    else
      {errors: "Record not found with id #{params['id']}"}.to_json
    end
  end

  private

  def find_workout
    self.where(user_id: @current_user.id)
    # Workout.all.user.id == user.id

  end

#   def hometown_show?
#     self.venue.city == self.band.hometown
# end

  def serialized_workout
    @workout.to_json()
  end

  def check_duplicates
    Workout.where(exercise_name: @workout.exercise_name)
  end

  def puts
    puts "here i am"
  end
  
end