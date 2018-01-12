class User < ApplicationRecord
  has_secure_password
  
  has_many :invites, dependent: :destroy
  has_many :trips, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :trips, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
end
