json.array!(@searches) do |search|
  json.extract! search, :id, :location, :distance, :rate
  json.url search_url(search, format: :json)
end
