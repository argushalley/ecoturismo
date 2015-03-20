class AddGenderToUserData < ActiveRecord::Migration
  def change
    add_column :user_data, :gender, :integer, default: 0
  end
end
