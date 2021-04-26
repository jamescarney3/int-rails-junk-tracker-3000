class Coupe < ApplicationRecord
  has_one :base, class_name: 'Vehicle', as: :details

  validates :doors, inclusion: { in: [0, 1, 2] }, allow_nil: true

  before_save do
    self.doors = 2 if doors.nil?
  end

  def type
    'coupe'
  end
end
