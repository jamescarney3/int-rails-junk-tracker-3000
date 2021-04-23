class CreateMinivans < ActiveRecord::Migration[6.1]
  def change
    create_table :minivans do |t|
      t.integer :doors
      t.json :door_configuration

      t.timestamps
    end
  end
end
