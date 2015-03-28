class CreateUserTrips < ActiveRecord::Migration
  def change
    create_table :user_trips do |t|
      t.references :user, index: true
      t.references :trip, index: true

      t.timestamps
    end
  end
end
