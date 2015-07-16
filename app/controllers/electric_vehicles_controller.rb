class ElectricVehiclesController < ApplicationController
  before_action :set_electric_vehicle, only: [:show, :edit, :update, :destroy]

  require 'openssl'
  require 'open-uri'

  # GET /electric_vehicles
  # GET /electric_vehicles.json
  def index
    @electric_vehicles = ElectricVehicle.all
    @json = ElectricVehicle.all.to_gmaps4rails
    respond_to do |format|
      format.html
      format.json {render json: @electric_vehicles}
    end

    @evs = Gmaps4rails.build_markers(@electric_vehicles) do |ev, ev_marker|
      @ev = ev
      ev_marker.lat ev.lat
      ev_marker.lng ev.lon
      ev_marker.picture ({
                         url: "#{view_context.image_path("EV.png") }",
                         width: "44",
                         height: "58"
                     })
    end
  end

  # GET /electric_vehicles/1
  # GET /electric_vehicles/1.json
  def show
  end

  # GET /electric_vehicles/new
  def new
    @electric_vehicle = ElectricVehicle.new
  end

  # GET /electric_vehicles/1/edit
  def edit
  end

  # POST /electric_vehicles
  # POST /electric_vehicles.json
  def self.pull


    file = File.expand_path('app/assets/sources/electric_vehicle_charging_stations.csv')

#open csv and save locally
    open("ftp://webftp.vancouver.ca/OpenData/csv/electric_vehicle_charging_stations.csv") do |ftp|
      open(file, 'w') do |file|
       if file.write(ftp.read)
         puts "EV chargers pulled and saved successfully"
       end
      end
    end
  end

  def self.parse

    require 'csv'

    csv_text = File.read(File.expand_path('app/assets/sources/electric_vehicle_charging_stations.csv'))
    csv = CSV.parse(csv_text, :headers =>true)
    csv.each do |row|
      ev = ElectricVehicle.new
      ev.lat = row[0].to_f
      ev.lon = row[1].to_f

      puts ev.lat, ev.lon

      if ev.save!
        puts "EV save successful"
      else
        puts "EV save not successful"
      end

    end
  end

  def create
    @electric_vehicle = ElectricVehicle.new(electric_vehicle_params)

    respond_to do |format|
      if @electric_vehicle.save
        format.html { redirect_to @electric_vehicle, notice: 'Electric vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @electric_vehicle }
      else
        format.html { render :new }
        format.json { render json: @electric_vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /electric_vehicles/1
  # PATCH/PUT /electric_vehicles/1.json
  def update
    respond_to do |format|
      if @electric_vehicle.update(electric_vehicle_params)
        format.html { redirect_to @electric_vehicle, notice: 'Electric vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @electric_vehicle }
      else
        format.html { render :edit }
        format.json { render json: @electric_vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /electric_vehicles/1
  # DELETE /electric_vehicles/1.json
  def destroy
    @electric_vehicle.destroy
    respond_to do |format|
      format.html { redirect_to electric_vehicles_url, notice: 'Electric vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_electric_vehicle
      @electric_vehicle = ElectricVehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def electric_vehicle_params
      params.require(:electric_vehicle).permit(:lat, :lon)
    end
end
