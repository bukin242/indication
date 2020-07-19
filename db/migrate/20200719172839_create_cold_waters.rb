class CreateColdWaters < ActiveRecord::Migration[5.2]
  def change
    create_table :cold_waters do |t|
      t.references :user
      t.integer :value, null: false
      t.timestamps
    end
  end
end
