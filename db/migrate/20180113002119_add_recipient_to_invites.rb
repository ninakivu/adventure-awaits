class AddRecipientToInvites < ActiveRecord::Migration[5.1]
  def change
    add_column :invites, :recipient_id, :integer
    add_index :invites, :recipient_id
  end
end
