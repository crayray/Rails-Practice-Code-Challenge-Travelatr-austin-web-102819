class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0,  only_integer: true }
    validates :bio, length: { minimum: 100 }
end
