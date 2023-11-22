module Mutations
    class CreateProduct < BaseMutation
        argument :name, String, required: true
        argument :description, String, required: true
        argument :price, Float, required: true
        argument :user_id, ID, required: true   

        field :product, Types::ProductType, null: false
        field :errors, [String], null: false

        def resolve(params)
           user = User.find_by(id: params[:user_id])
           return {product: nil, errors: ["User not found"]} unless user

           product = Product.new(params.to_h)
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