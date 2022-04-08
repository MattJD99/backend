class SessionsController < ApplicationController

post "/login" do
    @user = User.find_by_name(params[:name])
    if @user&.authenticate(params[:password])
        session[:user_id] = @user.id #save user id into server memory
        halt 200, {id: @user.id, name: @user.name, message: "User logged in successfully."}.to_json
    else
        halt 404, {error: "Invalid login."}.to_json
    end
end

delete "/logout" do
    session.delete("user_id")
    halt 200, {message: "User logged out successfully."}.to_json
    end
end