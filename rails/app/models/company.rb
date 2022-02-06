class Company < ApplicationRecord
  include Liked

  has_many :companies_users, dependent: :destroy
  has_many :users, through: :companies_users
  has_many :likes, as: :likable
end
