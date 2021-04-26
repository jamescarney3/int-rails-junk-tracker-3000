json.extract! vehicle, :id, :nickname, :registration_id, :mileage, :engine_status, :wheels, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
json.vehicle_type vehicle.vehicle_type
