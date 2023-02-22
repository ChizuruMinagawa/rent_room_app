Rails.application.routes.draw do
  get 'reservations/index'
  get 'rooms/show'
  #deviseルーティング自動設定コード
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  get '/', to:'home#top'

  get '/users/profile', to:'users#show'
  resources :users do
    collection do
      get 'account', to:'users#account_show'
    end
  end


  
  resources :rooms do
    collection do
      get :own
    end
  end
  resources :rooms do
    collection do
      get :search
    end
  end  
  resources :rooms

  resources :reservations do
    collection do
      post :confirm, only: :confirm
    end
  end
  resources :reservations
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
