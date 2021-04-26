class AddReferencesToVehicles < ActiveRecord::Migration[6.1]
  def change
    add_reference :vehicles, :details, polymorphic: true, null: false
  end
end
