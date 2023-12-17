module Mutations
    class CreateOrder < BaseMutation
        argument :product_id, ID, required: true
        argument :user_id, ID, required: true
        argument :total, Decimal, required: true

        field :order, Types::OrderType, null: false
        field :errors, [String], null: false

        def resolve(params)
         #fix this
        end
    end
end