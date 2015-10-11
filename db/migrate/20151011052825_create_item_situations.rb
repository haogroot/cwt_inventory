class CreateItemSituations < ActiveRecord::Migration
  def change
    create_table :item_situations do |t|
      t.text :situation

      t.timestamps null: false
    end
  end
end
