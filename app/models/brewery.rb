class Brewery < ApplicationRecord
    has_many :beers
    belongs_to :user
    accepts_nested_attributes_for :beers


    validates :name, presence: true, uniqueness: true
    validates :location, presence: true 
    validates :year_established, presence: true, numericality: { less_than_or_equal_to: Proc.new {|record| Date.current.year }}
end
