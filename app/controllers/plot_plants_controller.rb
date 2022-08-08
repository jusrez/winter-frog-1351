class PlotPlantsController < ApplicationController
  def destroy
    PlotPlant.find(params[:id]).destroy
    redirect_to '/plots'
  end
end