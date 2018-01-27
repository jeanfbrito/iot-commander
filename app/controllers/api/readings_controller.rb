class Api::ReadingsController < ApplicationController
  skip_before_action :verify_authenticity_token
  #before_action :set_reading, only: [:show, :edit, :update, :destroy]
  
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  # POST /readings
  # POST /readings.json
  def create
    device = Device.find_by(uid: params[:uid])
    reading = device.readings.build(reading_params)
    reading.data = JSON.parse(reading_params[:data])
    reading.timestamp = Time.at(reading_params[:timestamp])
    if reading.save
      render json: reading, status: :created
    else
      render json: reading.errors, status: :unprocessable_entity
    end
  end

  private

  def record_not_found
    render json: { 'errors': 'Não encontrado' }, status: :not_found
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def reading_params
    params.permit(:data, :timestamp)
  end
end
