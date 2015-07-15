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
