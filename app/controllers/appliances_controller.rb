class AppliancesController < ApplicationController
  def add
    @appliance = Appliance.new
  end
end
