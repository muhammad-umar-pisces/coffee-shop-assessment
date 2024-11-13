class ChangeComboItemNamesToBeJsonInDiscounts < ActiveRecord::Migration[7.0]
  def change
    change_column :discounts, :combo_item_names, :json, default: []
  end
end