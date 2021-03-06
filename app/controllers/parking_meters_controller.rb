class ParkingMetersController < ApplicationController
  before_action :set_parking_meter, only: [:show, :edit, :update, :destroy]


  require 'rubygems'
  require 'zip/zip'
  require 'openssl'

  # GET /parking_meters
  # GET /parking_meters.json

  def index

    if params[:location].present?
      if current_user
        current_user.searches.create(location: params[:location], user_id: current_user.oauth_token)
        #SearchSuggestion.seed
      end
      if params[:distance].present?
        if params[:rate] == ["any"]
          @parking_meters  = ParkingMeter.near(params[:location], params[:distance].to_i)
        elsif params[:rate] == ["$1.00"]
          @parking_meters  = ParkingMeter.near(params[:location], params[:distance].to_i).where("rate = ?", ['$1.00'])
        elsif params[:rate] == ["$1.50"]
          @parking_meters  = ParkingMeter.near(params[:location], params[:distance].to_i).where("rate = ?", ['$1.00'|| '$1.50'])
        elsif params[:rate] == ["$2.00"]
          @parking_meters  = ParkingMeter.near(params[:location], params[:distance].to_i).where("rate = ?", ['$1.00'|| '$1.50'||'$2.00'])
        elsif params[:rate] == ["$2.50"]
          @parking_meters  = ParkingMeter.near(params[:location], params[:distance].to_i).where("rate = ?",  ['$1.00'|| '$1.50'||'$2.00'||'$2.50'])
        elsif params[:rate] == ["$3.00"]
          @parking_meters  = ParkingMeter.near(params[:location], params[:distance].to_i).where("rate = ?", ['$1.00'|| '$1.50'||'$2.00'||'$2.50'||'$3.00'])
        elsif params[:rate] == ["$3.50"]
          @parking_meters  = ParkingMeter.near(params[:location], params[:distance].to_i).where("rate = ?", ['$1.00'|| '$1.50'||'$2.00'||'$2.50'||'$3.00'||'$3.50'])
        elsif params[:rate] == ["$4.00"]
          @parking_meters  = ParkingMeter.near(params[:location], params[:distance].to_i).where("rate = ?", ['$1.00'|| '$1.50'||'$2.00'||'$2.50'||'$3.00'||'$3.50'||'$4.00'])
        elsif params[:rate] == ["$4.50"]
          @parking_meters  = ParkingMeter.near(params[:location], params[:distance].to_i).where("rate = ?", ['$1.00'|| '$1.50'||'$2.00'||'$2.50'||'$3.00'||'$3.50'||'$4.00'||'$4.50'])
        elsif params[:rate] == ["$5.00"]
          @parking_meters  = ParkingMeter.near(params[:location], params[:distance].to_i).where("rate = ?", ['$1.00'|| '$1.50'||'$2.00'||'$2.50'||'$3.00'||'$3.50'||'$4.00'||'$4.50'||'$5.00'])
        elsif params[:rate] == ["$5.50"]
          @parking_meters  = ParkingMeter.near(params[:location], params[:distance].to_i).where("rate = ?", ['$1.00'|| '$1.50'||'$2.00'||'$2.50'||'$3.00'||'$3.50'||'$4.00'||'$4.50'||'$5.00'||'$5.50'])
        elsif params[:rate] == ["$6.00"]
          @parking_meters  = ParkingMeter.near(params[:location], params[:distance].to_i).where("rate = ?", ['$1.00'|| '$1.50'||'$2.00'||'$2.50'||'$3.00'||'$3.50'||'$4.00'||'$4.50'||'$5.00'||'$5.50'||'$6.00'])
        else
          redirect_to :parking_meters#index
          return
        end
      else
        if params[:rate] == ["any"]
          @parking_meters  = ParkingMeter.near(params[:location], 1)
        elsif params[:rate] == ["$1.00"]
          @parking_meters  = ParkingMeter.near(params[:location], 1).where("rate = ?", ['$1.00'])
        elsif params[:rate] == ["$1.50"]
          @parking_meters  = ParkingMeter.near(params[:location], 1).where("rate = ?", ['$1.00'|| '$1.50'])
        elsif params[:rate] == ["$2.00"]
          @parking_meters  = ParkingMeter.near(params[:location], 1).where("rate = ?", ['$1.00'|| '$1.50'||'$2.00'])
        elsif params[:rate] == ["$2.50"]
          @parking_meters  = ParkingMeter.near(params[:location], 1).where("rate = ?",  ['$1.00'|| '$1.50'||'$2.00'||'$2.50'])
        elsif params[:rate] == ["$3.00"]
          @parking_meters  = ParkingMeter.near(params[:location], 1).where("rate = ?", ['$1.00'|| '$1.50'||'$2.00'||'$2.50'||'$3.00'])
        elsif params[:rate] == ["$3.50"]
          @parking_meters  = ParkingMeter.near(params[:location], 1).where("rate = ?", ['$1.00'|| '$1.50'||'$2.00'||'$2.50'||'$3.00'||'$3.50'])
        elsif params[:rate] == ["$4.00"]
          @parking_meters  = ParkingMeter.near(params[:location], 1).where("rate = ?", ['$1.00'|| '$1.50'||'$2.00'||'$2.50'||'$3.00'||'$3.50'||'$4.00'])
        elsif params[:rate] == ["$4.50"]
          @parking_meters  = ParkingMeter.near(params[:location], 1).where("rate = ?", ['$1.00'|| '$1.50'||'$2.00'||'$2.50'||'$3.00'||'$3.50'||'$4.00'||'$4.50'])
        elsif params[:rate] == ["$5.00"]
          @parking_meters  = ParkingMeter.near(params[:location], 1).where("rate = ?", ['$1.00'|| '$1.50'||'$2.00'||'$2.50'||'$3.00'||'$3.50'||'$4.00'||'$4.50'||'$5.00'])
        elsif params[:rate] == ["$5.50"]
          @parking_meters  = ParkingMeter.near(params[:location], 1).where("rate = ?", ['$1.00'|| '$1.50'||'$2.00'||'$2.50'||'$3.00'||'$3.50'||'$4.00'||'$4.50'||'$5.00'||'$5.50'])
        elsif params[:rate] == ["$6.00"]
          @parking_meters  = ParkingMeter.near(params[:location], 1).where("rate = ?", ['$1.00'|| '$1.50'||'$2.00'||'$2.50'||'$3.00'||'$3.50'||'$4.00'||'$4.50'||'$5.00'||'$5.50'||'$6.00'])
        else
          redirect_to :parking_meters#index
          return
        end
      end

      if @parking_meters.first===nil
        @location = Geocoder.coordinates(params[:location])
        if @location === nil
          @location = [49.2827, -123.1207]
        end
      else
        @pmlat = @parking_meters.first.lat
        @pmlng = @parking_meters.first.lng
        @location = [@pmlat,@pmlng]
      end
    else
      @parking_meters = nil
      @location = [49.2827, -123.1207]
    end

    @hash = Gmaps4rails.build_markers(@parking_meters) do |pm, marker|
      @pm = pm
      marker.infowindow "<p>Rate: #{pm.rate}<br>

                         Time Limit: #{pm.time_limit}<br>
                         Type: #{pm.head_type}<br>
                         Pay By Phone: #{pm.pay_by_phone}<br>
                         In Effect: #{pm.in_effect}<br>
                         Visited: #{pm.visited}<br></p>"

      marker.lat pm.lat
      marker.lng pm.lng
      marker.picture ({
                         url: "#{view_context.image_path("parking-meter.png") }",
                         width: "44",
                         height: "58"
                     })
    end
  end




  # Pull remote KML file, unzip, and store locally

  def self.unzip_file (file, destination)
    Zip::ZipFile.open(file) { |zip_file|
      zip_file.each { |f|
        f_path=File.join(destination, f.name)
        FileUtils.mkdir_p(File.dirname(f_path))
        zip_file.extract(f, f_path){true}
      }
      puts "Parking meters pulled and saved successfully"
    }
  end


  def self.parse(file)

       require 'nokogiri'

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


   end

  def show
  end

  # GET /parking_meters/new
  def new
    @parking_meter = ParkingMeter.new
  end

  # GET /parking_meters/1/edit
  def edit
  end

  # POST /parking_meters
  # POST /parking_meters.json
  def create
    @parking_meter = ParkingMeter.new(parking_meter_params)

    respond_to do |format|
      if @parking_meter.save
        format.html { redirect_to @parking_meter, notice: 'Parking meter was successfully created.' }
        format.json { render :show, status: :created, location: @parking_meter }
      else
        format.html { render :new }
        format.json { render json: @parking_meter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parking_meters/1
  # PATCH/PUT /parking_meters/1.json
  def update
    respond_to do |format|
      if @parking_meter.update(parking_meter_params)
        format.html { redirect_to @parking_meter, notice: 'Parking meter was successfully updated.' }
        format.json { render :show, status: :ok, location: @parking_meter }
      else
        format.html { render :edit }
        format.json { render json: @parking_meter.errors, status: :unprocessable_entity }
      end
    end
  end

  def favorite
    uid = params[:uid]

    @user = User.find(uid)
    id =  params[:id]
    @parking_meter = ParkingMeter.find(id)
    if  params[:type] == "unfavourite"
      @user.remove_mark :favorite, [@parking_meter]
      redirect_to :back

    elsif params[:type] == "favourite"
      @user.set_mark :favorite, [@parking_meter]
      redirect_to :back
    else
      # Type missing, nothing happens
      redirect_to :back

  end
    end

  # DELETE /parking_meters/1
  # DELETE /parking_meters/1.json
  def destroy
    @parking_meter.destroy
    respond_to do |format|
      format.html { redirect_to parking_meters_url, notice: 'Parking meter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking_meter
      @parking_meter = ParkingMeter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parking_meter_params
      params.require(:parking_meter).permit(:name, :head_type, :time_limit, :rate, :pay_by_phone, :in_effect, :lat, :lng)
    end

end
