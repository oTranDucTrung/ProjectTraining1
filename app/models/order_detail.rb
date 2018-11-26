class OrderDetail < ApplicationRecord
  include PublicActivity::Model
  tracked
  
  belongs_to :course
  belongs_to :order
end
