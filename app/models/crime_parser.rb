=begin
class CrimeParser


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

  csv_text = File.read(file)
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    #save addresses to an array
    if /\w*Auto\w*/.match(row[0])
      addresses<< row[3]
    end
  end

#if array is not NULL, replace 'xx' in address with '00' for geocoding

  if addresses != nil
    addresses.each do |address|
      if /\w*XX\w*/.match(address)
        address.sub!('XX', '00')
      end
    end
  end


  addresses.each do |address|
    location = Geocoder.coordinates(address)
    if location != nil
      if /49\.\d*/.match(location[0].to_s) && /-123\.\d*/.match(location[1].to_s)
        crime = CrimeDatum.new
        crime.lat = location[0]
        crime.lon = location[1]
        if crime.save!
          puts "Crime success"
        else
          puts "crime save not successful"
        end

      end
    end
  end

  end=end
