Rails.application.routes.draw do
  get '/plots', to: 'plots#index'
  
  delete '/plots/:plot_id/plant/:id', to: 'plot_plants#destroy'

  get '/gardens/:id', to: 'gardens#show'
end
