Rails.application.routes.draw do

  root 'properties#index'

  resources :properties, shallow: true do
    resources :photos
  end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

end
