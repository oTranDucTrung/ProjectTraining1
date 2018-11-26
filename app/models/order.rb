class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  include PublicActivity::Model
  tracked
  
  has_many :orders, dependent: :destroy
  belongs_to :user

  enum status: {pending: 0, successed: 1, failed: 2}
end
