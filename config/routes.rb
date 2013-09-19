PandatRavelBy::Application.routes.draw do
  resources :countries, only: [:index, :show]
  resources :news, only: [:index, :show]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :tours, only: [:index, :show]
  resources :articles, only: [:index, :show]
  resources :visas, only: [:index, :show]
  resources :contacts, only: [:index]

  # match '/articles', to: 'articles#index', via: 'get'
  # match '/articles/:id', to: 'articles#show', via: 'get'
  # match '/contacts', to: 'contacts#index', via: 'get'
  # match '/tours', to: 'tours#index', via: 'get'
  # match '/tours/:id', to: 'tours#show', via: 'get'
  # match '/visas', to: 'visas#index', via: 'get'
  # match '/visas/:id', to: 'visas#show', via: 'get'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
