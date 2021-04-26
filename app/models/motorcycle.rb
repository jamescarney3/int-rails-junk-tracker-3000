class Motorcycle < ApplicationRecord
  has_one :base, class_name: 'Vehicle', as: :details

  before_save do
    self.seat_status = 'works' if seat_status.nil?
  end

  def type
    'motorcycle'
  end
end
