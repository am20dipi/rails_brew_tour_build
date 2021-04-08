class Beer < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    belongs_to :brewery 
    belongs_to :user 


    validates :name, presence: true
    validates :abv, presence: true, numericality: true
    validates :description, presence: true
end
