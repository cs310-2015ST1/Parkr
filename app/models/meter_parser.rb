require 'nokogiri'

file = File.open("/Users/mackenziesampson1/RubymineProjects/Parkr/app/assets/sources/parking_meter_rates_and_time_limits.kml")
data = Nokogiri::XML(file)

data.css("Placemark").each do |placeMark|

  pm = ParkingMeter.new

    pm.id = placeMark['id']
    name = /[0-9]+/.match(placeMark.at('name'))
    head_type = /(Single|Twin)/.match(placeMark.at('description'))
    time_limit = /\s[0-9]\s/.match(placeMark.at('description'))
    rate = /(\$[0-9]*\.[0-9]*)/.match(placeMark.at('description'))
    credit = /CRE(\w*)/.match(placeMark.at('description'))
    payByPhone = /\s[0-9]{3,}/.match(placeMark.at('description'))
    inEffect = /\d+\:\d+[\w|\s]+\d+\:+\d+[\w|\s]+/.match(placeMark.at('description'))
    lng = /\-[0-9]*\.[0-9]*/.match(placeMark.at('coordinates'))
    lat = /49\.[0-9]*/.match(placeMark.at('coordinates'))

#    pm.save

 #   if pm.save
  #    puts "Success"
   # else
    #  puts "This didn't save"
    #end

end
