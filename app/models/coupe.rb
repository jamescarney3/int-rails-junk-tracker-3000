class Coupe < ApplicationRecord
  validates :doors, inclusion: { in: [0, 1, 2] }, allow_nil: true

  before_save do
    self.doors = 2 if doors.nil?
  end
end
