class Trip < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :users
  accepts_nested_attributes_for :comments, allow_destroy: true
end
