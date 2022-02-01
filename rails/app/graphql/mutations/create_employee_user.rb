module Mutations
  class CreateEmployeeUser < BaseMutation
    field :user, Types::UserType, null: false

    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true
    argument :company_ids, [Integer], required: true

    def resolve(**args)
      User.transaction do
        user = User.create!(
          role: 'employee',
          name: args[:name],
          email: args[:email],
          password: args[:password],
          password_confirmation: args[:password_confirmation]
        )

        user.companies << Company.find(args[:company_ids])

        { user: user }
      end
    end
  end
end
