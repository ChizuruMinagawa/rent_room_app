Rails.application.routes.draw do
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

  get 'rooms/own', to:'rooms#own'

  resources :rooms
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
