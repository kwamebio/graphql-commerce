class Product < ApplicationRecord
    belongs_to :user
   
    has_many :orders
    has_many :comments
    has_many :images, dependent: :destroy
    
    validates :name, presence: true
end
