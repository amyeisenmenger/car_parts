class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.float :price
      t.float :weight
      t.string :model

      t.timestamps null: false
    end
  end
end
