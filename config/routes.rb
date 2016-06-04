Rails.application.routes.draw do
   
  devise_for :users

  get 'admin/index', as: 'user_root'

  get 'admin/index'
  get 'employee/index'

  
  get  'departament/index'
  get  'departament/new'
  post 'departament/create'=> 'departament#create', as: 'create_departament'
  put 'departament/:id' => 'departament#update', as: 'update_departament'
  delete 'departament/:id' => 'departament#destroy', as: 'delete_departament'

  resources :departament

  get  'employee/index' => 'employee#index', as: 'employee'
  get  'employee/new'
  get  'employee/:id/edit' => 'employee#edit', as: 'edit_employee'
  post 'employee/create'=> 'employee#create', as: 'create_employee'
  put 'employee/:id' => 'employee#update', as: 'update_employee'
  delete 'employee/:id' => 'employee#destroy', as: 'delete_employee'

  resources :employee


  get  'dayoff/index' => 'dayoff#index', as: 'dayoff'
  get  'dayoff/new'
  get  'dayoff/:id/edit' => 'dayoff#edit', as: 'edit_dayoff'
  post 'dayoff/create'=> 'dayoff#create', as: 'create_dayoff'
  delete 'dayoff/:id' => 'dayoff#destroy', as: 'delete_dayoff'

  resources :dayoff
  #match '/department',   to: 'department#index',   via: 'get'
  #match '/employee',   to: 'employee#index',   via: 'get'
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
