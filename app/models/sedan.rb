class Sedan < ApplicationRecord
  validates :doors, inclusion: { in: [0, 1, 2, 3, 4] }, allow_nil: true

  has_one :base, class_name: 'Vehicle', as: :details

  before_save do
    self.doors = 4 if doors.nil?
  end

  def type
    'sedan'
  end
end
