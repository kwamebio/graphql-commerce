module Types
    class OrderTypes < BaseObject
        field :id, ID, null: false
        field :product, Types::ProductType, null: false
        field :user, Types::UserType, null: false
        field :created_at, String, null: false
        field :updated_at, String, null: false
    end
end