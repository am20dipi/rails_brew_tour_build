class User < ApplicationRecord
    has_many :reviews
    has_many :beers, through: :reviews 

    has_secure_password #authenticate, auto validates the password
    validates :email, presence: { message: "Email must be given" }, uniqueness: true
    validates :name, presence: { message: "Name must be given" }, length: {in: 2..40 } 


end
