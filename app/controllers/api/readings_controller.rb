class ReadingsController < ApplicationController
  before_action :set_reading, only: [:show, :edit, :update, :destroy]

  # POST /readings
  # POST /readings.json
  def create
    @reading= @device.readings.build(reading_params)

    respond_to do |format|
      if @reading.save
        format.html { redirect_to [@vehicle, :refuellings], notice: 'Refuelling was successfully created.' }
        format.json { render :show, status: :created, location: @refuelling }
      else
        format.html { render :new }
        format.json { render json: @refuelling.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def reading_params
      params.require(:reading).permit(:data, :timestamp, :device_id)
    end
end
