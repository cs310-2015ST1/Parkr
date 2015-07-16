class ElectricVehiclesController < ApplicationController
  before_action :set_electric_vehicle, only: [:show, :edit, :update, :destroy]

  # GET /electric_vehicles
  # GET /electric_vehicles.json
  def index
    @electric_vehicles = ElectricVehicle.all
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

  def self.parse


    require 'openssl'
    require 'csv'
    require 'open-uri'

    file = File.expand_path('../app/assets/sources/electric_vehicle_charging_stations.csv')

#open csv and save locally
    open("ftp://webftp.vancouver.ca/OpenData/csv/electric_vehicle_charging_stations.csv") do |ftp|
      open(file, 'w') do |f|
        f.write(ftp.read)
      end
    end


    csv_text = File.read(file)
    csv = CSV.parse(csv_text, :headers =>true)
    csv.each do |row|
      ev_lat = row[0].to_f
      ev_lon = row[1].to_f

      puts ev_lat, ev_lon

      ev = ElectricVehicle.new(ev_lat, ev_lon)

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
