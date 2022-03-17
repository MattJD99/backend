class Exercise < ActiveRecord::Base
    belongs_to :user
    belongs_to :trainer
    has_many :users
end
