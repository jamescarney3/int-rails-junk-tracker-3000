class Vehicle < ApplicationRecord
  belongs_to :details, polymorphic: true

  def mileage_rating
    return nil if mileage.nil?
    return 'low' if mileage < 10000
    return 'medium' if mileage < 100000
    return 'high'
  end

  def vehicle_type
    # this works incidentally, obviously could be more resilient
    return details.nil? ? nil : details.type
  end

  before_save do
    self.engine_status = 'works' if engine_status.nil?
  end

  def flatten
    (details || {}).as_json.merge(self.as_json).merge({ vehicle_type: self.vehicle_type })
  end
end
