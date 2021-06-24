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
    # number of months to do the analysis on
    number_of_month = 12
    # range to do the analysis on
    range = Time.new(number_of_month.months.ago.year,number_of_month.months.ago.month,1)..Time.now
    # count cycle per month
    cycles = Event.where(event_type: "cycle", created_at: Time.new(number_of_month.months.ago.year,number_of_month.months.ago.month,1)..Time.now).group("DATE_TRUNC('month', created_at)").count
    # month_array = (Time.new(number_of_month.months.ago.year,number_of_month.months.ago.month,1).month..Time.now.month).to_a
    # Array of dates
    date_array = (Date.new(number_of_month.months.ago.year,number_of_month.months.ago.month,1)..Date.today).map{|d| [d.year, d.month]}.uniq
    # To have O in value for empty months
    @value_array = [0]*date_array.count
    # Prepare string value for the graph
    @stringdate_array = [""]*date_array.count
    date_array.each_index {|c| @stringdate_array[c] = "#{date_array[c][1]}/#{date_array[c][0]}"}

    # fill the @value_array table with values when different from 0
    cycles.each { |k, v| @value_array[date_array.find_index{|x| x == [k.year,k.month]}] = v }
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