module Mutations
  class Like < BaseMutation
    field :like, Types::LikeType, null: false

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

      like = target.liked_by(user)

      { like: like }
    end
  end
end
