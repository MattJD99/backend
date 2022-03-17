require "pry"

class TrainersController < ApplicationController

  # GET: /trainers
  get "/trainers" do
    Trainer.all.to_json
    # binding.pry
  end

  # POST: /trainers
  post "/trainers" do
    @trainer = trainer.create(params)
    if @trainer.id
      serialized_trainer
    else
      trainer.errors.full_messages.to_sentence
    end
  end

  # GET: /trainers/5
  get "/trainers/:id" do
    find_trainer
    if @trainer
      serialized_trainer
    else
      {errors: "Record not found with id #{params['id']}"}.to_json
    end
  end

  # PATCH: /trainers/5
  patch "/trainers/:id" do
    find_trainer
    if @trainer && @trainer.update(params)
      serialized_trainer
    elsif !@trainer
      {errors: "Record not found with id #{params['id']}"}.to_json
    else
      {errors: @trainer.errors.full_messages.to_sentence}.to_json
    end
  end

  # DELETE: /trainers/5/delete
  delete "/trainers/:id" do
    find_trainer
    if @trainer&.destroy
      {messages: "Record successfully destroyed"}.to_json
    else
      {errors: "Record not found with id #{params['id']}"}.to_json
    end
  end

  private

  def find_trainer
    @trainer = trainer.find_by_id(params["id"])
  end

  def serialized_trainer
    @trainer.to_json()
  end

end