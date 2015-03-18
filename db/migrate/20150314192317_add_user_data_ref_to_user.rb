class AddUserDataRefToUser < ActiveRecord::Migration
  def change
    add_reference :users, :data, index: true
  end
end
