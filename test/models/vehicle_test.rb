require "test_helper"

class VehicleTest < ActiveSupport::TestCase
  test "formats mileage rating" do
    high_mileage = Vehicle.new mileage: 100001
    medium_mileage = Vehicle.new mileage: 99999
    low_mileage = Vehicle.new mileage: 9999
    no_mileage = Vehicle.new

    assert high_mileage.mileage_rating == 'high'
    assert medium_mileage.mileage_rating == 'medium'
    assert low_mileage.mileage_rating == 'low'
    assert no_mileage.mileage_rating.nil?
  end

  test "defaults engine status to 'works'" do
    new_vehicle = Vehicle.create
    assert new_vehicle.engine_status == 'works'
  end
end
