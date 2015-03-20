class AddRgToUserData < ActiveRecord::Migration
  def change
    add_column :user_data, :rg, :string
  end

  #add_index :user_data, :rg, unique: true
end
