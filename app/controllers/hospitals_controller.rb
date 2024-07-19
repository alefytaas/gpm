# app/controllers/hospitals_controller.rb

class HospitalsController < ApplicationController
  def setores
    hospital = Hospital.find(params[:id])
    render json: hospital.setores
  end
end
