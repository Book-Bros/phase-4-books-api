class Book < ApplicationRecord
    has_many :reviews
    has_many :book_genres
    has_many :genres, through: :book_genres
    has_many :users, through: :reviews
end
