module Mutations
    class CreateOrder < BaseMutation
        argument :product_id, ID, required: true
        argument :user_id, ID, required: true
        argument :total, Decimal, required: true

        field :order, Types::OrderType, null: false
        field :errors, [String], null: false

        def resolve(params)
            user = User.find_by(id: params[:user_id])
            return {order: nil, errors: ["User not found"]} unless user

            product = Product.find_by(id: params[:product_id])
            return {order: nil, errors: ["Product not found"]} unless product

            order = Order.new(params.to_h)
            order.build_placements_with_product_ids_and_quantities
            if order.save
                {
                    order: order,
                    errors: []
                }
            else
                {
                    order: nil,
                    errors: order.errors.full_messages
                }
            end
        end
    end