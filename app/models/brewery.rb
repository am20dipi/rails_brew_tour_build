class Brewery < ApplicationRecord
    has_many :beers


    validates :name, presence: true, uniqueness: true
    validates :location, presence: true 
    validates :year_established, presence: true, numericality: { less_than_or_equal_to: Proc.new {|record| Date.current.year }}
    # custom validator for future
end
