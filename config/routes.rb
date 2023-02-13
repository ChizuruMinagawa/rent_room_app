Rails.application.routes.draw do
  #deviseルーティング自動設定コード
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  
  get '/', to:'home#top'
  get '/users/account', to:'users#show'
  resources :users do
    collection do
      get '/users/profile', to:'users#profile_show'
    end
  end
  get '/users/edit', to:'users/registrations#edit'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
