require 'rubygems'
require 'open-uri'
require 'zip/zip'

zip_file = open("http://data.vancouver.ca/download/kml/parking_meter_rates_and_time_limits.kmz")
source_path = "/Users/mackenziesampson1/RubymineProjects/Parkr/app/assets/sources"

def unzip_file (file, destination)
  Zip::ZipFile.open(file) { |zip_file|
    zip_file.each { |f|
      f_path=File.join(destination, f.name)
      FileUtils.mkdir_p(File.dirname(f_path))
      zip_file.extract(f, f_path){true}
    }
    puts "successfully extracted"
  }
end

unzip_file(zip_file, source_path)