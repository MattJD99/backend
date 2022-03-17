class ExercisesController < ApplicationController

  # GET: /exercises
  get "/exercises" do
    Exercise.all.to_json
  end

  # POST: /exercises
  post "/exercises" do
    @exercise = Exercise.create(params)
    if @exercise.id
      serialized_exercise
    else
      @exercise.full_messages.to_sentence
    end
  end

  # GET: /exercises/5
  get "/exercises/:id" do
    find_exercise
    if @exercise
      serialized_exercise
    else
      {errors: "Record not found with id #{params['id']}"}.to_json
    end
  end

  # PATCH: /exercises/5
  patch "/exercises/:id" do
    find_exercise
    if @exercise && @exercise.update(params)
      serialized_exercise
    elsif !@exercise
      {errors: "Record not found with id #{params['id']}"}.to_json
    else
      {errors: @exercise.errors.full_messages.to_sentence}.to_json
    end
  end

  # DELETE: /exercises/5/delete
  delete "/exercises/:id/delete" do
    find_exercise
    if @exercise&.destroy
      {messages: "Record successfully destroyed"}.to_json
    else
      {errors: "Record not found with id #{params['id']}"}.to_json
    end
  end

  private

  def find_exercise
    @exercise = Exercise.find_by_id(params["id"])
  end

  def serialized_exercise
    @exercise.to_json
  end

end
