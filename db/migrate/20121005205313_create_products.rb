class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :ASIN

      t.timestamps
    end
  end
end
