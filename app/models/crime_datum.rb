class CrimeDatum < ActiveRecord::Base
  geocoded_by :address
end
