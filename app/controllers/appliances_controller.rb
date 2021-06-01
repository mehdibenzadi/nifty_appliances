class AppliancesController < ApplicationController
  def add
    @appliance = Appliance.first
  end

  def update
    @appliance.update_attribute(:serial_number, newserialnumber)
  end
end
