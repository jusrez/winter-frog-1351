Rails.application.routes.draw do
  get '/plots', to: 'plots#index'
  delete '/plots/:plot_id/plant/:id', to: 'plot_plants#destroy'
end
