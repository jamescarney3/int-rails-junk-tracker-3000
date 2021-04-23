class AddColumnsToVehicles < ActiveRecord::Migration[6.1]
  def change
    add_column :vehicles, :mileage, :integer
    add_column :vehicles, :registration_id, :string
    add_column :vehicles, :wheels, :integer
    add_column :vehicles, :engine_status, :string
    # not adding a type column here - will derive from specific
    # type model implementations
  end
end
