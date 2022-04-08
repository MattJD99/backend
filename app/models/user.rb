class User < ActiveRecord::Base
    has_one :workout
    has_many :exercises, through: :workout

    has_secure_password
end
