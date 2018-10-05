class UpdateItemsColumns < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'citext'

    change_column :items, :name, :citext
    change_column :items, :unit_price, :decimal, :precision => 8, :scale => 2
  end
end
