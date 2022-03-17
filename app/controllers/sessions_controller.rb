class SessionsController < ApplicationController

post "/login" do
    user = User.find_by_name(params[:name])
    if user&.authenticate(params[:password])
        binding.pry
        session[:user_id] = user.id
        halt 200, {user: user, message: "User logged in successfully."}
    else
        halt 404, {error: "Invalid login."}
    end
end

delete "/logout" do
    session.delete("user_id")
        session[:user_id] = user.id
        halt 200, {user: user, message: "User logged out successfully."}
    end
end