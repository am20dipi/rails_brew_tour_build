class Brewery < ApplicationRecord
    has_many :beers


    validates :name, presence: true
    validates :location, presence: true 
    validates :year_established, presence: true, numericality: { message: "%{value} seems wrong" }, length: { is: 4 }
end
