class Product < ApplicationRecord
    has_many :orders
    has_many :comments
    validates :name, presence: true
    validates :image_url, presence: true
end
