class User < ApplicationRecord
  has_secure_password
  
  has_many :invites, dependent: :destroy
  has_many :invites_received, class_name: "Invite", foreign_key: 'recipient_id'
  has_many :trips, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :trips, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true

  
end
