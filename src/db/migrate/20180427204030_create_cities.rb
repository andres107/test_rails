class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name

      t.timestamps
    end
    add_reference :cities, :state, index: true, foreign_key: true
  end

  def down
    remove_reference :cities, :state, index: true, foreign_key: true
    drop_table :restaurants
  end
end
