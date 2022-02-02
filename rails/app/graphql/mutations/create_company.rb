module Mutations
  class CreateCompany < BaseMutation
    field :company, Types::CompanyType, null: false

    argument :name, String, required: true

    def authorized?(**inputs)
      return true if context[:current_user]&.admin?
      raise ApplicationError::AuthorizationError
    end

    def resolve(**args)
      company = Company.create!(
        name: args[:name]
      )

      { company: company }
    end
  end
end
