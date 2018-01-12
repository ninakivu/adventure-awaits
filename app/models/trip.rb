class Trip < ApplicationRecord
  belongs_to :user

  has_many :invites, dependent: :destroy
  has_many :users, through: :invites
  
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  
  accepts_nested_attributes_for :comments, allow_destroy: true
  accepts_nested_attributes_for :images
end
