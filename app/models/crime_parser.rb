require 'openssl'
require 'csv'
require 'open-uri'
require 'geokit-rails'




file = File.expand_path('app/assets/sources/crime_2014.csv')

#open csv and save locally
open("ftp://webftp.vancouver.ca/opendata/csv/crime_2014.csv") do |ftp|
  open(file, 'w') do |file|
    file.write(ftp.read)
  end



end


addresses = Array.new

CSV.read(file) do |row|

  #save addresses to an array

  if row[0].contains? 'Auto'
    addresses<< row[3]
  end

  #if array is not NULL, replace 'xx' in address with '00' for geocoding

  if addresses != nil
    addresses.each do |address|
      if address.contains? 'xx'
        address.sub! 'xx', '00'
      end
    end
  end


  addresses.each do |address|
    location = Geokit::Geocoder::GoogleGeocoder.geocode(address)
    if location.success
      crime = CrimeDatum.new(location.lat, location.lng)
      crime.save!
    elsif !location.success
    puts "crime save not successful"
    end

  end

end

