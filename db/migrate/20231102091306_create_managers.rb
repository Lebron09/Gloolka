class CreateManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :managers do |t|
      t.string :last_name
      t.string :first_name
      t.string :passport_id
      t.string :address
      t.string :city

      t.timestamps
    end
  end
end
