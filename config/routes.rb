LoveLetters::Application.routes.draw do
  devise_for :users
  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'welcome/index'
  get 'how_it_works' => 'welcome#how_it_works'
  get 'about_us' => 'welcome#about_us'
  get 'dashboard' => 'dashboard#index'

  get '/events/subregion_options' => 'events#subregion_options'
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  resources :users, only: [:show] do
    resources :profile
    resources :messages, except: [:edit, :update]
    resources :favourites, only: [:create, :destroy, :index]
    resources :events, except: [:edit, :update]
    resources :products, only: [:new, :create, :index]
    resources :services, only: [:new, :create, :index]
  end
  resources :messages, except: [:edit, :update]
  resources :search
  resources :events, except: [:edit, :update]
  resources :products, only: [:new, :create, :index]
  resources :services, only: [:new, :create, :index]

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
