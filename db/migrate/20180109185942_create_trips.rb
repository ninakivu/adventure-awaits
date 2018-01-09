class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :title
      t.string :destinations
      t.string :map
      t.string :participants
      t.datetime :begin_date
      t.integer :duration
      t.string :activities
      t.string :highlights
      t.string :image
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
