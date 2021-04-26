class Minivan < ApplicationRecord
  has_one :base, class_name: 'Vehicle', as: :details

  validates :doors, inclusion: { in: [0, 1, 2, 3, 4] }, allow_nil: true

  before_save do
    self.doors = 4 if doors.nil?
  end

  before_create do
    self.door_configuration = {
      driver_front: { sliding: false },
      passenger_front: { sliding: false },
      driver_rear: { sliding: false },
      passenger_rear: { sliding: false },
    }
  end

  def type
    'minivan'
  end
end
