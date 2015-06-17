class ParkingMeter < ActiveRecord::Base
  def gmaps4rails_infowindow
    # add here whatever html content you desire, it will be displayed when users clicks on the marker
    "<p>#{pm.rate}</p>
     <p>#{pm.time_limit}</p>
     <p>#{pm.head_type}</p>"
  end
end
