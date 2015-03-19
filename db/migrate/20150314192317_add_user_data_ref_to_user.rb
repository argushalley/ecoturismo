class AddUserDataRefToUser < ActiveRecord::Migration
  def change
    add_reference :user_data, :user, index: true
  end
end
