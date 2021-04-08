class Review < ApplicationRecord
    belongs_to :user
    belongs_to :beer 

    validates :title, presence: true
    validates :content, presence: true 
    validates :rating, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6 } 
    validates :beer, uniqueness: { scope: :user, message: "You already reviewed this one!"}

end
