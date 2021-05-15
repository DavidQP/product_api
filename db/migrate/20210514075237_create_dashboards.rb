class CreateDashboards < ActiveRecord::Migration[6.1]
  def change
    create_table :dashboards do |t|
      t.integer :uploaded
      t.integer :not_uploaded
      t.integer :total

      t.timestamps
    end
  end
end
