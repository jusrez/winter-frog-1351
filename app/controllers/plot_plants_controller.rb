class PlotPlantsController < ApplicationController

  def destroy
    PlotPlant.find_by_plant_id(params[:id]).destroy
    redirect_to '/plots'
  end
end