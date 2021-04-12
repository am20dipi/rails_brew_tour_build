class Beer < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    accepts_nested_attributes_for :reviews

    belongs_to :brewery 
    belongs_to :user, optional: true


    validates :name, presence: true
    validates :abv, presence: true, numericality: true
    validates :description, presence: true

    scope :alphabetical, -> { order('name ASC') }
end
