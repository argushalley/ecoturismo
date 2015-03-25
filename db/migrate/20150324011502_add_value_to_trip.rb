class AddValueToTrip < ActiveRecord::Migration
  def change
    add_money :trips, :value
  end
end
