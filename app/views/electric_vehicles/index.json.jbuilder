json.array!(@electric_vehicles) do |electric_vehicle|
  json.extract! electric_vehicle, :id, :lat, :lon
  json.url electric_vehicle_url(electric_vehicle, format: :json)
end
