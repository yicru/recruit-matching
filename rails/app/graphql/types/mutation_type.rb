module Types
  class MutationType < Types::BaseObject
    field :login, mutation: Mutations::Login
    field :create_employee_user, mutation: Mutations::CreateEmployeeUser
    field :create_general_user, mutation: Mutations::CreateGeneralUser
  end
end
