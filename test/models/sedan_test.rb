require "test_helper"

class SedanTest < ActiveSupport::TestCase
  test "defaults doors to 4" do
    new_sedan = Sedan.create
    assert new_sedan.doors == 4
  end

  test "validates doors between 0 and 4 inclusive" do
    too_many = Sedan.create doors: 6
    assert_not too_many.valid?

    not_enough = Sedan.create doors: -2
    assert_not not_enough.valid?
  end
end
