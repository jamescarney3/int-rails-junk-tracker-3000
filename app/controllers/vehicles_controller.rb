class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[ show edit update destroy ]

  # GET /vehicles or /vehicles.json
  def index
    @vehicles = Vehicle.all
  end

  # GET /vehicles/1 or /vehicles/1.json
  def show
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit
    @details = @vehicle.details
  end

  # POST /vehicles or /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.details = generate_details(type_param[:vehicle_type])
    @vehicle.registration_id = VehicleRegistrationService.register_vehicle @vehicle

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: "Vehicle was successfully created." }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1 or /vehicles/1.json
  def update
    details = @vehicle.details
    details.attributes = detail_params

    respond_to do |format|
      if @vehicle.update(vehicle_params) && details.update(detail_params)
        format.html { redirect_to @vehicle, notice: "Vehicle was successfully updated." }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1 or /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: "Vehicle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    def generate_details(vehicle_type)
      case vehicle_type
      when 'sedan'
        return Sedan.new(detail_params)
      when 'coupe'
        return Coupe.new(detail_params)
      when 'minivan'
        return Minivan.new(detail_params)
      when 'motorcycle'
        return Motorcycle.new(detail_params)
      else
        return nil
      end
    end

    # Only allow a list of trusted parameters through.
    def vehicle_params
      params.require(:vehicle).permit(:nickname, :mileage, :wheels, :engine_status)
    end

    # all the params we use to make vehicle details
    def detail_params
      params.require(:vehicle).permit(:doors, :seat_status, { door_configuration: {} })
    end

    # define this separately since we don't pass it directly to either initializer
    def type_param
      params.require(:vehicle).permit(:vehicle_type)
    end
end
