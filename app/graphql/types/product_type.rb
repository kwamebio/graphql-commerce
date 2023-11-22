module Types
    class ProductType < Types::BaseObject
        field :id, ID, null: false
        field :name, String, null: false
        field :price, Float, null: false
        field :description, String, null: false
        field :created_at, String, null: false
        field :updated_at, String, null: false
        field :user, Types::UserType, null: false
    end
end