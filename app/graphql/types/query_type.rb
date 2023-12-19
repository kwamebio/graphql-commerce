# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    
    field :products, [Types::ProductType], null: false, description: "Returns a list of products"

    def products
      Product.all
    end

    # field :products, [Types::ProductType], null: true do
    #   description 'Find products based on price range or name'
    #   argument :min_price, Float, required: false
    #   argument :max_price, Float, required: false
    #   argument :name, String, required: false
    # end

    # def products(min_price: nil, max_price: nil, name: nil)
    #   Product.filtered(min_price, max_price, name)
    # end

    field :product, Types::ProductType, null: false, description: "Returns a single product" do
      argument :id, ID, required: true
    end

      def product(id:)
        Product.find(id)
      end

      field :orders, [Types::OrderType], null: false, description: "Returns a list of orders"

      def orders 
        Order.all
      end

  end
    

end
