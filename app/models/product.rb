class Product < ApplicationRecord
    belongs_to :user
   
    has_many :orders, through: :placements
    has_many :placements, dependent: :destroy
    has_many :comments
    has_many :images, dependent: :destroy
    has_many :items
    has_many :orders, through: :items
    
    validates :name, presence: true

    scope :filter_by_name, -> (keyword) { where("name like ?", "%#{keyword}%") }
    scope :above_or_equal_to_price, -> (price) { where("price >= ?", price) }

    def self.search(params = {})
        products = params[:product_ids].present? ? Product.find(params[:product_ids]) : Product.all
        products = products.filter_by_name(params[:keyword]) if params[:keyword]
        products = products.above_or_equal_to_price(params[:min_price].to_f) if params[:min_price]
        products = products.below_or_equal_to_price(params[:max_price].to_f) if params[:max_price]

        products
    end
end
