class AddColumnsToDashboard < ActiveRecord::Migration[6.1]
  def change
    add_column :dashboards, :start_time, :time
    add_column :dashboards, :end_time, :time
    add_column :dashboards, :loading_time, :float
  end
end
