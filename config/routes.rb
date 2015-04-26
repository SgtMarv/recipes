Recipes::Application.routes.draw do


    match '/ingredients/new_conversion/:id', :to => 'ingredients#new_conversion', :as => :new_conversion
    match '/ingredients/create_conversion/:id', :to => 'ingredients#create_conversion', :as => :create_conversion
    match '/ingredients/destroy_conversion/:id', :to => 'ingredients#destroy_conversion', :as => :destroy_conversion
    match '/ingredients/edit_conversion/:id', :to => 'ingredients#edit_conversion', :as => :edit_conversion
    match '/ingredients/update_conversion/:id', :to => 'ingredients#update_conversion', :as => :update_conversion
    resources :ingredients

    match '/recipes/check_recipe_path', :to => 'recipes#check', :as => :check_recipe

    match 'recipes/remove_ingredient/:id', :to => 'recipes#remove_ingredient', :as => :remove_ingredient
    match '/recipes/add_ingredient/:id', :to => 'recipes#add_ingredient', :as => :add_ingredient
    match '/recipes/check_ingredient/:id', :to => 'recipes#check_ingredient', :as => :check_ingredient
    match '/recipes/insert_ingredient/:id', :to => 'recipes#insert_ingredient', :as => :insert_ingredient
    match '/recipes/remove_image/:id', :to => 'recipes#delete_image', :as => :remove_image
    resources :recipes
    
    resources :units
    
    resources :categories

    match '/menus/add_recipe/:id', :to => 'menus#add_recipe', :as => :add_recipe
    match '/menus/insert_recipe/:id', :to => 'menus#insert_recipe', :as => :insert_recipe
    match '/menus/remove_recipe/:id', :to => 'menus#remove_recipe', :as => :remove_recipe
    match '/menus/shopping_list/:id', :to => 'menus#shopping_list', :as => :shopping_list
    match '/menus/recipe_list/:id', :to => 'menus#recipe_list', :as => :recipe_list
    resources :menus

    resources :allergies


    root :to => 'pages#index'


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
