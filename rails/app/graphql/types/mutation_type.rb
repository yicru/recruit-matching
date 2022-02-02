module Types
  class MutationType < Types::BaseObject
    field :unlike, mutation: Mutations::Unlike
    field :like, mutation: Mutations::Like
    field :login, mutation: Mutations::Login
    field :create_company, mutation: Mutations::CreateCompany
    field :create_employee_user, mutation: Mutations::CreateEmployeeUser
    field :create_general_user, mutation: Mutations::CreateGeneralUser
  end
end
