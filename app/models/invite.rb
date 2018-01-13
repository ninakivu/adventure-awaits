class Invite < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  belongs_to :recipient, foreign_key: "recipient_id", class_name: "User"
end
