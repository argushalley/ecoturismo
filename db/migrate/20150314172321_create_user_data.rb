class CreateUserData < ActiveRecord::Migration
  def change
    create_table :user_data do |t|
      t.string :name
      t.string :cpf

      t.timestamps
    end

    add_index :user_data, :cpf, unique: true
  end
end
