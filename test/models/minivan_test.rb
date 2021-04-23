require "test_helper"

class MinivanTest < ActiveSupport::TestCase
  test "defaults doors to 4" do
    new_minivan = Minivan.create
    assert new_minivan.doors == 4
  end

  test "validates doors between 0 and 4 inclusive" do
    too_many = Minivan.create doors: 6
    assert_not too_many.valid?

    not_enough = Minivan.create doors: -2
    assert_not not_enough.valid?
  end
end
