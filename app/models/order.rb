class Order < ApplicationRecord
    belongs_to :user

    has_many :placements, dependent: :destroy   
    has_many :products, through: :placements

    validates :user, presence: true
    validates :product, presence: true

    def set_total!
        self.total = self.placements.map { |placement| placement.product.price * placement.quantity }.sum
    end


end
