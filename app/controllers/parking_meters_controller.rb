class ParkingMetersController < ApplicationController
  before_action :set_parking_meter, only: [:show, :edit, :update, :destroy]

  # GET /parking_meters
  # GET /parking_meters.json
  def index
    @parking_meters = ParkingMeter.all
  end

  # GET /parking_meters/1
  # GET /parking_meters/1.json
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
      params.require(:parking_meter).permit(:name, :head_type, :time_limit, :rate, :credit, :pay_by_phone, :in_effect, :lat, :lng)
    end
end
