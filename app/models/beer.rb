class Beer < ApplicationRecord
    has_many :reviews
    accepts_nested_attributes_for :reviews

    belongs_to :brewery 
    belongs_to :user

    validates :name, presence: true, uniqueness: true
    validates :abv, presence: true, numericality: { greater_than: 0, less_than: 20 }
    validates :description, presence: true

    scope :alphabetical, -> { order('name ASC') }
end
