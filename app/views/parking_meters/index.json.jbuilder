json.array!(@parking_meters) do |parking_meter|
  json.extract! parking_meter, :id, :name, :head_type, :time_limit, :rate, :credit, :pay_by_phone, :in_effect, :lat, :lng
  json.url parking_meter_url(parking_meter, format: :json)
end
