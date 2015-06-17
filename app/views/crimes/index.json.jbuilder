json.array!(@crimes) do |crime|
  json.extract! crime, :id, :address
  json.url crime_url(crime, format: :json)
end
