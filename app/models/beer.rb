class Beer < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    belongs_to :brewery 
    belongs_to :user 
end
