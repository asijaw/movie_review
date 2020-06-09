class Review < ApplicationRecord
    belongs_to :user
    belongs_to :movie

    validates :content, :rating, presence: true
    validates :content, length: { maximum: 200 }

    scope :top_five_movies, -> {order(rating: :desc).limit(5)}

    #scope :most_popular_movies, -> {order(rating: :desc).average}

end
