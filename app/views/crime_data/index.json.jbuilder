json.array!(@crime_data) do |crime_datum|
  json.extract! crime_datum, :id, :lat, :lon
  json.url crime_datum_url(crime_datum, format: :json)
end
