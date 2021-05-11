class ChangePriceToBeIntegerInVariants < ActiveRecord::Migration[6.1]
  def change
    change_column :variants, :price, :integer
  end
end
