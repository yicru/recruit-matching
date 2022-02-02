class Company < ApplicationRecord
  include Liked

  has_many :likes, as: :likable
end
