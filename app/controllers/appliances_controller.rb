class AppliancesController < ApplicationController
  layout "appliance"

  def add
    if isdiscoverable (appliance_params[:serial_number])
      #on crée une permission
      raise
    else
      raise
    end
    # verifier si serial est dans la DB de discovery
    # Si oui, l'ajouter.
    # raise
  end

  def index
    @appliances = current_user.appliances
  end

  def show 
    @appliance = Appliance.find(params[:id])
    @events = Event.where(serial_number: @appliance.serial_number).order(occurs_at: :desc).first(10)
  end

  def link_user
    # trouver l'appliance qui correspond au serial number passé dans les params
    @appliance = Appliance.find_by(serial_number:appliance_params[:serial_number])
    if @appliance.nil? 
      redirect_to add_appliances_path, alert: "Couldn't find the appliance you where looking for. Try again."
      return
    end
    # update l'user_id à celle du current_user
    @appliance.user = current_user
    @appliance.save
    redirect_to add_appliances_path, notice: "Appliance added!"
  end
  
  private

  def appliance_params
    params.permit(:serial_number, :appliance)
  end
end