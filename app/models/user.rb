class User < ApplicationRecord
    has_secure_password

    has_many :reviews
    has_many :movies, through: :reviews
    
    validates :username, presence: true, uniqueness: true, length: { maximum: 12} 
    validates :password, presence: true, length: { minimum: 6 }

    def self.from_omniauth(auth)
        where( uid: auth.uid).first_or_create do |user|
          user.id = auth.uid
          user.username = auth.info.name
          user.password = SecureRandom.hex
          user.save!
        end
    end
end
