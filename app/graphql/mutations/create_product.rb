module Mutations
    class CreateProduct < BaseMutation
        argument :name, String, required: true
        argument :description, String, required: true
        argument :price, Float, required: true
          

        field :product, Types::ProductType, null: false
        field :errors, [String], null: false

        def resolve(name:, description:, price:)
            product = Product.new(name: name, description: description, price: price, user: current_user)
            if product.save
                {
                    product: product,
                    errors: []
                }
            else
                {
                    product: nil,
                    errors: product.errors.full_messages
                }
            end
        end


    end
end