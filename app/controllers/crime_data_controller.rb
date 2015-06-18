class CrimeDataController < ApplicationController
  before_action :set_crime_datum, only: [:show, :edit, :update, :destroy]

  # GET /crime_data
  # GET /crime_data.json
  def index
    @crime_data = CrimeDatum.all
  end

  # GET /crime_data/1
  # GET /crime_data/1.json
  def show
  end

  # GET /crime_data/new
  def new
    @crime_datum = CrimeDatum.new
  end

  # GET /crime_data/1/edit
  def edit
  end

  # POST /crime_data
  # POST /crime_data.json
  def create
    @crime_datum = CrimeDatum.new(crime_datum_params)

    respond_to do |format|
      if @crime_datum.save
        format.html { redirect_to @crime_datum, notice: 'Crime datum was successfully created.' }
        format.json { render :show, status: :created, location: @crime_datum }
      else
        format.html { render :new }
        format.json { render json: @crime_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crime_data/1
  # PATCH/PUT /crime_data/1.json
  def update
    respond_to do |format|
      if @crime_datum.update(crime_datum_params)
        format.html { redirect_to @crime_datum, notice: 'Crime datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @crime_datum }
      else
        format.html { render :edit }
        format.json { render json: @crime_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crime_data/1
  # DELETE /crime_data/1.json
  def destroy
    @crime_datum.destroy
    respond_to do |format|
      format.html { redirect_to crime_data_url, notice: 'Crime datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crime_datum
      @crime_datum = CrimeDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crime_datum_params
      params.require(:crime_datum).permit(:lat, :lon)
    end
end
