module Liked
  extend ActiveSupport::Concern

  included do
    def liked_by(user)
      likes.where(user: user).first_or_create
    end

    def unliked_by(user)
      like = likes.where(user: user).first
      like.destroy if like.present?
    end

    def liked_count
      likes.count
    end

    def liked_by?(user)
      likes.where(user: user).present?
    end
  end
end
