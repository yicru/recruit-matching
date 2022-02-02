module Mutations
  class Unlike < BaseMutation
    field :target, Types::LikableType, null: false

    argument :target_id, Integer, required: true

    def authorized?(**inputs)
      if context[:current_user]&.general? || context[:current_user]&.employee?
        return true
      end

      raise ApplicationError::AuthorizationError
    end

    def resolve(**args)
      user = context[:current_user]

      target = if user.general?
                 Company.find(args[:target_id])
               else
                 User.where(role: 'general').find(args[:target_id])
               end

      target.unliked_by(user)

      { target: target }
    end
  end
end
