class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.integer :rating
      t.string :name
      t.string :site
      t.string :email
      t.string :phone

      t.timestamps
    end
    add_reference :restaurants, :address, foreign_key: true
  end

  def down
    remove_reference :restaurants, :address, index: true, foreign_key: true
    drop_table :restaurants
  end
end
