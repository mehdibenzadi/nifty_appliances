class AppliancesController < ApplicationController
  layout "appliance"

  def add
    @serial_number = params[:serial_number]
    if (isdiscoverable(@serial_number) && Appliance.exists?(serial_number:@serial_number))
      # On lie l'appliance
      @appliance = Appliance.find_by(serial_number:appliance_params[:serial_number])
      @appliance.user_id = current_user.id
      @appliance.save
      # Clean the SerialNumber table 
      SerialNumber.where(:value => @serial_number).delete_all
      redirect_to root_path
    else
      raise
    end
    # verifier si serial est dans la DB de discovery
    # Si oui, l'ajouter.
    # raise
  end

  def index
    if current_user.repairer == false
      @appliances = current_user.appliances
    else
      @appliances = current_user.permitted_appliances
    end
  end

  def show 
    # using created_at for now
    @appliance = Appliance.find(params[:id])
    @laststatusevent = Event.where(serial_number: @appliance.serial_number, event_type: "status").order(created_at: :desc).last
    if current_user.repairer
      @events = Event.where(serial_number: @appliance.serial_number, event_type: ["error"]).order(created_at: :desc).first(9)
      @events = @events << @laststatusevent
      @events = @events.sort_by{|e| e.created_at}.reverse!
    else
      @events = Event.where(serial_number: @appliance.serial_number, event_type: ["error", "discoverable","cycle"]).order(created_at: :desc).first(9)
      @events = @events << @laststatusevent
      @events = @events.sort_by{|e| e.created_at}.reverse!
    end
    range = Time.new(3.months.ago.year,3.months.ago.month,1)..Time.now
    cycles = Event.where(event_type: "cycle", created_at: Time.new(3.months.ago.year,3.months.ago.month,1)..Time.now).group("DATE_TRUNC('month', created_at)").count
    month_array = (Time.new(3.months.ago.year,3.months.ago.month,1).month..Time.now.month).to_a
    value_array = [0]*month_array.count
    cycles.each { |k, v| value_array[month_array.find_index(k.month)] = v }
    raise
  end

  def validation
    @serial_number = params[:serial_number]
    if (isdiscoverable(@serial_number) && Appliance.exists?(serial_number:@serial_number))
      # on donne le temps à la requête d'arriver
      make_discoverable(@serial_number)
      render :inline => "true"
    else
      render :inline => "false"
    end
  end

  def remove
    @appliance = Appliance.find(params[:id])
    @appliance.user_id = ""
    @appliance.save
    redirect_to root_path
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