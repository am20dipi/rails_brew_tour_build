class User < ApplicationRecord
    has_many :reviews
    has_many :beers, through: :reviews 

    has_secure_password #authenticate, auto validates the password
    validates :email, presence: { message: "Email must be given" }, uniqueness: true
    validates :name, presence: { message: "Name must be given" }, length: {in: 2..40 } 


    def self.from_omniauth(response)
        user = User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
            u.email = response[:info][:email]
            u.name = response[:info][:name]
            u.password = SecureRandom.hex(15)
            # assigning a random password to avoid hacking

        end
    end
end
