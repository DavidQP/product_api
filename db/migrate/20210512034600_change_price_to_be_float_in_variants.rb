class ChangePriceToBeFloatInVariants < ActiveRecord::Migration[6.1]
  def change
    change_column :variants, :price, :float
  end
end
