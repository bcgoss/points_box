class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness:true
  validates :password_digest, presence: true

  has_many :points
  has_many :user_rewards
  has_many :rewards, through: :user_rewards

  enum role: %w(default admin)
  def points_earned
    points.where(status: :earned).sum(:value)
  end

  def points_spent
    points.where(status: :redeemed).sum(:value)
  end
end
