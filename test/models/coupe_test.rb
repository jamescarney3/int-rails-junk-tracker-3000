require "test_helper"

class CoupeTest < ActiveSupport::TestCase
  test "defaults doors to 2" do
    new_coupe = Coupe.create
    assert new_coupe.doors == 2
  end

  test "validates doors between 0 and 2 inclusive" do
    too_many = Coupe.create doors: 3
    assert_not too_many.valid?

    not_enough = Coupe.create doors: -2
    assert_not not_enough.valid?
  end
end
