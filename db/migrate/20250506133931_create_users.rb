class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email, limit: 100
      t.string :password, limit: 72
      t.string :pseudo, limit: 30
      t.string :city, limit: 50

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :pseudo, unique: true
  end
end
