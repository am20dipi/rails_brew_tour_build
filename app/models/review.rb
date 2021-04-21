class Review < ApplicationRecord
    belongs_to :user
    belongs_to :beer 

    validates :title, presence: true
    validates :content, presence: true 
    validates :rating, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 } 
   


    scope :newest_to_oldest, -> { order('year_established DESC') }
end
