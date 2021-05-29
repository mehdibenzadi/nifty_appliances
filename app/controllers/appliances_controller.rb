class AppliancesController < ApplicationController
  def new
    @appliance = Appliance.new
  end

  def create
    raise
  end
end
