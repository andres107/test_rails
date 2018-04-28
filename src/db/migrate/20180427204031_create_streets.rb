class CreateStreets < ActiveRecord::Migration[5.2]
  def change
    create_table :streets do |t|
      t.string :name

      t.timestamps
    end
    add_reference :streets, :city, foreign_key: true
  end

  def down
    remove_reference :streets, :city, index: true, foreign_key: true
    drop_table :restaurants
  end
end
