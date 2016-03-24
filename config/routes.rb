require 'sidekiq/web'

Rails.application.routes.draw do
  get 'actvities/unit'

  get 'actvities/topic'

  get 'actvities/question'

  namespace :api do
  namespace :v1 do
    get 'google/google'
    end
  end

  get 'smses/index'

  get 'smses/show'

  get 'smses/destroy'

  get 'user/index'

  get 'user/show'

  get 'purchases/index'

  get 'purchases/show'

  get 'subtopics/index'

  get 'subtopics/show'

  get 'subtopics/edit'

  get 'subtopics/destroy'

  get 'subtopics/new'

  get 'subtopics/create'

  get 'subtopics/update'

  get 'subtopics/destroy'

  namespace :api do
  namespace :v1 do
    # post '/sms', :to => 'sms#sms'
    post '/sms', :to => 'sms#sms'
    resources :sms
     # get "/units", :to => 'units#index'
    end
  end

  namespace :api do
  namespace :v1 do
    get 'processpayment/process(:parameters)' , :to => "processpayment#process"
        end
      end
    
      resources :responses
        # resources :answerss
      
      resources :questions
  mount Ckeditor::Engine => '/ckeditor'
 # resources :exams
  resources :cats
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  mount Sidekiq::Web => '/sidekiq'
  devise_scope :user do
    authenticated :user do
      root 'subtopics#index'
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
  resources :subtopics

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

  resources :subtopics do
      resources :questions do 
        resources :responses
    end
    post '/upload' , :to => 'subtopics#upload'
    get '/upload', :to => 'subtopics#upload_show'
  end

  
  namespace :api do
    namespace :v1 do
      # resources :details, defaults: { format: 'json' }

      #show subtopics
      get  "/subtopics", :to => 'subtopics#index'
       # get  "/subtopics", :to => 'subtopics#all_questions_in_topic'
      # get "/"
      # get "/toics/:id", :to => 'topics#show'

      #show topics 
      get  "/topics", :to => 'topics#index'
      #show all questions in this topic (i.e questions in all subtopics)
      get "/questions", :to => 'topics#show'

      #show units routes
      get "/units", :to => 'units#index'
      get "/units/:id", :to => 'units#show'
      #show exams
      get "/exams", :to => 'exams#index'
      get "/exams/:id", :to => 'exams#show'
      #show terms and conditions
      get "/terms", :to => 'terms#show'
      #show answers
      get "/answers", :to => 'exams#answer'

      #show order_url
      get "/url", :to => 'url#show'

      #facebook login
      get "/auth/facebook_access_token/callback", :to => 'facebook#facebook'
      post "/auth/facebook_access_token/callback", :to => 'facebook#facebook'
      #google Login
      post "/google_sign_up", :to => 'google#google'#, :as => 'register'
      
      #payments
      post "/pay", :to => 'payments#pay'
      get "/pay", :to => 'payments#show'
      get "/index", :to => 'payments#index'

      #user details
      get "/user_details", :to => 'details#show_user_details'
      get "/is_owner", :to => 'details#do_i_own_this_topic'
      get "/unit_name", :to => 'details#show_unit' # remove this end point
      get "/my_topics", :to => 'details#my_topics'

      devise_scope :user do
        post"/update", :to => 'registrations#update'
        post "/sign_in", :to => 'sessions#create'
        delete "/sign_out", :to => 'sessions#destroy'
        post "/sign_up", :to => 'registrations#create'#, :as => 'register'
      end
    end
  end

  # devise_for :users    
  delete 'user/:id' => 'user#destroy', :via => :delete #, :as => :admin_destroy_user
  get 'user/:id' => 'user#show', as: :user
  # get 'user/:id'
  resources :user do
    get :make_moderator
    get :make_normal_user
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
