class Point < ApplicationRecord
  enum status: [:earned, :redeemed]
  validates :status, presence: true
  validates :value, presence: true
  validates :name, presence: true
  validates :user_id, presence: true
  belongs_to :user
end
