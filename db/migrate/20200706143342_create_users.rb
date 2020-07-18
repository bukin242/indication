class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :lastname
      t.string :password
      t.text :address
      t.boolean :admin, default: false, null: false

      t.timestamps
    end
  end
end
