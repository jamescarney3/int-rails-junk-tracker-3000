class AddColumnsToVehicles < ActiveRecord::Migration[6.1]
  def change
    add_column :vehicles, :mileage, :integer
    add_column :vehicles, :registration_id, :string
    add_column :vehicles, :vehicle_type, :string
    add_column :vehicles, :wheels, :integer
  end
end
