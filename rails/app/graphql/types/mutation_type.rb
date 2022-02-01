module Types
  class MutationType < Types::BaseObject
    field :create_general_user, mutation: Mutations::CreateGeneralUser
  end
end
