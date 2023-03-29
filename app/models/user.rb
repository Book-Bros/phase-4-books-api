class User < ApplicationRecord
    has_secure_password
    has_many :reviews, dependent: :destroy
    has_many :books, through: :reviews

    validates :username, :password, :email, presense: true
    validates :password, length: {in: 6..8}
end
