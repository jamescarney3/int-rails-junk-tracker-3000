class Vehicle < ApplicationRecord
  def mileage_rating
    return mileage if mileage.nil?
    return 'low' if mileage < 10000
    return 'medium' if mileage < 100000
    return 'high'
  end

  before_save do
    self.engine_status = 'works' if engine_status.nil?
  end
end
