class AddTripToTransaction < ActiveRecord::Migration
  def change
    add_reference :transactions, :trip, index: true
  end
end
