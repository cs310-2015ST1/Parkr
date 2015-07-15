require 'nokogiri'

  file = File.open(File.expand_path('app/assets/sources/parking_meter_rates_and_time_limits.kml'))


  data = Nokogiri::XML(file)

  data.css("Placemark").each do |placeMark|

    pm = ParkingMeter.new

    if /\d+\:\d+[\w|\s]+\d+\:\d+[\w|\s]+/.match(placeMark.at('description'))
      pm.in_effect = /\d+\:\d+[\w|\s]+\d+\:\d+[\w|\s]+/.match(placeMark.at('description'))
    else
      pm.in_effect = "Not Specified"
    end
    if /[0-9]+/.match(placeMark.at('name'))
      pm.name = /[0-9]+/.match(placeMark.at('name'))
    else
      pm.name = "Not Specified"
    end
    if /(Single|Twin)/.match(placeMark.at('description'))
      pm.head_type = /(Single|Twin)/.match(placeMark.at('description'))
    else
      pm.head_type = "Not Specified"
    end
    if /[0-9]\sHr/.match(placeMark.at('description'))
      pm.time_limit = /[0-9]\sHr/.match(placeMark.at('description'))
    else
      pm.time_limit = "Not Specified"
    end
    if /(\$[0-9]*\.[0-9]*)/.match(placeMark.at('description'))
      pm.rate = /(\$[0-9]*\.[0-9]*)/.match(placeMark.at('description'))
    else
      pm.rate = "Not Specified"
    end
    if /[0-9]+/.match(placeMark.at('name'))
      pm.pay_by_phone = /[0-9]+/.match(placeMark.at('name'))
    else
      pm.pay_by_phone = "Not Specified"
    end
    if /(49\.\d+)/.match(placeMark.at('coordinates'))
      lat = /(49\.\d+)/.match(placeMark.at('coordinates'))
    else
      lat = "Not Specified"
    end
    if /(-123\.\d+)/.match(placeMark.at('coordinates'))
      lng = /(-123\.\d+)/.match(placeMark.at('coordinates'))
    else
      lng = "Not Specified"
    end

    if lat!=nil
      pm.lat = lat[0]
    else
      pm.lat = nil
    end
    if lng!=nil
      pm.lng = lng[0]
    else
      pm.lng = nil
    end


    pm.save!


    if pm.save
      puts "Parking meter Success"
    else
      puts "Parking meter didn't save"
    end
  end
