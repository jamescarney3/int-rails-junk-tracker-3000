require "test_helper"

class MotorcycleTest < ActiveSupport::TestCase
  test "defaults seat status to 'works'" do
    new_cycle = Motorcycle.create
    assert new_cycle.seat_status == 'works'
  end
end
