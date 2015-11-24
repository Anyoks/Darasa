Rails.application.routes.draw do
  namespace :api do
  namespace :v1 do
    get 'processpayment/process'
    end
  end

  resources :responses
    # resources :answerss
  
  resources :questions
  mount Ckeditor::Engine => '/ckeditor'
 # resources :exams
  resources :cats
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  devise_scope :user do
    authenticated :user do
      root 'exams#index'
    end
    unauthenticated :user do
      root :to => 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  # root "public/index"


  resources :universities
  resources :courses
  resources :years
  resources :semesters
  resources :units
  resources :topics

  resources :topics do
    member do
      get :download
    end
  end

  resources :cats do
    member do
      get :download
    end
  end    

  resources :exams do
    member do
      resources :questions do 
        resources :responses
      end
      get :download
      put :accept_tos
    end
  end

  namespace :api do
    namespace :v1 do
      # resources :details, defaults: { format: 'json' }
      post "/pay", :to => 'payments#pay'
      get "/pay", :to => 'payments#show'
      get "/index", :to => 'payments#index'
      get "/user_details", :to => 'details#show'
      devise_scope :user do
        post "/sign_in", :to => 'sessions#create'
        delete "/sign_out", :to => 'sessions#destroy'
        post "/sign_up", :to => 'registrations#create'#, :as => 'register'
      end
    end
  end

  # namespace :api do
  #   namespace :v1 do
  #     post "/pay", :to => 'payments#pay'
  #   end
  # end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  

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
