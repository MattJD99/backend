class User < ActiveRecord::Base
    has_many :exercises
    has_one :trainer, through: :exercises

    has_secure_password

end
