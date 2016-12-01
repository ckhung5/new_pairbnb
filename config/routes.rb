Rails.application.routes.draw do
  get 'transaction/new'

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :listings do
   resources :reservations 
  end
  namespace :admin do
    resources :reservations
  end

  # resources :users, controller: "clearance/users", only: [:create] do
  resources :users, controller: 'users', only: :create do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end 
  
  resources :transactions, only: [:new, :create]

  

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  get "/" => "welcome#index", as: "welcome"
  get "/listings/:id/upload" => "listings#upload", as: "upload"
  post "/listings/:id/submit_upload" => "listings#submit_upload", as: "submit_upload"
  delete "/listings/:id/photo_delete" => "listings#photo_delete", as: "photo_delete"
  post "/listings_search/" => "listings#search", as: "listings_search"
  get "/listings_filter/" => "listings#filter", as: "listings_filter"
  # post "/" => "users#selection", as: "users_selection"
  #Listings
  # get "/listings" => "listings#index", as: "full_listings"
  # get "/listings/new" => "listings#new", as: "new_listing"
  # post "/listings" => "listings#create", as: "create_listing"
  # get "/listings/:id" => "listings#show", as: "show_list"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  
  root 'welcome#index'



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
