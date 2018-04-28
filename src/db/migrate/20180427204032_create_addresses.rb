class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.float :lat
      t.float :lng

      t.timestamps
    end
    add_reference :addresses, :street, foreign_key: true
  end

  def down
    remove_reference :addresses, :street, index: true, foreign_key: true
    drop_table :restaurants
  end
end
