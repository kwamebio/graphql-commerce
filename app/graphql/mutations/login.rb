module Mutations
    class Login < BaseMutation
        argument :email, String, required: true
        argument :password, String, required: true

        field :user, Types::UserType, null: true
        field :errors, [String], null: true
        field :token, String, null: true

        def resolve(email: nil, password:)
            user = User.find_by(email: email)
      
            if user&.authenticate(password)
              {user: user, token: user.token}
            else
              {errors: { user: "Invalid credentials" }}
            end
        end
    end
end