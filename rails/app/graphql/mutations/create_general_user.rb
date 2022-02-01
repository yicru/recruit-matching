module Mutations
  class CreateGeneralUser < BaseMutation
    field :user, Types::UserType, null: false

    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true

    def resolve(**args)
      user = User.create!(
        role: 'general',
        name: args[:name],
        email: args[:email],
        password: args[:password],
        password_confirmation: args[:password_confirmation]
      )

      { user: user }
    end
  end
end
