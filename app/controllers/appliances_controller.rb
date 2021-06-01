class AppliancesController < ApplicationController
  def add
    @appliance = Appliance.new
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
    params.require(:appliance).permit(:serial_number)
  end
end