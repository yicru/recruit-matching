module Mutations
  class Login < BaseMutation
    field :token, String, null: false
    field :user, Types::UserType, null: false

    argument :email, String, required: true
    argument :password, String, required: true

    def resolve(**args)
      user = User.find_for_database_authentication(email: args[:email])

      if user.nil? || !user.valid_password?(args[:password])
        raise GraphQL::ExecutionError, 'Invalid credentials'
      end

      {
        token: user.token,
        user: user
      }
    end
  end
end
