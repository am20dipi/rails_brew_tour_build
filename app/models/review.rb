class Review < ApplicationRecord
    belongs_to :user
    belongs_to :beer 

    validates :title, presence: true
    validates :content, presence: true 
    validates :rating, presence: true, numericality: true 
    

end
