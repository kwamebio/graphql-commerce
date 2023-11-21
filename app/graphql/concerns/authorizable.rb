module Authorizable
    def current_user
      @current_user ||= context[:current_user]
      raise GraphQL::ExecutionError.new("Invalid token", extensions: { status: 401, error: :unauthorized }) if @current_user.blank?
      raise GraphQL::ExecutionError.new("User not found", extensions: { status: 404, error: :not_found }) if @current_user == :not_found
      raise GraphQL::ExecutionError.new("User Session expired", extensions: { status: 401, error: :unauthorized }) if @current_user == :expired
  
      @current_user
    end
end