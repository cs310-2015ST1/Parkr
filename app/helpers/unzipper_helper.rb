module UnzipperHelper
  require 'rubygems'
  require 'open-uri'
  require 'rubyzip'
  require 'openssl'

# Pull remote KML file, unzip, and store locally
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


#open csv and save locally
  open("ftp://webftp.vancouver.ca/opendata/csv/crime_2014.csv") do |ftp|
    open(file, 'w') do |file|
      file.write(ftp.read)
    end
  end
end
