require "pry"
class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    User.all.to_json()
  end

  #GET: /workouts/:user_id
  get "/users/:id/workouts" do
    find_user
    if @user
      @user.exercises.to_json
    else
      user.errors.full_messages.to_sentence
    end
  end

  # POST: /users
  post "/users" do # same as /signup
    @user = User.create(params)
    binding.pry
    if @user.id
      session[:user_id] = user.id
      serialized_user
    else
      user.errors.full_messages.to_sentence
    end
  end

  # GET: /users/5
  get "/users/:id" do
    find_user
    if @user
      serialized_user
    else
      {errors: "Record not found with id #{params['id']}"}.to_json
    end
  end

  # PATCH: /users/5
  patch "/users/:id" do
    find_user
    self.exercises.create(params)
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    find_user
    if @user&.destroy
      {messages: "Record successfully destroyed"}.to_json
    else
      {errors: "Record not found with id #{params['id']}"}.to_json
    end
  end

  private

  def find_user
    @user = User.find_by_id(params["id"])
  end

  def serialized_user
    @user.to_json(except: [:created_at, :updated_at])
  end

  def exercises
    self.exercises.where(user_id: self.id).to_json
  end

end
