Rails.application.routes.draw do

  root 'properties#index'

  resources :photos, only: [:edit, :update, :destroy]
  resources :properties

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

end
