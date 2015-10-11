class AddItemSituationIdToItems < ActiveRecord::Migration
  def change
    add_reference :items, :item_situation, index: true, foreign_key: true
  end
end
