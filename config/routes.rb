Rails.application.routes.draw do
  resources :feeds do
    collection do
      post :confirm
    end
  end
  
  resources :contacts
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  root "posts#index"
 # get '/', to: 'posts#index'

 resources :users, only: [:new, :create, :show, :edit, :update]

 resources :sessions, only: [:new, :create, :destroy]

 resources :favorites, only: [:create, :destroy]

  resources :posts do
    collection do
      post :confirm
      get :favorite_list

    end
  end

end
