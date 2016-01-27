class CreateManufactures < ActiveRecord::Migration
  def change
    create_table :manufactures do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
