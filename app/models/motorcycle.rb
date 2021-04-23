class Motorcycle < ApplicationRecord
  before_save do
    self.seat_status = 'works' if seat_status.nil?
  end
end
