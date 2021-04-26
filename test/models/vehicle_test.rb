require "test_helper"

class VehicleTest < ActiveSupport::TestCase
  test "formats mileage rating" do
    # don't like this, this isn't the Sedan test module
    high_mileage = Vehicle.new mileage: 100001, details: Sedan.new
    medium_mileage = Vehicle.new mileage: 99999, details: Sedan.new
    low_mileage = Vehicle.new mileage: 9999, details: Sedan.new
    no_mileage = Vehicle.new details: Sedan.new

    assert high_mileage.mileage_rating == 'high'
    assert medium_mileage.mileage_rating == 'medium'
    assert low_mileage.mileage_rating == 'low'
    assert no_mileage.mileage_rating.nil?
  end

  test "defaults engine status to 'works'" do
    new_vehicle = Vehicle.create details: Sedan.new
    assert new_vehicle.engine_status == 'works'
  end
end
