NewsReader::Application.routes.draw do

  resources :index,  :except => [:show]
  root 'index#top'

  #get "index/test" => "index#test"

  match 'news/us_and_canada', to: 'index#us_and_canada', via: 'get'
  match 'news/tech', to: 'index#technology', via: 'get'
  match 'news/business', to: 'index#business', via: 'get'
  match 'news/world', to: 'index#world', via: 'get'
  match 'news/top', to: 'index#top', via: 'get'
  match 'news/science', to: 'index#science', via: 'get'
  match 'news/entertainment', to: 'index#entertainment', via: 'get'
  match 'news/sports', to: 'index#sports', via: 'get'
  match 'news/politics', to: 'index#politics', via: 'get'

  #get "static_pages/why_us"
  
  #get "orders/vegetarian" => "orders#vegetarian"
  #match '/index',  to: 'index#index',            via: 'get'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root
  

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
