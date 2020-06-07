class User < ApplicationRecord
    has_secure_password

    has_many :reviews
    has_many :movies, through: :reviews
    
    validates :username, presence: true, uniqueness: true, length: { maximum: 12} 
    validates :password, presence: true, length: { minimum: 6 }
end
