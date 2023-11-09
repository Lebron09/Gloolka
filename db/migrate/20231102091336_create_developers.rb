class CreateDevelopers < ActiveRecord::Migration[7.0]
  def change
    create_table :developers do |t|
      t.string :last_name
      t.string :first_name
      t.string :passport_id
      t.string :address
      t.string :city
      t.references :manager, null: true, foreign_key: true

      t.timestamps
    end
  end
end
