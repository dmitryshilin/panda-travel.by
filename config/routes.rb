PandatRavelBy::Application.routes.draw do

  get "static_pages/contacts"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/resttypes/:rest_type_id', to: 'tours#byresttypes', as: :resttypes
  # get '/visas/for/:tour_id', to: 'visas#index', as: :visas_for_tour

  # get '/resttypes/', to: 'tours#index'

  resources :tours, only: [:index, :show] do
    resources :orders, only: [:create]
  end


  resources :articles, only: [:index, :show]
  resources :visas, only: [:index] do
    collection do
      get '/for/:tour_id', to: 'visas#for', as: :tour
    end
  end

  resources :contacts, only: [:index]
  resources :countries, only: [:index, :show]
  resources :news, only: [:index, :show]

  #get 'static_pages/contacts'
  get '/modal/:name(/:model/:id)', to: 'application#modal', as: :modal

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
