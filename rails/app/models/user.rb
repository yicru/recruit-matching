class User < ApplicationRecord
  include Liked

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :companies_users, dependent: :destroy
  has_many :companies, through: :companies_users
  has_many :likes, as: :likable

  enum role: { general: 0, employee: 1, admin: 2 }

  validates :name, presence: true, length: { in: 1..255 }
  validates :email, presence: true, length: { in: 1..255 }, uniqueness: true

  def token
    JsonWebToken.encode({
                          id: id,
                          exp: (Time.zone.now + 2.weeks).to_i
                        })
  end

  def general?
    role == 'general'
  end

  def employee?
    role == 'employee'
  end

  def admin?
    role == 'admin'
  end
end
